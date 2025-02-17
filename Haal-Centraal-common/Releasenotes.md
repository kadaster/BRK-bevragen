# Releasenotes Haal-Centraal-common

## Versie 1.2.0 :

### Common.yaml :

- DatumOnvolledig is toegevoegd als CamelCase tegenhanger van Datum_onvolledig (deprecated).
    Deze constructie (t.b.v. evolvability) zorgt ervoor dat
    - je geen duplicaat krijgt van een schema en
    - maakt het mogelijk voor een provider om wel al te linken naar deze versie (voor bijvoorbeeld de nieuwe HalPaginationLinks en HalPaginationLinksMetLast schemas) zonder Datum_onvolledig ook te moeten vervangen.
    Deze constructie is wel een overtreding van DD5.21 (een allOf zonder extra properties toevoegingen).
- Contact, license en paths toegevoegd om valide OAS3 te krijgen ivm linter-parametervalidatie (primair voor intern beheer)
- datumvan --> datumVan
- datumtotenmet --> datumTotEnMet
- Bij foutmeldingen type aangepast zodat de URL correct verwijst naar de betreffende section
- Diverse descriptions voor standaard Hal-componenten aangepast.
- Bij paginering de embedded object definitie vervangen door $ref's
- Bij diverse properties de overbodige titles verwijderd

### features:

- expand.feature aangepast
- fields.feature aangepast
- wildcard.feature aangepast
- toevoeging onvolledige_datum.feature toegevoegd (overgenomen uit BRP-repository)
- toevoeging self.links feature

### Design Decisions aangepast

- DD1.17 aangepast

### linter-validatie toegevoegd

- Dit is voornamelijk voor interne kwaliteitsborging en heeft geen effect op het gebruik van de common zoals bedoeld.

## Versie 1.1.0 :

### Common.yaml :

- Toevoegen van de last link aan de paginerings-links.
- Default uit de CRS-headers verwijderd

### features:

- mogelijkOnjuist.feature verwijderd (obsolete)
- paginering.feature toegevoegd
- toevoeging foutmelding voor array minItems en maxItems (foutafhandeling.feature)
- toevoeging voor foutmelding voor type number (foutafhandeling.feature)
- toevoeging scenario's requiest headre Content-Crs (foutafhandeling.feature)
- toevoeging scenario voor niet ondersteunen parametercombinatie (foutafhandeling.feature)
- toevoeging scenario niet leveren templated link bij ontbreken gerelateerde identificatie (url-templating.feature)
