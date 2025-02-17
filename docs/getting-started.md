---
layout: page-with-side-nav
title: Getting Started
---
# Getting Started
De 'BRK Bevragen' API is gespecificeerd met behulp van de OpenAPI Specifications (OAS3).

Om aan te sluiten kun je de volgende stappen doorlopen:
1. [Aanmelden](#aanmelden) bij het kadaster om toegang te krijgen
2. Bekijk de [functionaliteit en specificaties](#functionaliteit-en-specificaties)
3. [Implementeer de API Client](#implementeer-de-api-client)
4. [Probeer en test de API](#probeer-en-test-de-api)
5. [Aansluiten op productie](#aansluiten-op-productie)

## Aanmelden
Meld je aan bij het kadaster om [aan te sluiten en voor toegang tot de testomgeving](https://formulieren.kadaster.nl/aanmelden_brk_bevragen). Je ontvangt dan o.a. een API-key die nodig is voor toegang tot de testomgeving.

## Functionaliteit en specificaties
Je kunt een visuele representatie van de specificatie bekijken met [Swagger UI]({{ site.baseurl }}/swagger-ui-2.0) of [Redoc]({{ site.baseurl }}/redoc-2.0).

Je kunt de [functionele documentatie](./features) vinden in de [features](./features).

### Beschikbare resources
De volgende Basis Registratie Kadaster gegevens kunnen opgevraagd worden:
- [Kadastraal onroerende zaak](#kadastraalonroerendezaak)
- [Zakelijk gerechtigde](#zakelijkgerechtigde)
- [Kadaster natuurlijk persoon](#kadasternatuurlijkpersoon)
- [Kadaster niet-natuurlijk persoon](#kadasternietnatuurlijkpersoon)
- [Hypotheek](#hypotheek)
- [Beslag](#beslag)
- [Privaatrechtelijke beperking](#privaatrechtelijkebeperking)
- [Publiekrechtelijke beperking](#publiekrechtelijkebeperking)
- [Stuk](#stuk)
- [Stukdeel](#stukdeel)

#### KadastraalOnroerendeZaak
- Opvragen van 1 specifiek kadastraalonroerendezaak resource o.b.v. een kadastraalonroerendezaakidentificatie.
- Opvragen van 1 specifiek kadastraalonroerendezaak resource o.b.v. een kadastraleaanduiding.
- Opvragen van 1 specifiek kadastraalonroerendezaak resource o.b.v. een nummeraanduidingIdentificatie.
- Opvragen van een collectie kadastraalonroerendezaak resources o.b.v. een adres (postcode, huisnummer, huisletter, huisnummertoevoeging).
- Opvragen van een collectie kadastraalonroerendezaak resources, waarbij een kadaster natuurlijk persoon rechthebbende is, o.b.v. een kadasterpersoonidentificatie.
- Opvragen van een collectie kadastraalonroerendezaak resources, waarbij een kadaster nietnatuurlijk persoon rechthebbende is, o.b.v. een kadasterpersoonidentificatie.
- Opvragen van een collectie kadastraalonroerendezaak resources, waarbij een ingeschreven natuurlijk persoon rechthebbende is, o.b.v. een burgerservicenummer.

#### ZakelijkGerechtigde
- Opvragen van een collectie zakelijkgerechtigde resources van 1 specifiek kadastraalonroerendezaak o.b.v. een kadastraalonroerendezaakidentificatie.
- Opvragen van 1 specifiek zakelijkgerechtigde resource o.b.v. een zakelijkgerechtigdeidentificatie.

#### KadasterNatuurlijkPersoon
- Opvragen van 1 specifiek kadaster natuurlijk persoon resource o.b.v. een kadasterpersoonidentificatie.
- Opvragen van een collectie kadaster natuurlijkpersoon resources o.b.v. een zoekterm. (Zie feature [zoeken kadasternatuurlijkpersoon](https://github.com/kadaster/BRK-bevragen/blob/master/features/zoeken-kadasternatuurlijkpersoon.feature))

#### KadasterNietNatuurlijkPersoon
- Opvragen van 1 specifiek kadaster nietnatuurlijk persoon resource o.b.v. kadasterpersoonidentificatie.
- Opvragen van een collectie kadaster nietnatuurlijk persoon resources o.b.v. een zoekterm. (Zie feature [zoeken kadasternietnatuurlijkpersoon](https://github.com/kadaster/BRK-bevragen/blob/master/features/zoeken-kadasternietnatuurlijkpersoon.feature))

#### Hypotheek
- Opvragen van 1 specifiek hypotheek resource o.b.v. hypotheekidentificatie en kadastraalonroerendezaakidentificatie.
- Opvragen van een collectie hypotheek resources behorende bij een kadastraal onroerende zaak o.b.v. een kadastraalonroerendezaakidentificatie.

#### Beslag
- Opvragen van 1 specifiek beslag resource o.b.v. beslagidentificatie en kadastraalonroerendezaakidentificatie.
- Opvragen van een collectie beslag resources behorende bij een kadastraal onroerende zaak o.b.v. een kadastraalonroerendezaakidentificatie.

#### PrivaatrechtelijkeBeperking
- Opvragen van 1 specifiek privaatrechtelijkebeperking resource o.b.v. privaatrechtelijkebeperkingidentificatie en kadastraalonroerendezaakidentificatie.
- Opvragen van een collectie privaatrechtelijkebeperking resources behorende bij een kadastraal onroerende zaak o.b.v. een kadastraalonroerendezaakidentificatie.

#### PubliekrechtelijkeBeperking
- Opvragen van een collectie publiekrechtelijkebeperking resources o.b.v. een kadastraalonroerendezaakidentificatie.

#### Stuk
- Opvragen van 1 specifiek stuk resource o.b.v. stukidentificatie.

#### Stukdeel
- Opvragen van 1 specifiek stukdeel resource o.b.v. stukdeelidentificatie.


### Algemeen
Verder zijn er nog een paar algemene functies die gelden voor alle bovenstaande aanvragen:
- Gebruik van de fields parameter om de response te filteren. (Voor werking, zie feature [fields](https://github.com/kadaster/BRK-bevragen/blob/master/Haal-Centraal-common/features/fields.feature))
- Gebruik van de expand parameter om subresources te ontsluiten. (Voor werking, zie feature [expand](https://github.com/kadaster/BRK-bevragen/blob/master/Haal-Centraal-common/features/expand.feature))
- Velden die altijd worden geleverd. (Voor werking, zie feature [levering velden](https://github.com/kadaster/BRK-bevragen/blob/master/features/levering-velden.feature))

|Resource                           |Velden                         |
|-----                              |------                         |
|KadastraalOnroerendeZaak           |identificatie, _links.self, type, domein |
|ZakelijkGerechtigde                |identificatie, _links.self, domein |
|KadasterNatuurlijkPersoon          |identificatie, _links.self, domein |
|KadasterNietNatuurlijkPersoon      |identificatie, _links.self, domein |
|Beslag                             |identificatie, _links.self, domein |
|hypotheek                          |identificatie, _links.self, domein |
|KadasterNietNatuurlijkPersoon      |identificatie, _links.self, domein |
|PrivaatrechtelijkeBeperking        |identificatie, _links.self, domein |
|PubliekrechtelijkeBeperking        |identificatie, domein |
|Stuk                               |identificatie, _links.self, domein |
|Stukdeel                           |identificatie, _links.self, domein |

- Combinatie van velden die altijd verplicht worden geleverd.

|Resource                           |Velden                         | Uitleg |
|-----                              |------                         |----- |
|KadastraalOnroerendeZaak           |koopsom & koopjaar & (aardCultuurBebouwd of aardCultuurOnBebouwd) | [levering koopsom](https://github.com/kadaster/BRK-bevragen/blob/master/features/levering-koopsom.feature)|

- [HAL links](https://tools.ietf.org/html/draft-kelly-json-hal-08), die soms [templated](https://github.com/kadaster/BRK-bevragen/blob/master/Haal-Centraal-common/features/uri-templating.feature) worden geleverd.

## Implementeer de API client
Client code kun je genereren met de "[genereervariant](https://github.com/VNG-Realisatie/Haal-Centraal-BAG-bevragen/blob/master/specificatie/genereervariant/openapi.yaml){:target="_blank" rel="noopener"}" van de API-specificaties en een code generator. Een overzicht met codegeneratoren kun je vinden op [OpenAPI.Tools](https://openapi.tools/#sdk){:target="_blank" rel="noopener"}.

Deze repo bevat scripts waarmee je met [OpenAPI Generator](https://openapi-generator.tech/){:target="_blank" rel="noopener"} client code kunt genereren in JAVA, .NET (Full Framework & Core) en Python. De makkelijkste manier om de code generatie scripts te gebruiken, is door deze repo te clonen. Na het clonen kun je met `npm install` de benodigde packages installeren en kun je met npm run <script naam> één van de volgende scripts uitvoeren:
- oas:generate-java-client (voor JAVA client code)
- oas:generate-netcore-client (voor .NET Core client code)
- oas:generate-net-client (voor .NET Full Framework client code)
- oas:generate-python-client (voor Python client code)

Een lijst met andere ondersteunde generator opties kun je vinden in de [Generators List](https://openapi-generator.tech/docs/generators){:target="_blank" rel="noopener"} van OpenAPI Generator.
Note. De prerequisite van OpenAPI Generator is JAVA. Je moet een JAVA runtime installeren voordat je OpenAPI Generator kunt gebruiken.

## Probeer en test de API
De werking van de API is het makkelijkst te testen met behulp van [Postman](https://www.getpostman.com/).
De [openapi.yaml](https://github.com/kadaster/BRK-bevragen/blob/master/specificatie/genereervariant/openapi.yaml){:target="_blank"} kun je importeren als project, waarna de verschillende requests worden ingeladen die deze API ondersteunt.
Je kunt ook het project dat we voor je heben gemaakt gebruiken: [BRK-Bevragen-postman-collection.json](https://github.com/kadaster/BRK-bevragen/blob/master/test/BRK-Bevragen-postman-collection.json){:target="_blank"}. Hierin moet je alleen de base url en authenticatie (API-key) nog invullen.

### Configureer de url en api key

1. Klik bij "Kadaster - BRK-Bevragen API" op de drie bolletjes.
2. Klik vervolgens op Edit
3. Selecteer tabblad "Authorization"
4. Kies TYPE "API Key"
5. Vul in Key: "x-api-key", Value: de API key die je van het Kadaster hebt ontvangen, Add to: "Header"
6. Selecteer tabblad "Variables"
7. Vul bij baseUrl INITIAL VALUE en bij CURRENT VALUE de url
8. Klik op de knop Update

De testomgeving van de API is te benaderen via de volgende urls:
- _Beveiligde verbinding met alleen API-key: https://api.brk.kadaster.nl/esd-eto-apikey/bevragen/v2/_

- _Beveiligde verbinding met API-key & mTLS: https://api.brk.kadaster.nl/esd-eto/bevragen/v2/_

Vraag hiervoor een [API-key en PKI-overheidscertificaat](https://www.kadaster.nl/zakelijk/producten/eigendom/brk-bevragen) aan.

### Testgevallen
Onderstaande tabellen bevatten testgevallen voor specifieke situaties waarmee de werking van de API kan worden getest op de test omgeving. Meer details over welke testdata in de testgevallen zit, vind je in [test cases](https://github.com/kadaster/BRK-bevragen/tree/master/test/cases)

#### Onroerende Zaken

<table>
	<tr>
		<th>Testgeval                                      </th>
		<th>Kadastraalobjectidentificatie / Kadastraleaanduiding  </th>
		<th>Postcode              </th>
		<th>Nummeraanduidingidentificatie</th>
		<th>Bijzonderheden</th>
	</tr>                                                                    
	<tr>
		<td>2 eigenaren (Kadaster Natuurlijk Persoon)      </td>
		<td>76870487970000<br/>Beekbergen K 4879</td>
		<td>7361EW 29             </td>
		<td>0200200000003734</td>
		<td><ul><li>alle velden gevuld</li><li>1x hypotheek</li><li>2x publiekrechtelijke beperking</li><li>1x privaatrechtelijke beperking</li></ul></td>
	</tr>
	<tr>
		<td>1 eigenaar (Kadaster Niet Natuurlijk Persoon)  </td>
		<td>76870488070000<br/>Beekbergen K 4880</td>
		<td>7361EW 27             </td>
		<td>0200200000003733</td>
		<td><ul><li>1x privaatrechtelijke beperking</li></ul></td>
	</tr>
	<tr>
		<td>1 eigenaar (Kadaster Natuurlijk Persoon)       </td>
		<td>76870482670000<br/>Beekbergen K 4826</td>
		<td>7361EW 25             </td>
		<td>0200200000003732</td>
		<td><ul><li>2x hypotheek</li></ul></td>
	</tr>
	<tr>
		<td>1 eigenaar (Kadaster Niet Natuurlijk Persoon)  </td>
		<td>76870482570000<br/>Beekbergen K 4825</td>
		<td>7361EW 21             </td>
		<td>0200200000003730</td>
		<td><ul><li>2 erfpachters met erfpachtcanon</li><li>1x hypotheek</li></ul></td>
	</tr>
	<tr>
		<td>1 eigenaar (Ingeschreven Natuurlijk Persoon)   </td>
		<td>22310827210003<br/>'s-Gravenhage N 8272 A3</td>
		<td>2517GL 84             </td>
		<td>0518200000842213</td>
		<td><ul><li>appartementsrecht</li><li>1x hypotheek</li><li>1x publiekrechtelijke beperking</li></ul></td>
	</tr>
	<tr>
		<td>1 eigenaar (Ingeschreven Natuurlijk Persoon)   </td>
		<td>22310827210004<br/>'s-Gravenhage N 8272 A4</td>
		<td>2517GL 85             </td>
		<td>0518200000609763</td>
		<td><ul><li>appartementsrecht</li></ul></td>
	</tr>
	<tr>
		<td>1 eigenaar (Ingeschreven Natuurlijk Persoon)   </td>
		<td>56020234070000<br/>Odoorn N 2340</td>
		<td>9573PA 3              </td>
		<td>1681200000000215</td>
		<td><ul><li>1 artikel5_3b</li><li>1x hypotheek</li></ul></td>
	</tr>
	<tr>
		<td>1 eigenaar (Ingeschreven Natuurlijk Persoon)   </td>
		<td>23280647970000<br/>Loosduinen H 6479</td>
		<td>2551XS 31<br/>2551XN 45<br/>2551XN 47<br/>2551XN 49<br/>2551XN 51             </td>
		<td>0518200000781378</td>
		<td><ul><li>meerdere adressen</li><li>1x privaatrechtelijke beperking</li></ul></td>
	</tr>
	<tr>
		<td>1 eigenaar (Ingeschreven Natuurlijk Persoon)   </td>
		<td>65490485370000<br/>Hellendoorn G 4853</td>
		<td>7441JC 1 a            </td>
		<td>0163200000554956</td>
		<td><ul><li>bevat huisletter</li></ul></td>
	</tr>
	<tr>
		<td>2 eigenaren (Ingeschreven &amp; Kadaster Natuurlijk Persoon)   </td>
		<td>65490485270000<br/>Hellendoorn G 4852</td>
		<td>7441JC 1              </td>
		<td>0163200000554954</td>
		<td></td>
	</tr>
	<tr>
		<td>1 eigenaar (Ingeschreven Natuurlijk Persoon)   </td>
		<td>24780711870000<br/>Voorschoten B 7118</td>
		<td>2252EB 14<br/>2252EB 14 B<br/>2252EB 14 C<br/>2252EB 14 D<br/>2252EB 16<br/>2252EB 18             </td>
		<td>0626200000001232<br/>0626200000013389<br/>0626200000013390<br/>0626200000013391<br/>0626200000001233<br/>0626200000001234</td>
		<td><ul><li>meerdere adressen</li><li>betrokkenGorzenEnAanwassen</li></ul></td>
	</tr>
	<tr>
		<td>1 eigenaar (Ingeschreven Natuurlijk Persoon)   </td>
		<td>17150075470000<br/>Hellevoetsluis E 754</td>
		<td>3224EA 39             </td>
		<td>0530200002127363</td>
		<td><ul><li>1x hypotheek</li><li>1x beslag</li></ul></td>
	</tr>
	<tr>
		<td>1 eigenaar (Kadaster Niet Natuurlijk Persoon)  </td>
		<td>22590043870000<br/>'s-Gravenhage AW 438</td>
		<td>2545NN 178<br/>2545NN 180<br/>2545NN 182            </td>
		<td>0518200000670296<br/>0518200000603608<br/>0518200000737306</td>
		<td><ul><li>1 erfpachter</li><li>meerdere adressen</li><li>betrokkenSamenwerkingsverband</li><li>2x privaatrechtelijke beperking</li></ul></td>
	</tr>
	<tr>
		<td>1 eigenaar (Ingeschreven Natuurlijk Persoon)   </td>
		<td>17500393970000<br/>IJsselmonde D 3939</td>
		<td>3078JG 4              </td>
		<td>0599200000316239</td>
		<td></td>
	</tr>
	<tr>
		<td>1 eigenaar (Ingeschreven Natuurlijk Persoon)   </td>
		<td>22360467970000<br/>'s-Gravenhage V 4679</td>
		<td>2597LD 58             </td>
		<td>0518200000436225</td>
		<td><ul><li>1 erfpachter</li><li>1x publiekrechtelijke beperking</li></ul></td>
	</tr>
	<tr>
		<td>1 eigenaar (Ingeschreven Natuurlijk Persoon)   </td>
		<td>19560032970000<br/>Rotterdam AF 329</td>
		<td>3011KD 70<br/>3011KD 72             </td>
		<td>0599200001012571<br/>0599200001012572</td>
		<td><ul><li>meerdere adressen</li><li>2x hypotheek</li><li>2x publiekrechtelijke beperking</li></ul></td>
	</tr>
	<tr>
		<td>2 eigenaren (Ingeschreven Natuurlijk Persoon)  </td>
		<td>17550448670000<br/>Kralingen C 4486</td>
		<td>3066VS 9              </td>
		<td>0599200000193766</td>
		<td><ul><li>betrokkenPartner</li><li>1x hypotheek</li></ul></td>
	</tr>
	<tr>
		<td>1 eigenaar (Kadaster Natuurlijk Persoon)</td>
		<td>76370602970000<br/>Apeldoorn AC 6029</td>
		<td> </td>
		<td> </td>
		<td> </td>
	</tr>
	<tr>
		<td>Filiatie</td>
		<td>22310691970000<br/>'s-Gravenhage N 6919</td>
		<td> </td>
		<td> </td>
		<td><ul><li>grondperceel van 22310827210004</li></ul></td>
	</tr>
	<tr>
		<td>Filiatie</td>
		<td>59020130970000<br/>Groningen P 1309</td>
		<td> </td>
		<td> </td>
		<td><ul><li>grondperceel van 59020170810218, 59020170810219, 59020170810593, 59020170810594</li></ul></td>
	</tr>
	<tr>
		<td>Filiatie</td>
		<td>59020170670000<br/>Groningen P 1706</td>
		<td> </td>
		<td> </td>
		<td><ul><li>grondperceel van 59020170810218, 59020170810219, 59020170810593, 59020170810594</li></ul></td>
	</tr>
	<tr>
		<td>Filiatie</td>
		<td>59020170810218<br/>Groningen P 1708 A218</td>
		<td> </td>
		<td> </td>
		<td> </td>
	</tr>
	<tr>
		<td>Filiatie</td>
		<td>59020170810219<br/>Groningen P 1708 A219</td>
		<td> </td>
		<td> </td>
		<td> </td>
	</tr>
	<tr>
		<td>Filiatie</td>
		<td>59020170810593<br/>Groningen P 1708 A593</td>
		<td> </td>
		<td> </td>
		<td> </td>
	</tr>
	<tr>
		<td>Filiatie</td>
		<td>59020170810594<br/>Groningen P 1708 A594</td>
		<td> </td>
		<td> </td>
		<td> </td>
	</tr>
	<tr>
		<td>Filiatie</td>
		<td>59020001970000<br/>Groningen P 19</td>
		<td> </td>
		<td> </td>
		<td>vervallen perceel</td>
	</tr>
	<tr>
		<td>Filiatie</td>
		<td>59020001870000<br/>Groningen P 18</td>
		<td> </td>
		<td> </td>
		<td>vervallen perceel</td>
	</tr>
	<tr>
		<td>Filiatie</td>
		<td>59020001770000<br/>Groningen P 17</td>
		<td> </td>
		<td> </td>
		<td>vervallen perceel</td>
	</tr>
	<tr>
		<td>Gesplitst zakelijkRecht</td>
		<td>59020139970000<br/>Groningen P 1399</td>
		<td> </td>
		<td> </td>
		<td>recht van erfpacht is gesplitst</td>
	</tr>
	<tr>
		<td>Gesplitst zakelijkRecht</td>
		<td>59020140010001<br/>Groningen P 1400 A1</td>
		<td> </td>
		<td> </td>
		<td> </td>
	</tr>
	<tr>
		<td>Gesplitst zakelijkRecht</td>
		<td>59020140010002<br/>Groningen P 1400 A2</td>
		<td> </td>
		<td> </td>
		<td> </td>
	</tr>

</table>

#### Kadaster Natuurlijke Personen

<table>
	<tr><th>Naam</th><th>Geboortedatum</th><th>KadasterPersoonIdentificatie</th><th>Bijzonderheden</th></tr>
	<tr><td>Willem Jansens</td><td>1971-11-01</td><td>70882239</td><td><ul><li>alle velden gevuld</li><li>woonadres is niet bekend in BAG</li><li>kan in de testomgeving alleen op gezocht worden via /kadasternatuurlijkpersonen?q=Jansens</li></ul></td></tr>
	<tr><td>Sidonia Jansens-Jan</td><td>1950-01-01</td><td>50550743</td><td><ul><li>buitenlands woonadres</li><li>kan in de testomgeving alleen op gezocht worden via /kadasternatuurlijkpersonen?q=Jansens-Jan</li></ul></td></tr>
	<tr><td>Christaan Goede</td><td>1971-11-01</td><td>71303564</td><td><ul><li>woonadres is wel bekend in BAG</li></ul></td></tr>
	<tr><td>Anne Janssens</td><td></td><td>80000001</td><td><ul><li>geslacht onbekend</li><li>kan in de testomgeving alleen op gezocht worden via /kadasternatuurlijkpersonen?q=Janssens</li></ul></td></tr>
	<tr><td>Jan Groenen</td><td></td><td>80000002</td><td><ul><li>aanduiding: eigen geslachtsnaam</li><li>kan in de testomgeving alleen op gezocht worden via /kadasternatuurlijkpersonen?q=Groenen</li></ul></td></tr>
	<tr><td>Susan in het Veld</td><td></td><td>80000003</td><td><ul><li>aanduiding: geslachtsnaam echtgenoot/geregistreerd partner na eigen geslachtsnaam</li><li>kan in de testomgeving alleen op gezocht worden via /kadasternatuurlijkpersonen?q=Veld</li></ul></td></tr>
	<tr><td>Petra Anne Veldwijk</td><td></td><td>80000004</td><td><ul><li>aanduiding: geslachtsnaam echtgenoot/geregistreerd partner</li><li>kan in de testomgeving alleen op gezocht worden via /kadasternatuurlijkpersonen?q=Veldwijk</li></ul></td></tr>
	<tr><td>H Pieters</td><td></td><td>80000005</td><td><ul><li>aanduiding: geslachtsnaam echtgenoot/geregistreerd partner voor eigen geslachtsnaam</li><li>kan in de testomgeving alleen op gezocht worden via /kadasternatuurlijkpersonen?q=Pieters</li></ul></td></tr>
	<tr><td>Öle Klaassen</td><td></td><td>80000006</td><td><ul><li>diakriet in voornaam</li><li>kan in de testomgeving alleen op gezocht worden via /kadasternatuurlijkpersonen?q=Klaassen</li></ul></td></tr>
	<tr><td>Baron Jan-Jaap de Vierde</td><td></td><td>80000007</td><td><ul><li>adellijke titel</li><li>kan in de testomgeving alleen op gezocht worden via /kadasternatuurlijkpersonen?q=Vierde</li></ul></td></tr>
	<tr><td>Piet Wielen</td><td></td><td>80000008</td><td><ul><li>kan in de testomgeving alleen op gezocht worden via /kadasternatuurlijkpersonen?q=Wielen</li></ul></td></tr>
	<tr><td>Harry Pier</td><td></td><td>70882250</td><td><ul><li>overleden</li><li>kan in de testomgeving alleen op gezocht worden via /kadasternatuurlijkpersonen?q=Pier</li></ul></td></tr>
	<tr><td>Bep Jansen</td><td></td><td>46299338</td><td><ul><li>kan in de testomgeving alleen op gezocht worden via /kadasternatuurlijkpersonen?q=Jansen</li></ul></td></tr>
</table>

#### Ingeschreven Natuurlijke Personen

<table>
	<tr><th>Naam</th><th>Burgerservice-nummer</th></tr>
	<tr><td>Linda Haglund</td><td>999991905</td></tr>
	<tr><td>Lisanty do Livramento...</td><td>999990482</td></tr>
	<tr><td>Merel Kooyman</td><td>999993847</td></tr>
	<tr><td>Suzanne van der Stappen</td><td>999993653</td></tr>
	<tr><td>Mirjam Heijn</td><td>999991292</td></tr>
	<tr><td>Jael de Jager</td><td>999992740</td></tr>
	<tr><td>Wladyslaw Kwasniewski</td><td>999995017</td></tr>
	<tr><td>Żáïŀëñøŕ Åłéèç Ðëļŧå Streeveld</td><td>999994669</td></tr>
	<tr><td>Adrianus Hendrikus Holthuizen</td><td>999990421</td></tr>
	<tr><td>Peter-Jan Meijden</td><td>999993872</td></tr>
	<tr><td>Paul Man</td><td>999990883</td></tr>
</table>

#### Niet Natuurlijke Personen

<table>
	<tr><th>Statutaire Naam             </th><th>Zetel        </th><th>Type                                </th><th>KadasterPersoonIdentificatie  </th>	<th>Bijzonderheden       </th></tr>
	<tr><td>Bankbedrijf                 </td><td>ROTTERDAM    </td><td>Kadaster Niet Natuurlijk Persoon    </td><td>71291440                      </td><td><ul><li>postadres is postbus</li><li>kan in de testomgeving alleen op gezocht worden via /kadasternietnatuurlijkpersonen?q=Bankbedrijf</li></ul></td></tr>
	<tr><td>Bankbedrijf van vrucht      </td><td>GRAVE        </td><td>Ingeschreven Niet Natuurlijk Persoon</td><td>71291493                      </td><td><ul><li>heeft niks op naam</li><li>kan in de testomgeving alleen op gezocht worden via /kadasternietnatuurlijkpersonen?q=Bankbedrijf van vrucht</li></ul></td></tr>
	<tr><td>Gassie Test B.V.             </td><td>GRONINGEN    </td><td>Ingeschreven Niet Natuurlijk Persoon</td><td>440650207                     </td><td><ul><li>kan in de testomgeving alleen op gezocht worden via /kadasternietnatuurlijkpersonen?q=Gassie Test B.V.</li></ul></td></tr>
	<tr><td>Gemeente Den Testland       </td><td>'S-GRAVENHAGE</td><td>Kadaster Niet Natuurlijk Persoon    </td><td>71291441                      </td><td><ul><li>kan in de testomgeving alleen op gezocht worden via /kadasternietnatuurlijkpersonen?q=Gemeente Den Testland</li></ul></td></tr>
	<tr><td>Woningstichting Den Testland</td><td>'S-GRAVENHAGE</td><td>Kadaster Niet Natuurlijk Persoon    </td><td>71291442                      </td><td><ul><li>kan in de testomgeving alleen op gezocht worden via /kadasternietnatuurlijkpersonen?q=Woningstichting Den Testland</li></ul></td></tr>
	<tr><td>De TestStaat</td><td>'S-GRAVENHAGE</td><td>Kadaster Niet Natuurlijk Persoon    </td><td>71291443                      </td><td><ul><li>kan in de testomgeving alleen op gezocht worden via /kadasternietnatuurlijkpersonen?q=De TestStaat</li></ul></td></tr>
	<tr><td>NederlandscheBanck N.V.</td><td>'S-GRAVENHAGE</td><td>Kadaster Niet Natuurlijk Persoon    </td><td>24268006                      </td><td><ul><li>kan in de testomgeving alleen op gezocht worden via /kadasternietnatuurlijkpersonen?q=NederlandscheBanck N.V.</li></ul></td></tr>
	<tr><td>Vereniging van eigenaars hoofdsplitsing</td><td>GRONINGEN</td><td>Kadaster Niet Natuurlijk Persoon    </td><td>419941781                     </td><td><ul><li>kan in de testomgeving alleen op gezocht worden via /kadasternietnatuurlijkpersonen?q=Vereniging van eigenaars hoofdsplitsing</li></ul></td></tr>
	<tr><td>Vereniging van eigenaars ondersplitsing</td><td>GRONINGEN</td><td>Kadaster Niet Natuurlijk Persoon    </td><td>552056080                     </td><td><ul><li>kan in de testomgeving alleen op gezocht worden via /kadasternietnatuurlijkpersonen?q=Vereniging van eigenaars ondersplitsing</li></ul></td></tr>
</table>

## Aansluiten op productie
Vraag voor het aansluiten op de productie omgeving een [API-key en PKI-overheidscertificaat](https://www.kadaster.nl/zakelijk/producten/eigendom/brk-bevragen) aan.

### URL
De productieomgeving van de API is te benaderen via de volgende url: https://api.brk.kadaster.nl/esd/bevragen/v2/
