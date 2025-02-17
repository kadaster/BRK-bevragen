# language: nl

# Nederlandse API Strategie:
# API-12 Representatie op maat wordt ondersteund
# Het is mogelijk om een door komma's gescheiden lijst van attribuutnamen op te geven met de query-parameter fields om een representatie op maat te krijgen. Als niet-bestaande attribuutnamen worden meegegeven wordt een 400 Bad Request teruggegeven.

# De gebruiker van een API heeft niet altijd de volledige representatie (lees alle attributen) van een resource nodig. De mogelijkheid bieden om de gewenste attributen te selecteren helpt bij het beperken van het netwerkverkeer (relevant voor lichtgewicht toepassingen), vereenvoudigt het gebruik van de API en maakt deze aanpasbaar (op maat). Om dit mogelijk te maken wordt de query-parameter fields ondersteund. De query-parameter accepteert een door komma's gescheiden lijst met attribuutnamen. Het resultaat is een representatie op maat.
# In het geval van HAL zijn de gelinkte resources embedded in de standaard representatie. Met de hier beschreven fields parameter ontstaat de mogelijkheid om de inhoud van de body naar behoefte aan te passen.

Functionaliteit: Aanpasbare representatie met de fields parameter
  Het is mogelijk om een door komma's gescheiden lijst van attribuutnamen op te geven met de query-parameter fields om een representatie op maat te krijgen. Hierin kan elk attribuut van de resource worden opgenomen met exact de naam zoals deze wordt opgenomen in het antwoord.

  Wanneer de fields parameter niet wordt meegegeven in het request, worden alle attributen van de resource die een waarde hebben en waarvoor de afnemer (gemeente) is geautoriseerd teruggegeven in het antwoord. Dit is inclusief een verwijzing naar alle relaties in _links.

  Wanneer de fields parameter is meegegeven in het request, worden alleen de attributen van de resource teruggegeven die zijn genoemd in de fields parameter, een waarde hebben en waarvoor de afnemer is geautoriseerd.
  Dus wanneer de gebruiker vraagt om gegevens waarvoor zij of hij niet geautoriseerd is, wordt er minder teruggegeven dan er gevraagd is in de fields-parameter.

  Wanneer het endpoint een collectie van resources teruggeeft, worden in fields de properties van de resource opgenomen. Bovenliggende berichtelementen die de collectie definieren worden hierbij niet opgenomen. Om bijvoorbeeld de straat en huisnummer te vragen in een collectie van adressen gaat met fields=straat,huisnummer. Dus niet met _embedded.adressen.straat,_embedded.adressen.huisnummer.

  Gevraagde attributen worden komma-gescheiden opgesomd. Bijvoorbeeld fields=burgerservicenummer,naam,geslachtsaanduiding.
  Gevraagde attributen kunnen in willekeurige volgorde worden opgenomen in de fields parameter. De volgorde waarin de gevraagde attributen worden opgesomd in de fields parameter heeft geen invloed op de volgorde waarin deze attributen worden opgenomen in het antwoord (volgorde is niet relevant in een json object).

  Groepen kunnen in gezamenlijkheid worden gevraagd door de naam van de groep op te nemen in de fields-parameter. In dat geval worden alle attributen van de groep opgenomen in het antwoord, voor zover ze een waarde hebben. Bijvoorbeeld fields=burgerservicenummer,naam geeft naast het burgerservicenummer alle attributen van de naam (geslachtsnaam, voornamen, voorvoegsel, enz.) terug.

  Attributen binnen een groep kunnen ook individueel worden bevraagd. De dot-notatie wordt gebruikt om specifieke attributen van een groep te selecteren. Bijvoorbeeld de voornamen, geboortedatum en geboorteplaats van een persoon kunnen worden opgevraagd via fields=naam.voornamen,geboorte.datum,geboorte.plaats.

  Met de fields parameter kan ook worden aangegeven welke relaties moeten worden opgenomen. Dit betreft de links (in _links) die verwijzen (uri) naar de betreffende gerelateerde resource. Wanneer de fields parameter is meegegeven in het request worden alleen die relaties teruggegeven die zijn gevraagd in de fields parameter.
  In de fields parameter kan de relatie worden gevraagd door de relatienaam op te nemen, voorafgegaan door HAL-element _links.
  Bijvoorbeeld de links naar de kinderen van een persoon worden teruggegeven bij fields=burgerservicenummer,naam,_links.kinderen. In dat geval worden andere relaties, zoals ouders en partners niet opgenomen in het antwoord (in _links).

  De self-link in _links (JSON HAL) wordt altijd teruggegeven in het antwoord. Deze hoeft niet te worden opgenomen in de fields parameter en zal altijd worden opgenomen, ook wanneer alleen andere velden zijn gevraagd met de fields parameter.

  In een API kunnen ook andere velden verplicht worden opgenomen, al dan niet afhankelijk van de gevraagde gegevens en waarden, omdat de gebruiker die echt moet weten. Bijvoorbeeld geheimhoudingPersoonsgegevens, mogelijkOnjuist en inOnderzoek.

  Gebruik van de fields parameter heeft geen invloed op eventueel meegeladen sub-resources. Dat wordt gestuurd via de expand parameter. Dus wanneer er specifieke attributen van een sub-resource gewenst zijn, worden die opgesomd in de expand parameter. Bijvoorbeeld expand=partners.geslachtsnaam. Zie verder expand.feature

  Gebruik van parameter fields zonder waarde (lege waarde) is equivalent aan het niet opnemen van de fields parameter. Wanneer de fields-parameter wordt opgenomen zonder waarde, worden alle attribbuten teruggegeven met een waarden en waarvoor autorisatie is.

  Wanneer in de fields-parameter namen zijn opgenomen die niet voorkomen als attribuut in de resource, wordt een foutmelding gegeven.

  In de fields-parameter moeten attribuutnamen exact zo worden geschreven als voor de resource-response gedefinieerd. Dit is case sensitive. Bijvoorbeeld fields=BURGERSERVICENUMMER levert een foutmelding, want dat attribuut bestaat niet (attribuut burgerservicenummer bestaat wel).

  Bovenop deze basisfunctionaliteit voor fields kan voor een API worden besloten meer uitgebreide functionaliteit voor fields te ondersteunen. Deze wordt onderaan deze feature uitgewerkt.


  Scenario: De fields-parameter is niet opgenomen
    Als een ingeschreven persoon wordt geraadpleegd zonder fields-parameter
    Dan worden alle attributen van de resource teruggegeven
    En worden alle relaties van de resource teruggegeven
    En wordt er geen gerelateerde sub-resource teruggegeven in _embedded

  Scenario: Slechts één enkel attribuut wordt gevraagd
    Als een ingeschreven persoon wordt geraadpleegd met fields=geslachtsaanduiding
    Dan worden alleen attributen geslachtsaanduiding en _links teruggegeven
    En bevat _links alleen attribuut self

  Scenario: Meerdere attributen worden gevraagd
    Als een ingeschreven persoon wordt geraadpleegd met fields=burgerservicenummer,burgerlijkeStaat,geslachtsaanduiding
    Dan worden alleen attributen burgerservicenummer, burgerlijkeStaat, geslachtsaanduiding en _links teruggegeven
    En bevat _links alleen attribuut self

  Scenario: Hele groep wordt gevraagd
    Gegeven de te raadplegen persoon heeft voornamen, geslachtsnaam en voorvoegsel
    Als een ingeschreven persoon wordt geraadpleegd met fields=burgerservicenummer,naam
    Dan worden alleen attributen burgerservicenummer, naam en _links teruggegeven
    En bevat _links alleen attribuut self

  Scenario: Een of enkele attributen binnen een groep worden gevraagd
    Als een ingeschreven persoon wordt geraadpleegd met fields=naam.aanschrijfwijze,naam.voornamen
    Dan worden alleen attributen naam en _links teruggegeven
    En bevat naam alleen attributen aanschrijfwijze en voornamen
    En bevat _links alleen attribuut self

  Scenario: Relaties (links) vragen (en beperken) in het antwoord
    Gegeven de te raadplegen persoon heeft een actuele partner(partnerschap of huwelijk), ouders en kinderen
    Als een ingeschreven persoon wordt geraadpleegd met fields=burgerservicenummer,naam,_links.partners
    Dan worden alleen attributen burgerservicenummer, naam en _links teruggegeven
    En bevat _links alleen attributen self en partners

  Scenario: Gebruik van de fields parameter heeft geen invloed op embedded sub-resources
    Als een ingeschreven persoon wordt geraadpleegd met fields=geboorte.land&expand=kinderen
    Dan worden alleen attributen geboorte, _links en _embedded teruggegeven
    En bevat geboorte alleen attribuut land
    En bevat _links alleen attribuut self
    En bevat _embedded alleen attribuut kinderen
    En bevat elk voorkomen van _embedded.kinderen attribuut burgerservicenummer met een waarde
    En bevat elk voorkomen van_embedded.kinderen attribuut naam met een waarde
    En bevat elk voorkomen van_embedded.kinderen attribuut geboorte.datum met een waarde
    En bevat elk voorkomen van_embedded.kinderen attribuut geboorte.plaats met een waarde
    En bevat elk voorkomen van_embedded.kinderen attribuut geboorte.land met een waarde

  Scenario: Gebruik van de expand parameter heeft geen invloed op de inhoud van de resource
    Als een ingeschreven persoon wordt geraadpleegd met fields=_links.partners&expand=kinderen
    Dan worden alleen attributen _links en _embedded teruggegeven
    En bevat _links alleen attributen self en partners
    En bevat _embedded alleen attribuut kinderen

  Scenario: Vragen van specifieke velden met de expand parameter heeft geen invloed op de inhoud van de resource, alleen op de inhoud van de embedded subresource
    Als een ingeschreven persoon wordt geraadpleegd met fields=burgerservicenummer,naam,geboorte&expand=kinderen.naam.voornamen
    Dan bevat elk voorkomen van_embedded.kinderen attribuut naam.voornamen met een waarde
    En bevat elk voorkomen van_embedded.kinderen attribuut _links.self met een waarde
    En bevat elk voorkomen van _embedded.kinderen alleen attributen naam en _links
    En bevat in elk voorkomen van _embedded.kinderen naam alleen attribuut voornamen
    En bevat in elk voorkomen van _embedded.kinderen _links alleen attribuut self
    En wordt attribuut burgerservicenummer teruggegeven
    En wordt attribuut naam.voornamen teruggegeven
    En wordt attribuut naam.geslachtsnaam teruggegeven
    En wordt attribuut naam.voorvoegsel teruggegeven
    En wordt attribuut geboorte teruggegeven
    En wordt attribuut _links.self teruggegeven
    En wordt attribuut _links.kinderen teruggegeven

  Scenario: Lege fields parameter geeft alle attributen
    Als een ingeschreven persoon wordt geraadpleegd met fields=
    Dan levert dit alle attributen die een waarde hebben en waarvoor autorisatie is

  Scenario: Fields parameter met attribuutnaam die niet bestaat
    Als een ingeschreven persoon wordt geraadpleegd met fields=burgerservicenummer,geslachtsaanduiding,bestaatniet
    Dan levert dit een foutmelding

  Scenario: Fields parameter met attribuutnaam met onjuist case
    Als een ingeschreven persoon wordt geraadpleegd met fields=BurgerServiceNummer
    Dan levert dit een foutmelding

  Scenario: Met fields vragen om attributen uit een subresource
    Als een ingeschreven persoon wordt geraadpleegd met expand=kinderen&fields=kinderen.naam
    Dan levert dit een foutmelding

  Scenario: Fields vraagt om een groep attributen en de gebruiker is niet geautoriseerd voor al deze attributen
    Gegeven de gebruiker is geautoriseerd voor geboortedatum
    En de gebruiker is niet geautoriseerd voor geboorteplaats en ook niet voor geboorteland
    Als een ingeschreven persoon wordt geraadpleegd met fields=geboorte
    Dan wordt attribuut geboorte.datum teruggegeven
    En is in het antwoord attribuut geboorte.plaats niet aanwezig
    En is in het antwoord attribuut geboorte.land niet aanwezig
    En wordt attribuut _links.self teruggegeven
    En bevat _links alleen attribuut self

  Scenario: Fields vraagt specifiek om een gegeven waarvoor deze niet geautoriseerd is
    Gegeven de gebruiker is geautoriseerd voor geboortedatum
    En de gebruiker is niet geautoriseerd voor geboorteplaats
    Als een ingeschreven persoon wordt geraadpleegd met fields=geboorte.datum,geboorte.plaats
    Dan wordt attribuut geboorte.datum teruggegeven
    En is in het antwoord attribuut geboorte.plaats niet aanwezig
    En is in het antwoord attribuut geboorte.land niet aanwezig
    En wordt attribuut _links.self teruggegeven

  Scenario: Fields bevat attributen die bij de geraadpleegde persoon geen waarde hebben
    Gegeven de te raadplegen persoon verblijft in het buitenland
    Als een ingeschreven persoon wordt geraadpleegd met fields=verblijfplaats.postcode,verblijfplaats.huisnummer
    Dan wordt alleen attribuut _links teruggegeven
    En bevat _links alleen attribuut self
    En is in het antwoord attribuut verblijfplaats.adresregel1 niet aanwezig
    En is in het antwoord attribuut verblijfplaats.land niet aanwezig
    En is in het antwoord attribuut verblijfplaats.postcode niet aanwezig
    En is in het antwoord attribuut verblijfplaats.huisnummer niet aanwezig

  Scenario: gebruik fields in een collectie
    Gegeven er zijn twee panden met adresseerbaarObjectIdentificatie=0193010000096628
    Als panden worden gezocht met adresseerbaarObjectIdentificatie=0193010000096628&fields=identificatie&documentdatum
    Dan is het antwoord:
    ```
      {
       "_links" : {
          "self" : {
             "href" : "/panden?adresseerbaarObjectIdentificatie=0193010000096628&fields=identificatie%2Cdocumentdatum"
          }
       },
       "_embedded" : {
          "panden" : [
             {
                "identificatie" : "0193100000048288",
                "documentdatum" : "2014-09-22",
                "_links" : {
                   "self" : {
                      "href" : "/panden/0193100000048288"
                   }
                }
             },
             {
                "identificatie" : "0193100000043750",
                "documentdatum" : "2014-09-22",
                "_links" : {
                   "self" : {
                      "href" : "/panden/0193100000043750"
                   }
                }
             }
          ]
       }
      }
    ```


    Voor sommige API's kan besloten worden extra functionaliteit te bieden bij het invullen van de fields paramter. Bij de API specificaties en/of features is dan aangegeven dat de uitgebreide variant van de fields functionaliteit wordt geboden.
    Deze functionaliteit maakt het mogelijk velden in groepen te vragen door alleen de naam van de property op te geven, of een deel van het pad, niet het hele pad ervoor. Dit kan nuttig zijn om de lengte van de waarde in fields te beperken.

    Met de fields parameter kan een gevraagd veld worden aangeduid met:
    - het hele pad naar dat veld, bijvoorbeeld fields=verblijfplaats.datumAanvangAdreshouding.jaar
    - het laatste deel van het pad naar dat veld, bijvoorbeeld fields=datumAanvangAdreshouding.jaar
    - alleen de veldnaam, bijvoorbeeld fields=jaar

    Voor elk veld in fields moet dit leiden tot één uniek veld in de resource, ongeacht of dit veld bij de specifiek opgevraagde resource een waarde heeft. Bijvoorbeeld een persoon heeft geboorte.land en overlijden.land, dus is fields=land niet toegestaan. In dat geval wordt een foutmelding teruggegeven. In de foutmelding worden de gevonden velden teruggegeven in invalidParams.detail. Wanneer veel velden zijn gevonden (bijvoorbeeld meer dan 3), dan worden de eerste resultaten (bijv. de eerste 3 gevonden velden) gemeld.
    Wanneer een veld in fields exact zo voorkomt in de resource, maar ook zo voorkomt als einde van het pad naar een ander veld, dan wordt het veld teruggegeven die exact wordt aangeduid met wat in fields is opgenomen.

    Achtergrond:
      Gegeven de resource zakelijkgerechtigden kent de volgende velden:
      """
      {
        "identificatie",
        "aanvangsdatum",
        "erfpachtCanon": {
          "soortErfpachtCanon": {
            "code",
            "waarde"
          },
          "jaarlijksBedrag": {
            "som",
            "valuta": {
              "code",
              "waarde"
            }
          }
        },
        "tenaamstelling": {
          "aandeel": {
            "noemer",
            "teller"
          },
          "aantekeningen": [
            {
              "identificatie": "string"
            }
          ],
          "gezamenlijkAandeel": {
            "noemer",
            "teller"
          }
        },
        "persoon": {
          "identificatie",
          "omschrijving",
          "type"
        },
        "_links": {
          "self",
          "persoon",
          "betrokkenPartner"
        }
      }
      """

    Scenario: opvragen veld met fields door opgeven exacte veld in resource
      Als zakelijkgerechtigden wordt gevraagd met fields=aanvangsdatum
      Dan bevat elk voorkomen van _embedded.zakelijkGerechtigden veld aanvangsdatum met een waarde

    Scenario: opvragen veld met fields door opgeven hele pad naar het veld
      Als zakelijkgerechtigden wordt gevraagd met fields=tenaamstelling.aandeel.noemer
      Dan bevat elk voorkomen van _embedded.zakelijkGerechtigden veld tenaamstelling.aandeel.noemer met een waarde

    Scenario: opvragen veld met fields door opgeven laatste deel van het pad naar het veld
      Als zakelijkgerechtigden wordt gevraagd met fields=aandeel.noemer
      Dan bevat elk voorkomen van _embedded.zakelijkGerechtigden veld tenaamstelling.aandeel.noemer met een waarde

    Scenario: opvragen veld met fields door opgeven alleen de unieke naam van een veld
      Als zakelijkgerechtigden wordt gevraagd met fields=aandeel
      Dan bevat elk voorkomen van _embedded.zakelijkGerechtigden veld tenaamstelling.aandeel.noemer met een waarde
      Dan bevat elk voorkomen van _embedded.zakelijkGerechtigden veld tenaamstelling.aandeel.teller met een waarde

    Scenario: opvragen veld met fields door opgeven exacte naam veld die ook dieper in de resource voorkomt
      Gegeven de zakelijkgerechtigden resource bevat een veld identificatie
      En de zakelijkgerechtigden resource bevat een veld persoon.identificatie
      Als zakelijkgerechtigden wordt gevraagd met fields=identificatie
      Dan bevat elk voorkomen van _embedded.zakelijkGerechtigden veld identificatie met een waarde
      Dan bevat geen enkel voorkomen van _embedded.zakelijkGerechtigden veld persoon.identificatie met een waarde

    Scenario: opvragen veld met fields door opgeven naam veld die meerdere keren in de resource voorkomt
      Gegeven de zakelijkgerechtigden resource bevat een veld tenaamstelling.aandeel.noemer
      En de zakelijkgerechtigden resource bevat een veld tenaamstelling.gezamenlijkaandeel.noemer
      Als zakelijkgerechtigden wordt gevraagd met fields=noemer
      Dan heeft het antwoord http statuscode 400
      En bevat het antwoord title met de waarde "Een of meerdere parameters zijn niet correct."
      En bevat het antwoord invalidParams[0].name met waarde "fields"
      En bevat het antwoord invalidParams[0].code met waarde "fields"
      En bevat in het antwoord invalidParams[0].detail de tekst "tenaamstelling.aandeel.noemer"
      En bevat in het antwoord invalidParams[0].detail de tekst "tenaamstelling.gezamenlijkaandeel.noemer"

    Scenario: property en link met dezelfde naam en property wordt gevraagd met fields
      Gegeven de zakelijkgerechtigden resource bevat een veld persoon
      En de zakelijkgerechtigden resource bevat een veld _links.persoon
      Als zakelijkgerechtigden wordt gevraagd met fields=persoon
      Dan bevat het antwoord property persoon
      En bevat het antwoord geen property _links.persoon
      En bevat het antwoord property _links.self

    Scenario: property en link met dezelfde naam en link wordt gevraagd met fields
      Gegeven de zakelijkgerechtigden resource bevat een veld persoon
      En de zakelijkgerechtigden resource bevat een veld _links.persoon
      Als zakelijkgerechtigden wordt gevraagd met fields=_links.persoon
      Dan bevat het antwoord property _links.persoon
      En bevat het antwoord property _links.self
      En bevat het antwoord geen property persoon
