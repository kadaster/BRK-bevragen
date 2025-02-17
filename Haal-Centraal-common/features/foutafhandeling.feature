# language: nl

Functionaliteit: Afhandeling van fouten
  Wanneer er een foutsituatie is, wordt de betreffende http statuscode teruggegeven. Het antwoord bevat dan details over de fout conform problem+json.

  In de foutresponse krijgt "type" een url naar een beschrijving van de fout.
  In de foutresponse krijgt "title" een korte omschrijving van de fout, zie tabel hieronder.
  In de foutresponse krijgt "status" de waarde van de http status code, zie tabel hieronder.
  In de foutresponse krijgt "detail" een uitgebreide beschrijving van de fout.
  In de foutresponse krijgt "code" een waarde, zie tabel hieronder.
  In de foutresponse krijgt "instance" de url van het request die tot de fout heeft geleid.

  We kennen de volgende foutsituaties:
  | Foutsituatie                        | status | title                                                             | code              |
  | Geen parameter is meegegeven        | 400    | Ten minste één parameter moet worden opgegeven.                   | paramsRequired    |
  | Verplichte parameter(combinatie)    | 400    | Minimale combinatie van parameters moet worden opgegeven.         | paramsCombination |
  | Niet toegestane parametercombinatie | 400    | De combinatie van opgegeven parameters is niet toegestaan.        | unsupportedCombi  |
  | Parametervalidatie                  | 400    | Een of meerdere parameters zijn niet correct.                     | paramsValidation  |
  | Teveel zoekresultaten               | 400    | Teveel zoekresultaten.                                            | tooManyResults    |
  | Niet geauthenticeerd                | 401    | Niet correct geauthenticeerd.                                     | authentication    |
  | Geen autorisatie voor operatie      | 403    | U bent niet geautoriseerd voor deze operatie.                     | autorisation      |
  | Opgevraagde resource bestaat niet   | 404    | Opgevraagde resource bestaat niet.                                | notFound          |
  | Accept header <> JSON               | 406    | Gevraagde contenttype wordt niet ondersteund.                     | notAcceptable     |
  | Accept-Crs header niet ondersteund  | 406    | Gevraagde coördinatenstelsel {crs} wordt niet ondersteund.        | crsNotAcceptable  |
  | Geen Content-Crs opgegeven          | 412    | Coördinatenstelsel van gestuurde geometrie moet worden opgegeven. | contentCrsMissing |
  | Geen Accept-Crs opgegeven           | 412    | Gewenste coördinatenstelsel voor geometrie moet worden opgegeven. | acceptCrsMissing  |
  | Crs wordt niet ondersteund          | 415    | Coördinatenstelsel {crs} in Content-Crs wordt niet ondersteund.   | crsNotSupported   |
  | Technische of interne fout          | 500    | Interne server fout.                                              | serverError       |
  | Bronservice is niet beschikbaar     | 503    | Bronservice {bron} is niet beschikbaar.                           | sourceUnavailable |
  | Raadplegen geeft meerdere personen  | 400    | Opgegeven {parameternaam} is niet uniek.                          | notUnique         |


  Wanneer de onderliggende bron GBA-V, een foutcode teruggeeft wordt dat als volgt vertaald:
  | /vraagResponse/vraagReturn/resultaat/letter | status | code             | invalidParams.code  | invalidParams.reason                            |
  | X                                           | 403    | autorisation     | -                   | -                                               |
  | U                                           | 400    | paramsValidation | unique              | De opgegeven persoonidentificatie is niet uniek |
  | H                                           | 403    | autorisation     | -                   | -                                               |
  | R                                           | 403    | autorisation     | -                   | -                                               |

  Wanneer de fout is veroorzaakt door fouten in requestparameters (of request body), wordt "invalidParams" gevuld met details over elke foute parameter.

  Wanneer er fouten zitten op meerdere parameters, wordt er per validatiefout een "invalidParams" instantie opgenomen in het antwoord. Alle fouten worden dus teruggegeven.

  Bij een fout op een parameter krijgt in "invalidParams" attribuut "type" een url naar een beschrijving van de fout in de parameter. De hier gerefereeerde foutbeschrijving is specifieker dan "type" op het hoofdniveau van het bericht.
  Bij een fout op een parameter krijgt in "invalidParams" attribuut "name" de naam van de parameter waar de fout in zit.
  Bij een fout op een parameter krijgt in "invalidParams" attribuut "code" een vaste waarde afhankelijk van het soort fout, zie tabel hieronder.
  Bij een fout op een parameter krijgt in "invalidParams" attribuut "reason" een vaste omschrijving afhankelijk van het soort fout, zie tabel hieronder.

  Bij valideren van een parameter tegen schema kunnen de volgende meldingen komen:
  | validatie        | reason                                                    | code         |
  | type: integer    | Waarde is geen geldige integer.                           | integer      |
  | type: number     | Waarde is geen geldig decimaal getal.                     | number       |
  | type: boolean    | Waarde is geen geldige boolean.                           | boolean      |
  | format: date     | Waarde is geen geldige datum.                             | date         |
  | minimum          | Waarde is lager dan minimum {minimum}.                    | minimum      |
  | maximum          | Waarde is hoger dan maximum {maximum}.                    | maximum      |
  | minLength        | Waarde is korter dan minimale lengte {minLength}.         | minLength    |
  | maxLength        | Waarde is langer dan maximale lengte {maxLength}.         | maxLength    |
  | minItems         | Array bevat minder dan {minItems} items.                  | minItems     |
  | maxItems         | Array bevat meer dan {maxItems} items.                    | maxItems     |
  | pattern          | Waarde voldoet niet aan patroon {pattern}.                | pattern      |
  | enumeratiewaarde | Waarde heeft geen geldige waarde uit de enumeratie.       | enum         |
  | tabelwaarde      | Waarde komt niet voor in de tabel.                        | table        |
  | required         | Parameter is verplicht.                                   | required     |
  | parameters       | Parameter is niet verwacht.                               | unknownParam |
  | fields           | Deel van de parameterwaarde niet correct: {waarde}.       | fields       |
  | expand           | Deel van de parameterwaarde niet correct: {waarde}.       | expand       |
  | wildcard         | Incorrect gebruik van wildcard karakter {wildcard}.       | wildcard     |
  | page bestaat     | De opgegeven pagina bestaat niet.                         | page         |

  Bij een validatiefout op de expandparameter of fieldsparameter, wordt de plek binnen de parameterwaarde opgenomen waar de fout gevonden wordt.

  Abstract Scenario: Ongeldige pathparameter waarde bij raadplegen resource
    Als de {resource} wordt geraadpleegd met {parameter}={waarde}
    Dan is de http status code van het antwoord 400
    En is in het antwoord title=Een of meerdere parameters zijn niet correct
    En is in het antwoord status=400
    En eindigt attribuut instance met /api/handelsregister/v1/{resource}/{waarde}
    En bevat invalidParams exact 1 voorkomen(s)
    En is in het antwoord invalidParams.name={parameter}
    En is in het antwoord invalidParams.reason={reason}
    En is in het antwoord invalidParams.code={code}

    Voorbeelden:
      | code         | reason                                                    | resource             | parameter           | waarde                      |
      | minLength    | Waarde is korter dan minimale lengte 9.                   | ingeschrevenpersonen | burgerservicenummer | 12345678                    |
      | maxLength    | Waarde is langer dan maximale lengte 9.                   | ingeschrevenpersonen | burgerservicenummer | 1234567890                  |
      | unknownParam | Parameter is niet verwacht.                               | ingeschrevenpersonen | bestaatniet         | fout                        |
      | fields       | Deel van de parameterwaarde is niet correct: bestaatniet. | ingeschrevenpersonen | fields              | naam,bestaatniet,geboorte   |
      | fields       | Deel van de parameterwaarde is niet correct: bestaatniet. | ingeschrevenpersonen | expand              | ouders,bestaatniet,kinderen |
      | fields       | Deel van de parameterwaarde is niet correct: true.        | ingeschrevenpersonen | expand              | true                        |

  Abstract Scenario: Ongeldige queryparameter waarde bij zoeken
    Als {resource} worden gezocht met {parameter}={waarde}
    Dan is de http status code van het antwoord 400
    En is in het antwoord title=Een of meerdere parameters zijn niet correct
    En is in het antwoord status=400
    En eindigt attribuut instance met /api/handelsregister/v1/{resource}?{parameter}={waarde}
    En bevat invalidParams exact 1 voorkomen(s)
    En is in het antwoord invalidParams.name={parameter}
    En is in het antwoord invalidParams.reason={reason}
    En is in het antwoord invalidParams.code={code}

    Voorbeelden:
      | code         | reason                                                       | resource             | parameter                               | waarde                      |
      | integer      | Waarde is geen geldige integer.                              | ingeschrevenpersonen | verblijfplaats__huisnummer              | a                           |
      | boolean      | Waarde is geen geldige boolean.                              | ingeschrevenpersonen | inclusiefoverledenpersonen              | nee                         |
      | date         | Waarde is geen geldige datum.                                | ingeschrevenpersonen | geboorte__datum                         | 23-04-2019                  |
      | date         | Waarde is geen geldige datum.                                | ingeschrevenpersonen | geboorte__datum                         | 1983-05-00                  |
      | maximum      | Waarde is hoger dan maximum 99999.                           | ingeschrevenpersonen | verblijfplaats__huisnummer              | 123456                      |
      | maxLength    | Waarde is langer dan maximale lengte 4.                      | ingeschrevenpersonen | verblijfplaats__huisnummertoevoeging    | tegenover                   |
      | pattern      | Waarde voldoet niet aan patroon ^[1-9]{1}[0-9]{3}[A-Z]{2}.   | ingeschrevenpersonen | verblijfplaats__postcode                | 123aa                       |
      | enum         | Waarde heeft geen geldige waarde uit de enumeratie.          | ingeschrevenpersonen | geslachtsaanduiding                     | B                           |
      | table        | Waarde komt niet voor in de tabel.                           | ingeschrevenpersonen | verblijfplaats__gemeentevaninschrijving | 2019                        |
      | unknownParam | Parameter is niet verwacht.                                  | ingeschrevenpersonen | indicatieGeheim                         | 0                           |
      | fields       | Deel van de parameterwaarde is niet correct: bestaatniet.    | ingeschrevenpersonen | fields                                  | naam,bestaatniet,geboorte   |
      | expand       | Deel van de parameterwaarde is niet correct: bestaatniet.    | ingeschrevenpersonen | expand                                  | ouders,bestaatniet,kinderen |
      | wildcard     | Incorrect gebruik van wildcard karakter *.                   | ingeschrevenpersonen | naam__geslachtsnaam                     | Ja*en                       |
      | minItems     | Array bevat minder dan 2 items.                              | panden               | locatie                                 | 98095.02                    |


  Scenario: geen enkele zoekparameter opgegeven in zoekvraag
    Als ingeschrevenpersonen worden gezocht zonder parameters
    Dan is de http status code van het antwoord 400
    En is in het antwoord title=Minimale combinatie van parameters moet worden opgegeven.
    En is in het antwoord status=400
    En eindigt attribuut instance met /ingeschrevenpersonen
    En is in het antwoord code=paramsRequired
    En is in het antwoord title=Ten minste één parameter moet worden opgegeven
    En komt attribuut invalidParams niet voor in het antwoord

  Scenario: personen zoeken zonder minimale combinatie van zoekparameters
    Als ingeschrevenpersonen worden gezocht met naam__geslachtsnaam=jansen
    Dan is de http status code van het antwoord 400
    En is in het antwoord title=Minimale combinatie van parameters moet worden opgegeven.
    En is in het antwoord status=400
    En eindigt attribuut instance met ingeschrevenpersonen?naam__geslachtsnaam=jansen
    En is in het antwoord code=paramsCombination
    En komt attribuut invalidParams niet voor in het antwoord

  Scenario: combinatie van opgegeven parameters wordt niet ondersteund
    Gegeven op endpoint /panden kan gezocht worden op adresseerbaarObjectIdentificatie, nummeraanduidingIdentificatie of locatie
    En het combineren van deze parameters wordt niet ondersteund
    Als panden worden gezocht met adresseerbaarobjectidentificatie=0599010000165822&locatie=98095.02,438495.09
    Dan is de http status code van het antwoord 400
    En is in het antwoord title=De combinatie van opgegeven parameters is niet toegestaan.
    En is in het antwoord status=400
    En eindigt attribuut instance met /panden?adresseerbaarobjectidentificatie=0599010000165822&locatie=98095.02%2C438495.09
    En is in het antwoord code=unsupportedCombi
    En komt attribuut invalidParams niet voor in het antwoord

  Scenario: meerdere fouten in parameters
    Als ingeschrevenpersonen worden gezocht met verblijfplaats__huisnummer=a&verblijfplaats__postcode=b&inclusiefoverledenpersonen=c&geboorte__datum=d
    Dan is de http status code van het antwoord 400
    En is in het antwoord title=Een of meerdere parameters zijn niet correct.
    En is in het antwoord status=400
    En eindigt attribuut instance met ingeschrevenpersonen?huisnummer=a&postcode=b&inclusiefoverledenpersonen=c&geboorte__datum=d
    En bevat invalidParams exact 4 voorkomen(s)
    En is er een invalidParams met name=verblijfplaats__huisnummer
    En is er een invalidParams met name=verblijfplaats__postcode
    En is er een invalidParams met name=inclusiefoverledenpersonen
    En is er een invalidParams met name=geboorte__datum

  Scenario: onjuiste waarde in request header Content-Crs
    Als /panden wordt gezocht met de niet-ondersteunde waarde voor header Content-Crs "epsg:4326"
    Dan is de http status code van het antwoord 415
    En is in het antwoord title=Coördinatenstelsel epsg:4326 in Content-Crs wordt niet ondersteund.
    En is in het antwoord code=crsNotSupported
    En is in het antwoord status=415
    En komt attribuut invalidParams niet voor in het antwoord

  Scenario: onjuiste waarde in request header Accept-Crs
    Als /panden wordt gezocht met de niet-ondersteunde waarde voor header Accept-Crs "epsg:4326"
    Dan is de http status code van het antwoord 406
    En is in het antwoord title=Gevraagde coördinatenstelsel epsg:4326 wordt niet ondersteund.
    En is in het antwoord code=crsNotAcceptable
    En is in het antwoord status=406
    En komt attribuut invalidParams niet voor in het antwoord

  Scenario: request header Content-Crs ontbreekt bij gebruik van een query parameter met geometrie
    Als /panden wordt gezocht met parameter locatie=98095,438495
    En in het request is header Content-Crs niet opgenomen
    En in het request is header Accept-Crs wel opgenomen met de waarde epsg:28992
    Dan is de http status code van het antwoord 412
    En is in het antwoord title=Coördinatenstelsel van gestuurde geometrie moet worden opgegeven.
    En is in het antwoord code=contentCrsMissing
    En is in het antwoord status=412
    En komt attribuut invalidParams niet voor in het antwoord

  Scenario: request header Content-Crs ontbreekt en er is geen geometrie gebruikt in het request
    Als /panden wordt gezocht met parameter adresseerbaarObjectIdentificatie=0599010000165822
    En in het request is geen geometrie opgenomen
    En in het request is header Content-Crs niet opgenomen
    En in het request is header Accept-Crs wel opgenomen met de waarde epsg:28992
    Dan is de http status code van het antwoord 200

  Scenario: request header Accept-Crs ontbreekt bij resource die geometrie bevat
    Gegeven de resource panden bevat property geometrie
    Als /panden wordt gezocht met parameter adresseerbaarObjectIdentificatie=0599010000165822
    En in het request is header Content-Crs wel opgenomen met de waarde epsg:28992
    En in het request is header Accept-Crs niet opgenomen
    Dan is de http status code van het antwoord 412
    En is in het antwoord title=Gewenste coördinatenstelsel voor geometrie moet worden opgegeven.
    En is in het antwoord code=acceptCrsMissing
    En is in het antwoord status=412
    En komt attribuut invalidParams niet voor in het antwoord

  Scenario: request header Accept-Crs ontbreekt en er wordt geen geometrie gevraagd
    Gegeven de resource panden bevat property geometrie
    Als /panden wordt gezocht met parameter fields=oorspronkelijkBouwjaar,status
    En in het request is header Content-Crs niet opgenomen
    En in het request is header Accept-Crs niet opgenomen
    Dan is de http status code van het antwoord 200

  Scenario: niet geauthenticeerd
    Als ingeschrevenpersonen worden gezocht zonder authenticatiegegevens (zonder SAML assertion)
    Dan is de http status code van het antwoord 401
    En is in het antwoord title=Niet correct geauthenticeerd
    En is in het antwoord status=401
    En is in het antwoord code=authentication
    En komt attribuut invalidParams niet voor in het antwoord
    Als ingeschrevenpersonen worden gezocht met invalide authenticatiegegevens (onjuiste SAML assertion)
    Dan is de http status code van het antwoord 401
    En is in het antwoord title=Niet correct geauthenticeerd.
    En is in het antwoord status=401
    En is in het antwoord code=authentication
    En komt attribuut invalidParams niet voor in het antwoord
    Als ingeschrevenpersonen worden gezocht met onbekende gebruiker (onbekende SAML assertion)
    Dan is de http status code van het antwoord 401
    En is in het antwoord title=Niet correct geauthenticeerd.
    En is in het antwoord status=401
    En is in het antwoord code=authentication
    En komt attribuut invalidParams niet voor in het antwoord

  Scenario: niet geautoriseerd
    Als ingeschrevenpersonen worden gezocht met een geauthentiseerde gebruiker zonder rechten op de API
    Dan is de http status code van het antwoord 403
    En is in het antwoord title=U bent niet geautoriseerd voor deze operatie.
    En is in het antwoord status=403
    En is in het antwoord code=autorisation
    En komt attribuut invalidParams niet voor in het antwoord

  Scenario: niet gevonden
    Als de ingeschrevenpersonen wordt geraadpleegd met burgerservicenummer=123456789
    Dan is de http status code van het antwoord 404
    En is in het antwoord title=Opgevraagde resource bestaat niet.
    En is in het antwoord status=404
    En is in het antwoord code=notFound
    En komt attribuut invalidParams niet voor in het antwoord

  Scenario: niet ondersteund contenttype
    Als de ingeschrevenpersonen wordt geraadpleegd met acceptheader application/xml
    Dan is de http status code van het antwoord 406
    En is in het antwoord title=Gevraagde contenttype wordt niet ondersteund.
    En is in het antwoord status=406
    En is in het antwoord code=notAcceptable
    En komt attribuut invalidParams niet voor in het antwoord

  Scenario: bronservice is niet beschikbaar
    Als een ingeschreven persoon wordt geraadpleegd
    En de bron GBA-V geen response of een timeout geeft
    Dan is de http status code van het antwoord 503
    En is in het antwoord title=Bronservice GBA-V is niet beschikbaar.
    En is in het antwoord status=503
    En is in het antwoord code=sourceUnavailable
    En komt attribuut invalidParams niet voor in het antwoord
    Als een ingeschreven persoon wordt geraadpleegd
    En de bron GBA-V geeft de foutmelding “Service is niet geactiveerd voor dit account.”
    Dan is de http status code van het antwoord 503
    En is in het antwoord title=Bronservice GBA-V is niet beschikbaar.
    En is in het antwoord status=503
    En is in het antwoord code=sourceUnavailable
    En komt attribuut invalidParams niet voor in het antwoord
