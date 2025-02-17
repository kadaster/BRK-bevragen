# Design decisions HaalCentraal API's
In de onderliggende Design Decisions zijn de inzichten vastgelegd die zijn opgedaan bij het ontwerpen en specificeren van API's binnen het programma HaalCentraal. Ze geven steeds de huidige status aan van een leerproces en het is dus onderhevig aan voortschrijdend inzicht. Om die reden kan het zijn dat de specificaties die vroeg in het Haal Centraal programma vervaardigd zijn niet voldoen aan alle Design Decisions.
Op het moment dat een nieuwe versie van een API specificatie gepland wordt waarmee breaking changes worden doorgevoerd bepaalt de betreffende designer of dat een kans is om correcties door te voeren waardoor de API weer voldoet aan de onderstaande Design Decisions. Een nieuwe versie van een API specificatie met een breaking change houdt dus niet automatisch in dat deze is aangepast aan de Design Decisions.

Van de common.yaml specificatie, in de onderliggende repository, wordt zo nodig wel steeds direct een nieuwe versie uitgebracht.
In de releasenotes wordt dan aangegeven of de wijziging breaking is of niet (wat ook gevolgen kan hebben voor het versienummer). Daarmee kunnen nieuwe API's en API's in ontwikkeling optimaal bediend worden. Voor API's die gebruik maken van een "oude" versie van common.yaml geldt dat de API-designer bepaalt of bij een wijziging een nieuwe versie van de common.Yaml wordt gebruikt. De basis voor die beslissing is de impact voor de afnemers (consumers).

## Richtlijnen voor naamgeving

Onderstaande Design Decisions zijn een verbijzondering van paragraaf 6.1 van de [API Designrules Extensions](https://docs.geostandaarden.nl/api/API-Strategie-ext/#field-names-in-snake_case-camelcase-uppercamelcase-or-kebab-case).

### DD1.1 Geef een zo duidelijk mogelijke naam
We benoemen altijd zo duidelijk mogelijk wat iets is.

Hoofdregel is altijd:
1. propertynamen moeten zoveel mogelijk zelfverklarend zijn (lezen van de description om de betekenis te begrijpen is liefst niet nodig).
2. propertynamen zijn zo kort als mogelijk om toch voldoende duidelijk en onderscheidend te zijn en niet langer dan daarvoor nodig

### DD1.2 Namen van properties zijn in lowerCamelCase
Voor de namen van properties wordt lowerCamelCase toegepast.

### DD1.3 Schema componentnamen zijn in UpperCamelCase
Voor de namen van componenten in het schema wordt UpperCamelCase toegepast.

### DD1.4 Enumeratie-waarden zijn in snake_case
Voor de waarden van enumeraties wordt snake_case toegepast. Deze bevatten dus alleen kleine letters, cijfers en underscores. Geen spaties, geen speciale tekens en geen hoofdletters.

_**Ratio**_

In sommige development-omgevingen leveren hoofdletters, spaties of speciale tekens in enumeratie-waarden een probleem op met code-genereren.

### DD1.5 Namen van endpoints, url's en parameters bevatten alleen kleine letters
Voor de namen van endpoints, url's en parameters worden alleen kleine letters gebruikt.

### DD1.6 Naamgeving van properties worden beïnvloed door de kardinaliteit
* Een property die 1 maal voorkomt wordt in enkelvoud benoemd. Een property die als array gedefinieerd is wordt in meervoud benoemd.
* Als een relatie 1 keer kan voorkomen (kardinaliteit 0..1 of 1..1) dan wordt de naam van de resource in enkelvoud opgenomen; als de relatie meer dan 1 keer kan voorkomen (gedefinieerd als array), dan wordt de naam van de resource in meervoud opgenomen.

### DD1.7 Bij namen van relaties (links naar gerelateerde resources) gebruiken we in principe de naam van de betreffende resource als propertynaam voor de link
* Wanneer de gerelateerde resource één keer kan voorkomen wordt de resourcenaam omgezet naar enkelvoud. Wanneer de relatie meerdere keren kan voorkomen, wordt de resourcenaam in meervoud gebruikt.
* Bij gebruik van de resourcenaam als propertynaam wordt lowerCamelCase toegepast (zie DD1.2).
* Wanneer de resourcenaam niet voldoende beschrijvend is voor de betekenis van de relatie ("adres" is "verblijfplaats" van een persoon), of wanneer de resourcenaam niet onderscheidend is (ouders, partners en kinderen zijn allen relaties naar ingeschrevenpersonen) kan gekozen worden om bijvoorbeeld de relatienaam te gebruiken, of bijvoorbeeld de relatienaam gevolgd door de resourcenaam. Zo nodig wordt dit ingekort of aangepast om tot een bondige en duidelijke naam te komen.

  Bijvoorbeeld:

  * woonplaats (resource "woonplaatsen")

  * openbareRuimte (resource "openbareruimten")

  * verblijfplaats (resource "adressen")

  * kinderen (resource "ingeschrevenpersonen" en relatie "heeft kinderen")

### DD1.8 Namen van Identificatie properties zijn afhankelijk van het wel of niet voorkomen van sibling properties
Wanneer een relatie-property (niet link of embedded) alleen de identificatie van een gerelateerde resource bevat en geen andere properties, wordt als naam van de property de naam van de resource plus het woord 'Identificatie' gebruikt.

Bijvoorbeeld: _maakt deel uit van + pand + Identificatie = pandIdentificatie_

### DD1.9 Namen van parameters die geen onderdeel zijn van de op te vragen resource wijken af
Indien een parameter een element betreft dat geen onderdeel van de op te vragen resource is, maar onderdeel van een gerelateerde resource, een subresource of een gegevensgroep, dan wordt de elementnaam voorafgegaan door de betreffende resourcenaam of gegevensgroepnaam en vervolgens twee underscores.

Bijvoorbeeld:

  * ingeschrevenpersoon__burgerservicenummer

  * verblijfplaats__postcode

### DD1.10 Naamgeving van enumeratiewaarden wordt ontdaan van spaties en bijzondere tekens
Er wordt naar gestreefd om enumeratiewaarden te ontdoen van spaties en bijzondere tekens. Indien mogelijk worden spaties in enumeratiewaarden vervangen door underscores.

### DD1.11 Schema componentnamen voor domeinwaarden en enumeraties krijgen een vaste extensie
Schema componenten voor dynamische domeinwaarden (referentielijsten zoals "Tabel 32 Nationaliteitentabel") en enumeraties krijgen respectievelijk extensie "\_tabel" en "\_enum".

### DD1.12 Redundantie in propertynamen wordt verwijderd.
Dit is het geval wanneer in een propertynaam de gegevensgroepnaam of resourcenaam waar deze zich in bevindt wordt herhaald.

Bijvoorbeeld _verblijfstitelIngeschrevenNatuurlijkPersoon_ wordt _verblijfstitel_, _overlijdenIngeschrevenNatuurlijkPersoon_ wordt _overlijden_, _geboorteIngeschrevenNatuurlijkPersoon_ wordt _geboorte_, enz.

_**Ratio**_
* De namen zijn erg lang. Dit is niet bevorderlijk voor eenvoud van implementatie.
* Extensie "IngeschrevenNatuurlijkPersoon" is redundant, want het is al duidelijk dat het gaat over eigenschappen van een ingeschreven natuurlijk persoon.

### DD1.13 Beperk de lengte van enumeratiewaarden
De lengte van enumeratiewaarden wordt beperkt. Bijvoorbeeld "Opstalhouder Nutsvoorzieningen op gedeelte van perceel" krijgt als code "nutsvoorzieningen_gedeelte".

### DD1.14 Vermijd het gebruik van afkortingen in propertynamen
We vermijden het gebruik van afkortingen in propertynamen. Propertynamen moeten zoveel mogelijk zelfverklarend zijn.

### DD1.15 Neem 'tot' of 'totEnMet' op in de naam van een einddatum
Indien DD5.14 niet geldig is neem dan voor einddatums altijd expliciet in de naam de string "tot" of "totEnMet" op.

### DD1.16 Gebruik benamingen zoals gedefinieerd in een gegevenswoordenboek
Wanneer er een gegevenswoordenboek (gegevenscatalogus, informatiemodel) bestaat, gebruiken we voor corresponderende resource of voor corresponderende properties in een resource de naam zoals die in het gegevenswoordenbook staat, met inachtneming van de naamgevingsrichtlijnen zoals die in dit document staan benoemd, zoals gebruik (Upper)snakeCase.

Van de naam in het gegevenswoordenboek kan worden afgeweken in o.a. de volgende situaties:

* Weglaten van redundatie in de naam. Bijvoorbeeld "geboortedatum" in een gegevensgroep geboorte nemen we op als 'datum'.
* Uitschrijven van afkortingen. Bijvoorbeeld "BSN" nemen we op als 'burgerservicenummer'.
* Toevoegen van context, bijvoorbeeld wanneer het gegeven in een andere context wordt gebruikt dan in het gegevenswoordenboek. Bijvoorbeeld het opnemen van gegeven 'identificatie' van een woonplaats bij een nummeraanduiding wordt property 'woonplaatsIdentificatie'.
* Een van het gegeven via een algoritme afgeleide property. Bijvoorbeeld 'leeftijd' van 'geboortedatum'.

### DD1.17 Maak alleen gebruik van 'title' indien wordt afgeweken van de naam van het corresponderende gegeven in het gegevenswoordenboek
Bij de naamgeving van een property komt het voor dat vergaand wordt afgeweken van de naam van het corresponderende gegeven in het gegevenswoordenboek. Indien het een afwijking betreft anders dan het toepassen van lowerCamelCase, UpperCamelCase, snakeCase, inkorten, uitschrijven afkorting, enz. wordt de naam van dat gegeven in het gegevenswoordenboek opgenomen in het attribuut 'title' van de property definitie. Dit wordt echter alleen gedaan als het vermoeden bestaat dat dit voor sommige gebruikers tot verwarring kan leiden. In alle andere gevallen wordt 'title' niet opgenomen in de definitie van een property.
Het is verstandig om in deze situaties de afwijkende naamgeving voor het property eerst nog eens goed te overwegen.

### DD1.18 Streef naar het gebruik en interpretatie van gegevens mogelijk te maken zonder noodzaak tot domein- en algoritmekennis
Streef er naar het gebruik en interpretatie van gegevens in een resource (incl. hun mogelijke waarden) mogelijk te maken zonder dat daarvoor domeinkennis of kennis van complexe algoritmes nodig is.
_**Voorbeeld 1**_: I.p.v. voor de property 'indicatieGeheim' de waarden '0' of '1' te definiëren kun je ook de waarden 'true' en 'false' definiëren.
_**Voorbeeld 2**_: I.p.v. de property 'inOnderzoek' kan je juist kiezen voor 'mogelijkOnjuist' waaruit veel duidelijker wordt wat de functie is.

## Enumeraties en dynamische lijsten

### DD2.1 Dynamische domeinwaarden worden in de response opgenomen met zowel de code als de omschrijving
Voor een element van een referentielijst-type, wordt in de response zowel de code als de omschrijving opgenomen. Dit betreft dynamische lijsten (tabellen) met een code en waarde, zoals "Tabel 32 Nationaliteitentabel".

_**Ratio**_

Garanderen dat verschillende systemen binnen en buiten de gemeente dezelfde (toestand) van de referentielijst kennen is duur, ingewikkeld en foutgevoelig.

### DD2.2 Dynamische domeinwaarden worden in de query-parameters met de code opgenomen
Voor een query-parameter waarin een entry uit een waardelijst of een landelijke tabel als selectie-criterium wordt gebruikt wordt de *code* van de entry gebruikt.

### DD2.3 We gebruiken als enumeratiewaarden betekenisvolle waarden.
Dus niet M en V, maar man en vrouw.

_**Ratio**_

Een developer moet bij het coderen begrijpen wat de code betekent, om fouten in de implementatie te voorkomen.

_**Kanttekening**_

De lengte van de enumeratiewaarden zal zoveel mogelijk beperkt moeten worden (Zie DD2.6).

### DD2.4 Gebruik zo mogelijk boolean i.p.v. een enumeration
Eigenschappen die functioneel alleen de waarde Ja/aan/waar of Nee/uit/onwaar kunnen hebben, worden gedefinieerd als boolean. We gebruiken dus geen enumeratie zoals [J,N] voor dit soort situaties.

### DD2.5 Gebruik zo mogelijk string i.p.v. een enumeration
Wanneer een gegeven in het informatiemodel gedefinieerd is als een enumeratie, maar de enumeratiewaarde wordt door gebruikers van de API alleen gebruikt om als tekst te tonen aan eindgebruikers (mensen), definiëer het gegeven dan als string (niet als enumeratie) in de API.
Wanneer de enumeratiewaarde gebruikt wordt in code (algoritmes), definiëer dan een betekenisvolle maar bondige code.

_**Ratio**_

Het opnemen van de enumeratie in de API is een vorm van tight coupling.

## HAL, embedding en links

### DD3.1 Alleen gerelateerde resources uit dezelfde bron kunnen embed worden
Bijvoorbeeld in de resource van een ingeschreven natuurlijk persoon bij de BRP-bevraging kunnen de relaties partner(schap), ouders en kinderen embed worden opgenomen met gebruik van de expand-parameter. Dit betekent dat het mogelijk is in één aanroep de ingeschreven persoon te krijgen, met daarbij gegevens over de relaties met eventuele partner(s), ouders en kinderen.

Wanneer een gerelateerde resource expand wordt, wordt de gehele sub-resource teruggegeven, tenzij in de expand parameter alleen een deel van de gerelateerde resource gevraagd is.

Gegevens uit een andere bron/registratie (bijvoorbeeld het BAG-adres van een persoon) kunnen niet embed worden. Deze worden alleen als link opgenomen.

_**Ratio**_

We willen "tight coupling" met andere bronnen voorkomen. Over de domeinen heen wordt alleen met links verwezen.

_**Kanttekening**_

Er zijn grofweg twee categoriën Hal-links waar we gebruik van maken. Links naar resources binnen het eigen domein en links naar resources die in een ander domein beheerd worden. Om discoverability te bereiken, worden voor beide categorieën de Hal-link opgenomen naar de gerelateerde resource.

### DD3.2 We nemen geen (inverse) relaties uit een ander domein op
Vanuit andere registraties bestaan er relaties naar ingeschreven natuurlijk personen. Een persoon kan bijvoorbeeld zakelijk gerechtigde zijn van een Kadastraal object of functionaris zijn van een bedrijf.
Deze inverse relaties uit een andere bron worden niet opgenomen bij de ingeschreven natuurlijk persoon.
Wanneer er functionele behoefte is aan deze gegevens moeten deze bij de betreffende bron (bijvoorbeeld BRK of HR) worden opgevraagd.

_**Ratio**_

We bevragen gegevens bij de bron. Een bron kan alleen gegevens leveren die ze zelf heeft.

### DD3.3 Relaties kunnen maximaal één niveau diep worden embed
Door het gebruik van de parameter expand kunnen gerelateerde resources worden embed in het antwoord. Er is besloten dat relaties van de gerelateerde resource alleen als link worden opgenomen, deze worden zelf dus niet embed.

Bijvoorbeeld van een persoon kunnen de gegevens van de gerelateerde sub-resource huwelijk/geregistreerd partnerschap direct worden meegeladen. Daarin zitten alleen de gegevens van de relatie zoals die ook in betreffende categorie van LO GBA voorkomen, zoals ook de naam van de partner.
Wanneer echter de partner (ook) een ingeschreven persoon is, wordt alleen een hyperlink naar de resource van deze persoon opgenomen. De gegevens van deze ingeschreven persoon (de partner) mogen niet ook worden embed.

_**Ratio**_

Implementatie en gebruik eenvoudig houden. Er is geen functionele behoefte om diep gegevens te embedden.
Het opvragen van relaties is eenvoudig. Bij dieper embedden kan doelbinding een probleem worden. Bij dieper embedden kunnen er aan de provider-kant performanceproblemen ontstaan.

### DD3.4 De identificatie van de gerelateerde resources worden opgenomen in de content van de opgevraagde resource
Voor developers die geen HAL links willen gebruiken wordt tevens de identificatie van de gerelateerde resource opgenomen in de content van de opgevraagde resource.

## Historie

### DD4.1 Historie wordt gesorteerd op geldigheid met het meest actuele resultaat bovenaan
Historie wordt aflopend gesorteerd op datum geldigheid (datumVan).

### DD4.2 Bij historie wordt alleen de actuele situatie van inOnderzoek getoond
Binnen de historie-endpoints wordt alleen de actuele situatie met betrekking tot "in Onderzoek" getoond. Er wordt geen historie getoond van de onderzoeken die in het verleden hebben plaatsgevonden.  

### DD4.3 Gebruik standaard queryparameters voor datums bij historisch opvragen
Als queryparameters voor het historisch opvragen gebruiken we "peildatum", "datumVan" en "datumTotEnMet"

## Diversen

### DD5.1 Descriptions worden als sibling van $Ref's opgenomen

Waar in OAS3 een Description binnen een object naast een $ref niet toegestaan is (daar is geen enkele sibling geoorloofd) wordt deze in de draft van OAS3.1 wel toegestaan. Vooruitlopend op deze nieuwe versie is het binnen de HaalCentraal-specificaties geaccepteerd dat er binnen een object naast een $ref een Description wordt opgenomen.
In OAS3 wordt er in deze gevallen een warning gegeven, aangezien dit soort descriptions echter binnen de geresolvde versie van het yaml bestand niet meer voorkomen wordt deze warning voor lief genomen. [Zie hier](https://github.com/OAI/OpenAPI-Specification/issues/2033) voor een toelichting.
Om er voor te zorgen dat er in OAS3 toch een description wordt getoond wordt deze opgenomen in de description van het schema component waar de property met de $ref in is opgenomen. Het wordt dus naar een niveau hoger getild.

### DD5.2 We maken hergebruik van yaml-componenten d.m.v. absolute links
Bij hergebruik van Yaml-componenten wordt gebruik gemaakt van absolute links zodat de openapi.yaml in alle editors onderhoudbaar is en dus iedereen die een bijdrage wil leveren een pull-request kan indienen.

_**Ratio**_

We willen bijdragers tijdens het ontwikkeltraject niet dwingen om de file-structuuur van de provider-developer over te nemen. Dit leidt tot onnodige complexiteit op het ontkoppelpunt van provider en consumer tijdens het ontwikkeltraject.

_**Kanttekening**_

Nu verwijzen de links nog naar de master-branch van Haal-centraal-common. Op het moment dat de specificaties van 1 van de API's definitief wordt zal ook de common geversioneerd moeten worden (d.m.v. een release op github)

### DD5.3 Technische definities van properties alleen opnemen voor zover dat noodzakelijk is voor gebruik
Meestal volstaat het om in de definitie van properties in de response de _propertynaam, type, format, description_ en _example_ op te nemen.
We gebruiken daar niet de technische definities _pattern, minimum, maximum, minLength, maxLength, minItems_ en _required_, tenzij....
De technische definitie _title_ gebruiken we alleen wanneer de propertynaam afwijkt van de naam in het informatiemodel (en het informatiemodel bekend is bij veel gebruikers).
De technische definitie _enum_ gebruiken we wanneer (sommige/mogelijke) gebruikers de mogelijke waarden gebruiken in code/algoritmes en daarom moeten weten welke mogelijke waarden er zijn.  

### DD5.4 Gebruik geen oneOf of anyOf constructies voor polymorfe gegevens
We gebruiken geen oneOf of anyOf constructies voor polymorfe gegevens.

Alhoewel de oneOf constructie een valide OAS3 constructie is levert deze bij het genereren van code problemen op.
Deze constructie wordt ontweken door twee mogelijke alternatieven.
* De subtypes worden samengevoegd tot 1 object. Deze keuze is logisch als de subtypes grotendeels overlappen en er geen strijdigheid is tussen de verschillende mogelijke types.
* De subtypes worden volledig opgenomen als property van een object, met daarin de eigenschappen van dat type. In het response is altijd maar 1 van deze properties gevuld. Deze keuze is logisch als de subtypes weing gemeenschappelijke properties hebben.

In beide gevallen nemen we ook een type property (discriminator) op waaruit de gebruiker kan opmaken welk type het betreft.

_**Ratio**_

Diverse code-generatoren gaan dus niet goed om met deze constructie en genereren foutieve code.

_**Kanttekening**_

Mochten code-generatoren in de toekomst wel goed met deze constructie om kunnen gaan dan is het het overwegen waard om deze constructie aan te passen bij de eerstvolgende major (breaking) change.

### DD5.5 Alleen gegevens vastgelegd in de bronregistratie van de provider van de API worden opgenomen
In de API worden alleen gegevens opgenomen die zijn vastgelegd in de bronregistratie van de provider van de API. Een van de consequenties daarvan is DD3.2 het niet embedden van resources uit een andere registratie. Een andere consequentie is het niet opnemen van kerngegevens. Dus de regel is halen bij de bron, een consequentie (toelichting of voorbeeld) is het niet opnemen van gemeentelijke kerngegevens en plusgegevens.

_**Ratio**_

Het opnemen van gegevens uit een andere bron zorgt voor tight coupling met die andere bron.
Ook kan een bronsysteem niet zomaar gegevens uit een andere bron halen, zeker niet wanneer dat gegevens zijn waar autorisaties voor nodig zijn (zoals privacy gevoelige gegevens).
Tenslotte verhoogd het tevens moeten ontsluiten van gegevens uit andere bronnen de complexiteit nodeloos.

### DD5.6 De API filtert terug te geven gegevens op autorisatie van de organisatie
De API levert alleen gegevens terug waar de vragende organisatie voor geautoriseerd is.
Er worden geen aparte endpoints of resources gedefinieerd per autorisatieprofiel.

De bronhouder die gegevens ter beschikking stelt is verantwoordelijk voor het leveren van alleen gegevens waarvoor de juiste autorisatie bestaat. Bij de bronhouder gaat het om autorisatie op niveau van de vragende organisatie (gemeente).
De gemeente is er verantwoordelijk voor de resultaten van de API aanvraag te filteren op autorisatie van de betreffende gebruiker.

_**Ratio**_

Uitgangspunt in de architectuur is gedelegeerde autorisatie.

### DD5.7 De response heeft geen verplichte properties
Alle properties in de response worden in de Open API Specificaties gedefinieerd als optioneel, ook wanneer de betreffende attributen in het informatiemodel verplicht zijn.

_**Ratio**_

De hoeveelheid businesslogica in interface beperken. Zorgen dat zoveel mogelijk antwoord gegeven kan worden, ook wanneer een verwachte property geen waarde heeft. Het alternatief, het opnemen van de reden van geen waarde (zoals StUF:noValue) is dan niet nodig, wat het gebruik van de API eenvoudiger maakt.
Tevens compliceert het verplicht maken van elementen de toepassing van de "fields" en de "expand" parameters en het filteren van de terug te geven gegevens op autorisatie van de organisatie.

### DD5.8 Actuele zoekresultaten worden niet gesorteerd
De API standaard schrijft niet voor hoe zoekresultaten in de API moeten worden gesorteerd. Wanneer de client behoefte heeft aan gesorteerde resultaten, moet zij de ontvangen resultaten zelf sorteren.
Dit betekent dat er in de berichtspecificaties geen gebruik gemaakt wordt van de _'sorteer'_ parameter.

### DD5.9 Properties die gebruik maken van Booleans worden alleen geretourneerd als de waarde 'true' is
In diverse situaties worden booleans opgenomen als er sprake is van indicatoren. Deze booleans worden alleen geretourneerd als de waarde van de boolean ook informatief is. Dit soort properties worden dus alleen opgenomen als de waarde van de Boolean 'true' is.

### DD5.10 Identificatie van een resource zit altijd op het hoogste niveau van de resource
De identificatie van een resource zit, als die is opgenomen in de resource en gebruikt wordt als path-parameter van het resource-endpoint, altijd op het hoogste niveau van de resource in de vorm en inhoud zoals die wordt opgenomen in de uri (path-parameter) van de resource.

### DD5.11 Neem voor properties geen waarden op met een speciale betekenis
We nemen geen waarden op met een speciale betekenis die afwijkt van de normale betekenis van het gegeven.

* bijvoorbeeld datum "0000-00-00" om aan te geven dat een datum onbekend is
* bijvoorbeeld landcode "0000" om aan te geven dat het land onbekend is

### DD5.12 Neem geen reden op over het afwezig/leeg zijn van een gegeven
We nemen geen reden op over het leeg/afwezig zijn van een waarde van een gegeven (zoals met StUF:noValue werd gedaan), tenzij duidelijk is dat er bij de gebruikers behoefte is om dit te weten.

### DD5.13 Neem een indicator op als het gevuld zijn van een datum functionele betekenis heeft
Wanneer het gevuld zijn van een datum functionele betekenis heeft, ook wanneer deze volledig onbekend is, wordt een indicator opgenomen om dit aan te geven. Bijvoorbeeld of een persoon overleden is kan niet worden afgeleid uit het bestaan van een overlijdensdatum wanneer die datum onbekend is. Daarvoor kan een boolean "indicatieOverleden" worden gedefinieerd.

### DD5.14 Gebruik bestaande functionele gegevens voor begin- en einddatum
Wanneer er voor een begindatum of einddatum al een functioneel gegeven bestaat, gebruiken we die. Denk aan datumOntbindingHuwelijk of datumAanvangAdreshouding.

### DD5.15 Definieer 'datumTot' indien er behoefte is aan een einddatum maar afwezig in het informatiemodel
Wanneer een functioneel gegeven in het informatiemodel voor einddatum afwezig is terwijl daar wel behoefte aan is (omdat historie getoond wordt) gebruiken we "datumTot". Bijvoorbeeld in de BRP wordt alleen de begindatum van een verblijfplaats geregistreerd en geen einddatum. Daar is datumTot dus de datumAanvang van de volgende verblijfplaats.

### DD5.16 De description van een property moet semantisch overeenkomen met de betekenis van het gegeven in een gegevenswoordenboek
We nemen bij een property een description op die semantisch overeenkomt met de beschrijving in het gegevenswoordenboek. Deze kan ingekort, vereenvoudigd, of uitgebreid zijn, maar mag de betekenis van het gegeven niet laten afwijken van de betekenis van het corresponderende gegeven in het gegevenswoordenboek.

De description kan worden weggelaten wanneer evident is dat de gebruikers van de API uit de propertynaam weten wat bedoeld wordt (bijvoorbeeld huisnummer).

### DD5.17 Neem geen logica op in de description voor het samenstellen van de inhoud van een property
In de description van een property mag geen logica (algoritme) worden beschreven voor het samenstellen van de inhoud van het property.

 _**Ratio**_
 Opnemen van providerlogica veroorzaakt tight coupling tussen de bron-implementatie en de API.

### DD5.18 Vermijd een directe koppeling tussen definitie en structuur in een gegevenswoordenboek en een API
Er is geen directe koppeling tussen de definitie en structuur van gegevens in een gegevenswoordenboek (informatiemodel) en de definitie en structuur van de corresponderende resource en/of propertie in een API.

Voorbeelden:
* Een resource mag meer gegevens bevatten dan het corresponderende object uit het gegevenswoordenboek. Er mogen bijvoorbeeld gegevens uit gerelateerde objecten aan de resource worden toegevoegd. Bijvoorbeeld bij een nummeraanduiding wordt de woonplaatsnaam opgenomen.
* Een resource mag minder gegevens bevatten dan het corresponderende objecttype. In de resource worden alleen gegevens opgenomen waar behoefte aan is bij de gebruikers van de API.
* Verschillende elementen uit het object mogen worden samengevoegd tot éen property van de resource. Bijvoorbeeld aanschrijfwijze is samengesteld uit o.a. voornamen, tussenvoegsel en geslachtsnaam.
* Een element uit een model mag worden opgesplitst in meerdere properties in de resource. Bijvoorbeeld een mogelijk onbekende overlijdensdatum kan worden opgenomen als overlijdensdatum én indicatieOverleden.
* Een abstract objecttype mag als (concrete) resource worden gedefinieerd. Bijvoorbeeld adresseerbaar object wordt resource adresseerbareObjecten.
* Gegevens uit verschillende (gegevens)groepen mogen worden platgeslagen in de resource of in een gegevensgroep. Bijvoorbeeld Gemeente van inschrijving uit groep Inschrijving, functie adres uit groep Verblijfplaats en postcode uit groep Adres worden opgenomen in verblijfplaats.
* Een resource mag gegevens opnemen in een andere representatievorm.
  - Bijvoorbeeld Indicatie geheim kan de waarden 0 (niet geheim) of 7 (geheimhouding) hebben in het informatiemodel, maar in de API wordt dit opgenomen als boolean.
  - Bijvoorbeeld enumeratie Type openbare ruimte wordt opgenomen als string, wanneer deze waarde alleen voor mensenogen bedoeld is en niet door computercode geïnterpreteerd hoeft te worden.

_**Ratio**_

* Koppeling met de implementatie van de providerregistratie beperkt de evolvability van zowel de achterliggende systemen, als van de applicaties die de API gebruiken, als van de API zelf.
* Ontwerp van de resource gericht op de informatiebehoefte en het gebruik is eenvoudiger in gebruik en verkleint de kans op verkeerd gebruik.

### DD5.19 Hergebruik API specificaties van een andere bron indien daarvan gegevens zijn opgenomen
Wanneer in een API (comfort)gegevens worden opgenomen die authentiek zijn opgeslagen in een andere bron, worden deze bij voorkeur gemodelleerd op dezelfde manier als in die bron. Wanneer mogelijk wordt hergebruik gemaakt van de API specificatie van die andere bron (via $ref).

Bijvoorbeeld het adres (BAG) van een ingeschreven persoon (BRP) of vestiging (HR).
Bijvoorbeeld de naam en geboortedatum (BRP) van een eigenaar in BRK of functionaris in HR.

### DD5.20 Gebruik de 'allOf' constructie indien er meerdere componenten zijn met dezelfde properties
Wanneer er meerdere componenten zijn met meerdere dezelfde properties, moet er hergebruik worden gemaakt via een 'allOf' constructie. Dit sluit aan op object oriëntatie in de verschillende programmeeromgevingen.
* Bijvoorbeeld een woonadres en een postadres zijn identiek, behalve dat postadres ook een postbusnummer kent. Dan is postadres een extensie op woonadres.
* Bijvoorbeeld een natuurlijk persoon en een niet-natuurlijk persoon hebben beide een naam en een adres, maar beide hebben ook eigen gegevens (natuurlijk persoon heeft geboortedatum, niet-natuurlijk persoon heeft eigenaar), dan zijn beide een extensie op een bovenliggende component "Persoon".
* Bijvoorbeeld bij een zakelijkGerechtigde worden alleen minimale identificerende gegevens van een persoon opgenomen (alleen naam en identificatie), maar bij de persoon (resource) worden meer eigenschappen van de persoon opgenomen (zoals adres). Dan gebrukt zakelijkGerechtigde het component "persoonBeperkt" en is de uitgebreide persoon een extensie hierop.

### DD5.21 Plaats bij het gebruik van 'allOf' het hergebruikte component als eerste
Bij het gebruik van 'allOf' staat de component die hergebruikt wordt altijd eerst, en staan de toegevoegde properties als tweede.

Voorbeeld van het correct gebruik van 'allOf':

```
     NaamPersoon:
       allOf:
         - $ref: "#/components/schemas/Naam"
         - description: "Gegevens over de naam van de persoon"
           properties:
             aanhef:
               type: "string"
```

Voorbeeld van foutief gebruik van 'allOf':

```
 	NaamPersoon:
 	      allOf:
 	        - description: "Gegevens over de naam van de persoon"
 	          properties:
 	            aanhef:
 	              type: "string"
 	        - $ref: "#/components/schemas/Naam"
```

_**Ratio**_

Afwijken van deze regel leidt tot problemen bij het genereren van code uit de API specificaties.

### DD5.22 Bij het gebruik van 'allOf' is er slechts 1 component waarnaar gerefereerd wordt
Bij gebruik van allOf is er altijd exact één component waarnaar gerefereerd wordt en één gedefinieerd object met ten minste één property.

Voorbeeld van het foutief gebruik van allOf:

```
     NaamPersoon:
       allOf:
         - $ref: "#/components/schemas/Naam"
         - $ref: "#/components/schemas/Aanschrijfwijze"
         - description: "Gegevens over de naam van de persoon"
           properties:
             aanhef:
               type: "string"
```

Er wordt hier uit twee componenten overgeërfd wat niet correct is.

Voorbeeld van het foutief gebruik van allOf:

```
     NaamPersoon:
       allOf:
         - $ref: "#/components/schemas/Naam"
         - description: "Gegevens over de naam van de persoon"
```

NaamPersoon heeft geen eigen properties wat niet correct is.

_**Ratio**_

Afwijken van deze regel leidt tot problemen bij het genereren van code uit de API specificaties.

### DD5.23 Alleen HTTP-foutcodes die kunnen voorkomen worden opgenomen in de specificatie
Bij verschillende operaties zijn verschillende foutcodes van toepassing. Zo zal bij het bevragen van een collectie geen 404 optreden als er geen resultaat is, maar wordt er een lege collectie geretourneerd.
Dan hoeft de 404 foutcode ook niet gespecificeerd te worden. Als "best practice" worden de volgende foutcodes bij per operatie gedefinieerd.
* Bij een **get** operatie, zonder pad-parameter in de url, die een array als response oplevert:
  * 200 Geslaagd
  * 400 Bad request
  * 401 Unauthorized
  * 403 Forbidden
  * 406 Not Acceptable
  * 412 Precondition Failed (indien er request-headers zijn opgenomen)
  * 415 Unsupported Media Type (Alleen als content-negotiation wordt toegepast)
  * 500 Internal Server Error
  * 503 Service Unavailable
  * default
* Bij een **get** operatie waarbij een pad-parameter in de url is opgenomen:
    * 200 Geslaagd
    * 400 Bad request
    * 401 Unauthorized
    * 403 Forbidden
    * 404 Not Found
    * 406 Not Acceptable
    * 412 Precondition Failed (indien er request-headers zijn opgenomen)
    * 415 Unsupported Media Type (Alleen als content-negotiation wordt toegepast)
    * 500 Internal Server Error
    * 503 Service Unavailable
    * default
