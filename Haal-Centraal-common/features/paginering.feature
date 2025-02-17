# language: nl

Functionaliteit: Als gemeente wil ik kunnen bladeren door een groot aantal resultaten
  Zodat het aantal resultaten per aanroep beperkt is en de responsetijd zo kort mogelijk

  Bladeren door de resultaten kan via de links first, previous, next en last.
  Deze properties bevatten een uri die verwijst naar de eerste pagina, vorige pagina, volgende pagina en laatste pagina met resultaten.
  Bladeren kan door gebruik van de parameter page.
  De links first, previous, next en last worden alleen opgenomen in de response wanneer dit van toepassing is.

  De provider kan ervoor kiezen de link last niet te leveren, om te voorkomen dat elke keer een volledige table scan nodig is om een enkele pagina te leveren.

  Wanneer geen page parameter wordt meegegeven in het request, wordt de eerste pagina van het resultaat getoond.

  Wanneer de opgegeven pagina met de page parameter hoger is dan het aantal pagina's resultaat, wordt een foutmelding getoond.


  Achtergrond:
    Gegeven de api toont maximaal 20 resultaten per pagina
    En op pand met identificatie 0826100000000467 zijn er 72 nummeraanduidingen
    En op pand met identificatie 0826100000000471 zijn er 2 nummeraanduidingen

  Scenario: de zoekvraag levert meerdere pagina's en er wordt geen page parameter gebruikt
    Als de request wordt gedaan naar /adressen?pandidentificatie=0826100000000467
    Dan zitten er 20 adressen in het antwoord
    En zijn dit adressen 1 tot en met 20 met deze pandidentificatie
    En is attribuut _links.self.href gelijk aan "/adressen?pandidentificatie=0826100000000467"
    En bevat het antwoord geen attribuut _links.first
    En bevat het antwoord geen attribuut _links.previous
    En is attribuut _links.next.href gelijk aan "/adressen?pandidentificatie=0826100000000467&page=2"
    En is attribuut _links.last.href gelijk aan "/adressen?pandidentificatie=0826100000000467&page=4"

  Scenario: de zoekvraag levert meerdere pagina's en met de page parameter wordt de eerste pagina gevraagd
    Als de request wordt gedaan naar /adressen?pandidentificatie=0826100000000467&page=1
    Dan zitten er 20 adressen in het antwoord
    En zijn dit adressen 1 tot en met 20 met deze pandidentificatie
    En is attribuut _links.self.href gelijk aan "/adressen?pandidentificatie=0826100000000467&page=1"
    En bevat het antwoord geen attribuut _links.first
    En bevat het antwoord geen attribuut _links.previous
    En is attribuut _links.next.href gelijk aan "/adressen?pandidentificatie=0826100000000467&page=2"
    En is attribuut _links.last.href gelijk aan "/adressen?pandidentificatie=0826100000000467&page=4"

  Scenario: de zoekvraag levert meerdere pagina's en met de page parameter wordt een volgende pagina gevraagd
    Als de request wordt gedaan naar /adressen?pandidentificatie=0826100000000467&page=3
    Dan zitten er 20 adressen in het antwoord
    En zijn dit adressen 41 tot en met 60 met deze pandidentificatie
    En is attribuut _links.self.href gelijk aan "/adressen?pandidentificatie=0826100000000467&page=3"
    En is attribuut _links.first.href gelijk aan "/adressen?pandidentificatie=0826100000000467&page=1"
    En is attribuut _links.previous.href gelijk aan "/adressen?pandidentificatie=0826100000000467&page=2"
    En is attribuut _links.next.href gelijk aan "/adressen?pandidentificatie=0826100000000467&page=4"
    En is attribuut _links.last.href gelijk aan "/adressen?pandidentificatie=0826100000000467&page=4"

  Scenario: de zoekvraag levert meerdere pagina's en met de page parameter wordt de laatste pagina gevraagd
    Als de request wordt gedaan naar /adressen?pandidentificatie=0826100000000467&page=4
    Dan zitten er 12 adressen in het antwoord
    En zijn dit adressen 61 tot en met 72 met deze pandidentificatie
    En is attribuut _links.self.href gelijk aan "/adressen?pandidentificatie=0826100000000467&page=4"
    En is attribuut _links.first.href gelijk aan "/adressen?pandidentificatie=0826100000000467&page=1"
    En is attribuut _links.previous.href gelijk aan "/adressen?pandidentificatie=0826100000000467&page=3"
    En bevat het antwoord geen attribuut _links.next
    En bevat het antwoord geen attribuut _links.last

  Scenario: de zoekvraag levert meerdere pagina's en met de page parameter wordt een pagina bevraagd die niet bestaat
    Als de request wordt gedaan naar /adressen?pandidentificatie=0826100000000467&page=15
    Dan heeft het antwoord statuscode 400
    En bevat het antwoord status met de waarde 400
    En bevat het antwoord title met de waarde "Een of meerdere parameters zijn niet correct."
    En bevat het antwoord instance met de waarde "/adressen?pandidentificatie=0826100000000467&page=15"
    En bevat het antwoord invalidParams[0].name met de waarde "page"
    En bevat het antwoord invalidParams[0].reason met de waarde "De opgegeven pagina bestaat niet."
    En bevat het antwoord invalidParams[0].code met de waarde "page"

  Scenario: de zoekvraag levert één pagina
    Als de request wordt gedaan naar /adressen?pandidentificatie=0826100000000471
    Dan zitten er 2 adressen in het antwoord
    En is attribuut _links.self.href gelijk aan "/adressen?pandidentificatie=0826100000000471"
    En bevat het antwoord geen attribuut _links.first
    En bevat het antwoord geen attribuut _links.previous
    En bevat het antwoord geen attribuut _links.next
    En bevat het antwoord geen attribuut _links.last

  Scenario: de zoekvraag levert geen resultaten
    Als de request wordt gedaan naar /adressen?pandidentificatie=1234567890123456
    Dan zitten er 0 adressen in het antwoord
    En is attribuut _links.self.href gelijk aan "/adressen?pandidentificatie=1234567890123456"
    En bevat het antwoord geen attribuut _links.first
    En bevat het antwoord geen attribuut _links.previous
    En bevat het antwoord geen attribuut _links.next
    En bevat het antwoord geen attribuut _links.last

  Scenario: de zoekvraag levert meerdere pagina's en de pageSize parameter wordt gebruikt
    Als de request wordt gedaan naar /adressen?pandidentificatie=0826100000000467&page=3&pageSize=15
    Dan zitten er 15 adressen in het antwoord
    En is attribuut _links.self.href gelijk aan "/adressen?pandidentificatie=0826100000000467&page=3&pageSize=15"
    En is attribuut _links.first.href gelijk aan "/adressen?pandidentificatie=0826100000000467&page=1&pageSize=15"
    En is attribuut _links.previous.href gelijk aan "/adressen?pandidentificatie=0826100000000467&page=2&pageSize=15"
    En is attribuut _links.next gelijk aan "/adressen?pandidentificatie=0826100000000467&page=4&pageSize=15"
    En is attribuut _links.last gelijk aan "/adressen?pandidentificatie=0826100000000467&page=5&pageSize=15"
