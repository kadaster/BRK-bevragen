# language: nl
Functionaliteit: URI templating
    Als API provider
    wil ik uri templating kunnen gebruiken
    zodat grote aantallen links naar dezelfde API in de response kunnen worden gerepresenteerd door één URI template
    zodat ik geen url's naar externe API's hoeft te beheren

    Zoals gespecificeerd in RFC 6570 (https://tools.ietf.org/html/rfc6570):
    - Een URI template is een string die 0 of meer expressies bevat, waarmee een verzameling van URI's kan worden beschreven
    - Een expression is de tekst tussen een open accolade '{' en een sluit accolade '}' inclusief de accolade tekens
    - Expanden van een template is het vervangen van een expression door een waarde.
      De manier van expanden wordt bepaald door een optionele operator in de expression. Voor meer info zie: [Expressions](https://tools.ietf.org/html/rfc6570#section-2.2)

    Op het moment van specificeren (18-05-2020) wordt in de Haal Centraal API's alleen de meest simpele 'Simple String Expansion' expression gebruikt,
    een {expression} wordt vervangen door een variabele

    Afspraken:
    - gebruik {[xxx]serverurl} als placeholder voor de server url van externe API url's
      [xxx] is de afkorting die wordt gebruikt voor de externe API.
      Op het moment van specificeren worden de volgende serverurl placeholders gebruikt in de Haal Centraal API's:
      - {brpserverurl}
      - {bagserverurl}
      - {brkserverurl}
      - {hrserverurl}
    - gebruik {propertynaam} als placeholder in een resource path. propertynaam is:
      - de naam van een property van de resource of
      - de naam van een property van een gegevensgroep van de resource.
        Gebruik in dit geval de naam van de gegevensgroep gevolgd door een punt als prefix, bijv. persoon.identificatie, woonadres.adresIdentificatie
    - indien de lijst met identificaties, die gebruikt wordt om samen met de templated link de daadwerkelijke links op te bouwen, leeg is wordt de templated link niet opgenomen.

  Scenario: Verwijzing naar één externe Resource
    Gegeven een KadastraalOnroerendeZaak heeft een verwijzing via de 'adresIdentificatie' property naar een Adres
    En een Adres is te bevragen bij de BAG API via endpoint '/adressen'
    Als een templated Hal link voor de Adres is gegenereerd
    Dan is de Hal link naar de Adres gelijk aan
    | href                                         | templated |
    | {bagserverurl}/adressen/{adresIdentificatie} | true      |

  Scenario: Verwijzing naar één externe Resource via gegevensgroep property
    Gegeven een KadastraalOnroerendeZaak heeft een verwijzing via de 'adresIdentificatie' property van gegevensgroep 'woonadres' naar een Adres
    En een Adres is te bevragen bij de BAG API via endpoint '/adressen'
    Als een templated Hal link voor de Adres is gegenereerd
    Dan is de Hal link naar de Adres gelijk aan
    | href                                                   | templated |
    | {bagserverurl}/adressen/{woonadres.adresIdentificatie} | true      |

  Scenario: Verwijzingen naar meerdere externe Resources van dezelfde soort
    Gegeven een KadastraalOnroerendeZaak heeft een verwijzing via de 'adresIdentificaties' property naar meerdere Adressen
    En een Adres is te bevragen bij de BAG API via endpoint '/adressen'
    Als een templated Hal link voor de Adressen is gegenereerd
    Dan is de Hal link naar de Adressen gelijk aan
    | href                                          | templated |
    | {bagserverurl}/adressen/{adresIdentificaties} | true      |

  Scenario: Verwijzing naar verschillende externe en interne Resources
    Gegeven een ZakelijkGerechtigde heeft een verwijzing via de 'identificatie' property naar een Ingeschreven Natuurlijk Persoon
    En een Ingeschreven Natuurlijk Persoon is te bevragen bij de BRP API via de endpoint /ingeschrevenpersonen
    En een ZakelijkGerechtigde heeft een verwijzing via de 'identificatie' property naar een Ingeschreven Niet Natuurlijk Persoon
    En een Ingeschreven Niet Natuurlijk Persoon is te bevragen bij de BRK via de endpoint /kadasternietnatuurlijkpersonen
    Als een templated Hal link voor de Personen is gegenereerd
    Dan is de Hal link naar de Persoon van het type ingeschreven_natuurlijk_persoon gelijk aan
    | href                                                | templated |
    | {brpserverurl}/ingeschrevenpersonen/{identificatie} | true      |
    En is de Hal link naar de Persoon van het type ingeschreven_niet_natuurlijk_persoon gelijk aan
    | href                                            | templated |
    | /kadasternietnatuurlijkpersonen/{identificatie} | true      |

  Scenario: Expanden van een templated url
    Gegeven de json response fragment van een kadastraal onroerende zaak
    """
    {
      "_link": {
        "adressen": {
          "href": "{bagserverurl}/adressen/{adresidentificaties}",
          "templated": true
        }
      },
      "adresidentificaties": [
        "0518200000437093",
        "0518200000812475"
      ]
    }
    """
    En de server url van de BAG API is gelijk aan 'https://api.bag.kadaster.nl/esd/huidigebevragingen/v1'
    Als de templated adressen url is ge-expand voor de adresidentificaties
    Dan zijn de ge-expande urls
    | ge-expande urls                                                                 |
    | https://api.bag.kadaster.nl/esd/huidigebevragingen/v1/adressen/0518200000437093 |
    | https://api.bag.kadaster.nl/esd/huidigebevragingen/v1/adressen/0518200000812475 |

  Scenario: Uitsluiten van properties die een placeholder functie hebben met de fields parameter
    Gegeven een KadastraalOnroerendeZaak heeft een verwijzing via de 'adresIdentificaties' property naar meerdere Adressen
    Als met de fields parameter specifieke properties worden opgevraagd
    En met de fields parameter de 'adresIdentificaties' property niet wordt opgevraagd
    En met de fields parameter de '_links.adressen' property niet wordt opgevraagd
    Dan bevat de response geen '_links.adressen' property

  Scenario: Meenemen van properties die een placeholder functie hebben bij het opvragen van templated link properties met de fields parameter
    Gegeven een KadastraalOnroerendeZaak heeft een verwijzing via de 'adresIdentificaties' property naar meerdere Adressen
    Als met de fields parameter de '_links.adressen' property wordt opgevraagd en de 'adresIdentificaties' property niet
    Dan bevat de response toch de 'adresIdentificaties' property

  Scenario: Meenemen van templated link properties bij het opvragen van properties die een placeholder functie hebben met de fields parameter
    Gegeven een KadastraalOnroerendeZaak heeft een verwijzing via de 'adresIdentificaties' property naar meerdere Adressen
    Als met de fields parameter de 'adresIdentificaties' property wordt opgevraagd en de '_links.adressen' property niet
    Dan bevat de response toch de '_links.adressen' property

  Scenario: Geen templated link leveren als de properties die een placeholder functie hebben niet aanwezig zijn (er is geen gerelateerde resource)
    Gegeven een KadastraalOnroerendeZaak heeft geen verwijzing via de 'adresIdentificaties' property naar een Adres
    Als de KadastraalOnroerendeZaak wordt opgevraagd
    Dan bevat de response geen '_links.adressen' property
