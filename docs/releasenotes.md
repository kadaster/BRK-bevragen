---
layout: page-with-side-nav
title: Haal Centraal BRK bevragingen
---

# Release notes BRK-Bevragen

## **Versie 2.0.0:**

### User stories

In deze versie zijn geen userstories geïmplementeerd.

### Openapi.yaml

- Endpoint /kadastraalonroerendezaken:
  - Queryparameters verwijderd:
    - burgerservicenummer
    - persoon__identificatie
  - POST toegevoegd 
- Component BsnBody toegevoegd:
- Component KadasterPersoonLinks:
  - zakelijkGerechtigden verwijderd
- Component AantekeningTenaamstelling:
  - Properties verwijderd:
    - begrenzing 
    - indicatieOorspronkelijkObject 
- Component AantekeningBasis:
  - betreftGedeelteVanPerceel verwijderd
- Component KadasterNatuurlijkPersoon:
  - geheimhoudingPersoonsgegevens verwijderd
- Component HeeftPartnerschap:
  - Properties verwijderd:
    - datumOntbinding
    - datumSluiting
- Component TypeBreuk:
  - Property teller:
    - maximum verwijderd
	- minimum toegevoegd
  - Property noemer:
    - maximum verwijderd

### Issues

Alle issues die in deze release zijn opgelost hebben in de issues-lijst het label "v2.0" gekregen. Door op dit label te filteren in de (gesloten) issues is een gedetailleerd overzicht van wijzigingen en bug-fixes te krijgen.


## **Versie 1.5.0:**

### User stories

- [882](https://github.com/kadaster/BRK-bevragen/issues/882){:target="_blank"}): Als medewerker Erfpacht wil ik weten wie de eigenaren zijn van appartementsrechten die uit erfpacht zijn ontstaan
- [843](https://github.com/kadaster/BRK-bevragen/issues/843){:target="_blank"}): Als medewerker en ontwikkelaar wil ik dat niet vervallen maar wel gesplitste appartementsrechten een indicatie Sluimerend krijgen

### Openapi.yaml

- Endpoint /kadastraalonroerendezaken:
  - inclusiefKadastraalOnroerendeZakenUitSplitsing toegevoegd als queryparameter aan /kadastraalonroerendezaken
- Component ZakelijkGerechtigdeHalCollectie:
    - Properties toegevoegd:
      - gesplitstZakelijkRecht
      - _links.kadastraalOnroerendeZakenUitSplitsing
      - _links.kadastraalOnroerendeZakenUitSplitsingInclusiefZakelijkGerechtigden
- Component KadastraalOnroerendeZaak:
  - Properties toegevoegd:
    - gesplitstZakelijkRecht
    - indicatieSluimerend
- Component AppartementsrechtBasis:
  - Properties toegevoegd:
    - indicatieSluimerend

### Features:

De volgende feature is toegevoegd:
- gesplitst-zakelijk-recht.feature

### Issues

Alle issues die in deze release zijn opgelost hebben in de issues-lijst het label "v1.5" gekregen. Door op dit label te filteren in de (gesloten) issues is een gedetailleerd overzicht van wijzigingen en bug-fixes te krijgen.


## **Versie 1.4.1:**

  Issue [911](https://github.com/kadaster/BRK-bevragen/issues/911){:target="_blank"} opgelost.
  Enumeratie TypeGerechtigdeEnum uitgebreid met
    - "artikel5_3b_geheel" en "brondocument". 


## **Versie 1.4.0:**

### openapi.yaml

  - Voor het zoeken naar Kadastraal Onroerende Zaken is naast de kadastrale aanduiding met daarin de gemeentenaam nu ook een zoekmogelijkheid toegevoegd om op de kadastrale aanduiding met de gemeentecode te zoeken.

## **Versie 1.3.0:**

### openapi.yaml

- Algemeen
  - Nieuwe endpoints toegevoegd voor stukken en stukdelen.
  - Bestaande resources zijn (voorzover van toepassing) uitgebreid met relaties naar de betrokken stukken en stukdelen.
  - Path parameters zijn aangepast naar camelcase
  - Response code 410 verwijderd bij de endpoints


- stukken 2 nieuwe endpoints  ([622](https://github.com/kadaster/BRK-bevragen/issues/622){:target="_blank"} en [624](https://github.com/kadaster/BRK-bevragen/issues/624){:target="_blank"} ):
  - /stukken/{stukidentificatie}
  - /stukdelen/{stukdeelidentificatie}


- kadastraalOnroerendeZaken
  - nummeraanduidingIdentificatie is toegevoegd als queryparameter aan /kadastraalonroerendezaken ([41](https://github.com/kadaster/BRK-bevragen/issues/41){:target="_blank"})
  - Properties toegevoegd:
    - indicatieVervallen ([42](https://github.com/kadaster/BRK-bevragen/issues/22){:target="_blank"})
    - isOvergegaanIn ([42](https://github.com/kadaster/BRK-bevragen/issues/42){:target="_blank"} , [537](https://github.com/kadaster/BRK-bevragen/issues/537){:target="_blank"} , [538](https://github.com/kadaster/BRK-bevragen/issues/538){:target="_blank"})
    - isOntstaanUit ([42](https://github.com/kadaster/BRK-bevragen/issues/42){:target="_blank"} , [537](https://github.com/kadaster/BRK-bevragen/issues/537){:target="_blank"} , [538](https://github.com/kadaster/BRK-bevragen/issues/538){:target="_blank"})
    - bijbehorendeGrondpercelen ([200](https://github.com/kadaster/BRK-bevragen/issues/200){:target="_blank"})
    - bijbehorendeAppartementsrechten ([200](https://github.com/kadaster/BRK-bevragen/issues/200){:target="_blank"})
    - stukIdentificaties (Uitgestelde functionaliteit. Voornaamste aanleiding versie 1.3)
    - isVermeldInStukdeelIdentificaties (Uitgestelde functionaliteit. Voornaamste aanleiding versie 1.3)
  - Links toegevoegd:
    - isOntstaanUit (achterwaartse filiatie naar gerelateerde kadastraalOnroerendeZaak) ([42](https://github.com/kadaster/BRK-bevragen/issues/42){:target="_blank"} , [537](https://github.com/kadaster/BRK-bevragen/issues/537){:target="_blank"} , [538](https://github.com/kadaster/BRK-bevragen/issues/538){:target="_blank"})
    - isOvergegaanIn (voorwaartse filiatie naar gerelateerde kadastraalOnroerendeZaak) ([42](https://github.com/kadaster/BRK-bevragen/issues/42){:target="_blank"} , [537](https://github.com/kadaster/BRK-bevragen/issues/537){:target="_blank"} , [538](https://github.com/kadaster/BRK-bevragen/issues/538){:target="_blank"})
    - stukken (Uitgestelde functionaliteit. Voornaamste aanleiding versie 1.3)
    - stukdelen (Uitgestelde functionaliteit. Voornaamste aanleiding versie 1.3)
    - adressen (link naar [Haal-Centraal BAG adressen endpoint](https://github.com/lvbag/BAG-API) is nu in productie beschikbaar )
    - adresseerbareObjecten (link naar [Haal-Centraal BAG adresseerbareobjecten endpoint](https://github.com/lvbag/BAG-API))
    - bijbehorendeGrondpercelen (link naar gerelateerde kadastraalOnroerendeZaken) ([200](https://github.com/kadaster/BRK-bevragen/issues/200){:target="_blank"})
    - bijbehorendeAppartementsrechten (links naar gerelateerde kadastraalOnroerendeZaken die als appartementsrecht ontstaan zijn uit deze kadastraalOnroerendeZaak. ([200](https://github.com/kadaster/BRK-bevragen/issues/200){:target="_blank"})


- hypotheken
  - Properties toegevoegd:
    - stukIdentificaties (Nieuwe functionaliteit. Voornaamste aanleiding versie 1.3)
    - omschrijvingGekozenWoonplaats (n.a.v. opnemen stukdeel)
    - isGebaseerdOpStukdeelIdentificatie (Uitgestelde functionaliteit. Voornaamste aanleiding versie 1.3)
    - isVermeldInStukdeelIdentificaties (Uitgestelde functionaliteit. Voornaamste aanleiding versie 1.3)
  - Links toegevoegd:
    - stukken (Uitgestelde functionaliteit. Voornaamste aanleiding versie 1.3)
    - stukdelen (Uitgestelde functionaliteit. Voornaamste aanleiding versie 1.3)
  - Accept-Crs header en Content-Crs header zijn verwijderd bij:
    - /kadastraalonroerendezaken/{kadastraalOnroerendeZaakIdentificatie}/hypotheken
    - /kadastraalonroerendezaken/{kadastraalOnroerendeZaakIdentificatie}/hypotheken/{hypotheekIdentificatie}


-  beslagen
   - Properties toegevoegd:
     - stukIdentificaties (Uitgestelde functionaliteit. Voornaamste aanleiding versie 1.3)
     - isGebaseerdOpStukdeelIdentificatie (Uitgestelde functionaliteit. Voornaamste aanleiding versie 1.3)
     - isVermeldInStukdeelIdentificaties (Uitgestelde functionaliteit. Voornaamste aanleiding versie 1.3)
   - Links toegevoegd:
     - stukken (Uitgestelde functionaliteit. Voornaamste aanleiding versie 1.3)
     - stukdelen (Uitgestelde functionaliteit. Voornaamste aanleiding versie 1.3)
   - Property betreftGedeelteVanPerceel is deprecated verklaard.
   - Accept-Crs header en Content-Crs header zijn verwijderd bij:
     - /kadastraalonroerendezaken/{kadastraalOnroerendeZaakIdentificatie}/beslagen
     - /kadastraalonroerendezaken/{kadastraalOnroerendeZaakIdentificatie}/beslagen/{beslagIdentificatie}


- privaatrechtelijkeBeperkingen
  - Properties toegevoegd (overerfd uit Aantekening):
    - stukIdentificaties (Uitgestelde functionaliteit. Voornaamste aanleiding versie 1.3)
    - isGebaseerdOpStukdeelIdentificatie (Uitgestelde functionaliteit. Voornaamste aanleiding versie 1.3)
    - isVermeldInStukdeelIdentificaties (Uitgestelde functionaliteit. Voornaamste aanleiding versie 1.3)
  - Links toegevoegd:
    - stukken (Uitgestelde functionaliteit. Voornaamste aanleiding versie 1.3)
    - stukdelen (Uitgestelde functionaliteit. Voornaamste aanleiding versie 1.3)
  - Accept-Crs header en Content-Crs header zijn verwijderd bij:
    - /kadastraalonroerendezaken/{kadastraalOnroerendeZaakIdentificatie}/privaatrechtelijkebeperkingen
    - /kadastraalonroerendezaken/{kadastraalOnroerendeZaakIdentificatie}/privaatrechtelijkebeperkingen/{privaatrechtelijkebeperkingIdentificatie}


- publiekrechtelijkeBeperkingen
  - Properties toegevoegd:
    - stukIdentificaties (Uitgestelde functionaliteit. Voornaamste aanleiding versie 1.3)
    - isGebaseerdOpStukdeelIdentificatie (Uitgestelde functionaliteit. Voornaamste aanleiding versie 1.3)
    - isVermeldInStukdeelIdentificaties (Uitgestelde functionaliteit. Voornaamste aanleiding versie 1.3)
  - Links toegevoegd:
    - stukken (Uitgestelde functionaliteit. Voornaamste aanleiding versie 1.3)
    - stukdelen (Uitgestelde functionaliteit. Voornaamste aanleiding versie 1.3)


- zakelijkGerechtigde
  - zakelijkRecht toegevoegd
  - Properties toegevoegd:
    - zakelijkRecht.stukIdentificaties (Uitgestelde functionaliteit. Voornaamste aanleiding versie 1.3)
    - zakelijkRecht.isGebaseerdOpStukdeelIdentificatie (Uitgestelde functionaliteit. Voornaamste aanleiding versie 1.3)
    - zakelijkRecht.isVermeldInStukdeelIdentificaties (Uitgestelde functionaliteit. Voornaamste aanleiding versie 1.3)
    - erfpachtCanon.StukIdentificaties (Uitgestelde functionaliteit. Voornaamste aanleiding versie 1.3)
    - erfpachtCanon.isGebaseerdOpStukdeelIdentificatie (Uitgestelde functionaliteit. Voornaamste aanleiding versie 1.3)
    - erfpachtCanon.isVermeldInStukdeelIdentificaties (Uitgestelde functionaliteit. Voornaamste aanleiding versie 1.3)
    - tenaamstelling.StukIdentificaties (Uitgestelde functionaliteit. Voornaamste aanleiding versie 1.3)
    - tenaamstelling.isGebaseerdOpStukdeelIdentificatie (Uitgestelde functionaliteit. Voornaamste aanleiding versie 1.3)
    - tenaamstelling.isVermeldInStukdeelIdentificaties (Uitgestelde functionaliteit. Voornaamste aanleiding versie 1.3)
  - Links toegevoegd:
    - stukken (Uitgestelde functionaliteit. Voornaamste aanleiding versie 1.3)
    - stukdelen (Uitgestelde functionaliteit. Voornaamste aanleiding versie 1.3)


- KadasterNatuurlijkPersoon
  - Property geheimhoudingPersoonsgegevens is deprecated verklaard.


- LocatieKadastraalObject
  - Property adresseerbaarObjectIdentificatie toegevoegd


- AantekeningBasis
  - Property betreftGedeelteVanPerceel is deprecated verklaard.


- Aantekening
  - Properties toegevoegd:
    - stukIdentificaties (Uitgestelde functionaliteit. Voornaamste aanleiding versie 1.3)
    - isGebaseerdOpStukdeelIdentificatie (Uitgestelde functionaliteit. Voornaamste aanleiding versie 1.3)
    - isVermeldInStukdeelIdentificaties (Uitgestelde functionaliteit. Voornaamste aanleiding versie 1.3)


- Nieuwe componenten toegevoegd:
  - Filiatie
  - KadastraalOnroerendeZaakFiliatie
  - AppartementsrechtFiliatie
  - PerceelFiliatie
  - PerceelBasis
  - KadastraalOnroerendeZaakBasis
  - AppartementsrechtBasis
  - ZakelijkRecht  
  - Stuk
  - DeelEnNummer
  - EquivalentieVerklaarder
  - Kadasterverzoek
  - RedenVerzoek
  - Stukdeel  
  - AantekeningHypotheek

### issues:

  Alle issues die in deze release zijn opgelost hebben in de issues-lijst het label "BRK-Bevragen 1.3.0" gekregen. Door op dit label te filteren in de (gesloten) issues is een gedetailleerd overzicht van wijzigingen en bug-fixes te krijgen.


### documentatie:

  - Om het publiceren van onze specificaties met Github Pages mogelijk te maken zijn diverse documenten verplaatst naar de /docs.
  - N.a.v. de constructie om naar stukken en stukdelen te verwijzen vanuit meerdere properties in verschillende groepen van dezelfde resource is de feature [uri-templating](https://raw.githubusercontent.com/VNG-Realisatie/Haal-Centraal-common/master/features/uri-templating.feature) uitgebreid.
  - Via https://kadaster.github.io/BRK-bevragen/ is de repository ook te raadplegen. Inmiddels wordt de specificatie ook met Redoc ontsloten.


## **Versie 1.2.0:**

### openapi.yaml

- Algemeen
  - Nieuwe endpoints toegevoegd voor hypotheken, beslagen, privaatrechtelijke- en publiekrechtelijke Beperkingen
  - Enkele properties deprecated verklaard
  - Diverse verbeteringen in de documentatie (descriptions) en examples.
  - Er is gebruikgemaakt van Haal-Centraal-common versie 1.2.0 (was 1.0.0)
  - De default-waarde voor de Accept-Crs header is verwijderd.
  - Uit alle componentnamen zijn de underscores verwijderd.


- hypotheken
  - 2 nieuwe endpoints:
    - /kadastraalonroerendezaken/{kadastraalonroerendezaakidentificatie}/hypotheken
    - /kadastraalonroerendezaken/{kadastraalonroerendezaakidentificatie}/hypotheken/{hypotheekidentificatie}


- beslagen
  - 2 nieuwe endpoints:
    - /kadastraalonroerendezaken/{kadastraalonroerendezaakidentificatie}/beslagen
    - /kadastraalonroerendezaken/{kadastraalonroerendezaakidentificatie}/beslagen/{beslagidentificatie}


- privaatrechtelijkeBeperkingen
  - 2 nieuwe endpoints:
    - /kadastraalonroerendezaken/{kadastraalonroerendezaakidentificatie}/privaatrechtelijkebeperkingen
    - /kadastraalonroerendezaken/{kadastraalonroerendezaakidentificatie}/privaatrechtelijkebeperkingen/{privaatrechtelijkebeperkingidentificatie}


- publiekrechtelijkeBeperkingen
  - 1 nieuw endpoint:   
    - /publiekrechtelijkebeperkingen


- kadastraalOnroerendeZaken
  - De default-waarde voor de Accept-Crs header is verwijderd bij /kadastraalonroerendezaken/{kadastraalonroerendezaakidentificatie}
  - privaatrechtelijkeBeperkingen is toegevoegd aan de _embedded en de _links. hypotheken en beslagen zijn toegevoegd aan de _links. De bijbehorende identificaties zijn opgenomen in de kadastraalOnroerendeZaak.
  - locatieKadastraalObject levert naast nummeraanduidingIdentificatie nu ook het adres.


- zakelijkGerechtigden
  - Accept-Crs header en Content-Crs header zijn toegevoegd bij
    - /kadastraalonroerendezaken/{kadastraalonroerendezaakidentificatie}/zakelijkgerechtigden/{zakelijkgerechtigdeidentificatie}
    - /kadastraalonroerendezaken/{kadastraalonroerendezaakidentificatie}/zakelijkgerechtigden


- aantekening  
  - Properties begrenzing en indicatieOorspronkelijkObject worden niet meer geleverd en zijn deprecated verklaard


- kadasterNatuurlijkPersonen
  - aanschrijfwijze, aanhef en gebruikInLopendeTekst zijn toegevoegd aan naam.


- heeftPartnerschap
  - Properties datumOntbinding en datumSluiting worden niet meer geleverd en zijn deprecated verklaard

### features:

De volgende features zijn toegevoegd:
- aanhef.features
- aanschrijfwijze.features
- gebruik_in_lopende_tekst.feature
- voorletters.feature

### issues:

Alle issues die in deze release zijn opgelost hebben in de issues-lijst het label "BRK-Bevragen 1.2.0" gekregen. Door op dit label te filteren in de (gesloten) issues is een gedetailleerd overzicht van wijzigingen en bug-fixes te krijgen.

Known issues die voor versie 1.2.1 gepland zijn :
 #521: bij zoeken personen worden niet alle gegevens geleverd
 #725: bij zoeken natuurlijk personen worden aanschrijfwijze, aanhef en gebruikInLopendeTekst niet correct gevuld



## **Versie 1.1.1:**

Inhoudelijk is er in deze patch niets gewijzigd.
De structuur van de yaml-bestanden is aangepast omdat het bestand erg groot en onoverzichtelijk werd.
Door deze opslitsing is het beheer overzichtelijker en is het werken aan toekomstige wijzigingen beter te managen.

De openapi.yaml in de genereervariant is gewijzigd als gevolg van het gebruiken van een andere generator voor het resolven.
Deze wijzigingen betreffen hoofdzakelijk volgorde wijzigingen van schemacomponenten.
Daarnaast zijn er enkele parameter-properties met default-waarden nu expliciet opgenomen in de genereervariant.   

## **Versie 1.1.0:**

De repository is opgeschoond. Mappen die overbodig waren zijn verwijderd. De specificatie van de Waardelijsten API is verwijderd omdat die nog niet geïmplementeerd is.
Dit heeft ook gevolgen voor de tree: Map BRK-Bevragen is komen te vervallen en openapi.yaml en de map genereervariant staan direct onder de map /specificatie).

### openapi.yaml:

- Productie- en test-servers toegevoegd
- API-key toegevoegd
- Ongebruikte headers en foutcode uit de specificatie verwijderd
- Domein toegevoegd
- Onnodig geneste objecten als component gedefinieerd
- Namen van enkele query parameters aangepast
- Enkele property-namen aangepast

Enkele van deze wijzigingen zouden "breaking" zijn voor reeds gebouwde consumer-software. Op het moment van live-gang van versie 1.1.0 waren echter nog geen comsumer-implementaties in productie. Zodoende is besloten om de het versienummer met een minor op te hogen.

### features:

- Levering-koopsom.feature is gewijzigd
- Levering-velden.feature is gewijzigd

### code:

De map "code" is toegevoegd. Deze map bevat gegenereerde code voor C#, Java en Python. Dit wordt beschikbaar gesteld voor het gemak van ontwikkelaars. Het staat ontwikkelaars uiteraard vrij om eigen code te bouwen of genereren.

### testen:

De map "test" is toegevoegd. Deze map bevat testgevallen die in de testomgeving beschikbaar zijn.

### issues:

Alle issues die in deze release zijn opgelost hebben in de issues-lijst het label "BRK-Bevragen 1.1" gekregen. Door op dit label te filteren in de (gesloten) issues is een gedetailleerd overzicht van wijzigingen en bug-fixes te krijgen.
