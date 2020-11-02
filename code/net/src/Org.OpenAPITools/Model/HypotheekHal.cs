/* 
 * Kadaster - BRK-Bevragen API
 *
 * D.m.v. deze toepassing worden meerdere, korte bevragingen op de Basis Registratie Kadaster beschikbaar gesteld. Deze toepassing betreft het verstrekken van Kadastrale Onroerende Zaak informatie. 
 *
 * The version of the OpenAPI document: 1.2.0
 * 
 * Generated by: https://github.com/openapitools/openapi-generator.git
 */

using System;
using System.Linq;
using System.IO;
using System.Text;
using System.Text.RegularExpressions;
using System.Collections;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Runtime.Serialization;
using Newtonsoft.Json;
using Newtonsoft.Json.Converters;
using System.ComponentModel.DataAnnotations;
using OpenAPIDateConverter = Org.OpenAPITools.Client.OpenAPIDateConverter;

namespace Org.OpenAPITools.Model
{
    /// <summary>
    /// HypotheekHal
    /// </summary>
    [DataContract]
    public partial class HypotheekHal :  IEquatable<HypotheekHal>, IValidatableObject
    {
        /// <summary>
        /// Initializes a new instance of the <see cref="HypotheekHal" /> class.
        /// </summary>
        /// <param name="identificatie">identificatie.</param>
        /// <param name="domein">Het domein waartoe de identificatie behoort. .</param>
        /// <param name="aandeelInBetrokkenRecht">aandeelInBetrokkenRecht.</param>
        /// <param name="gedeeltelijkeBezwaringOudObject">gedeeltelijkeBezwaringOudObject.</param>
        /// <param name="omschrijvingBetrokkenRecht">omschrijvingBetrokkenRecht.</param>
        /// <param name="toelichtingBewaarder">Toelichtende tekst van de bewaarder. De bewaarder is iemand die bij het Kadaster werkt. Hij schrijft stukken in in de openbare registers en de basisregistratie Kadaster conform de Kadasterwet. .</param>
        /// <param name="betreftGedeelteVanPerceel">betreftGedeelteVanPerceel.</param>
        /// <param name="aantekeningen">aantekeningen.</param>
        /// <param name="hypotheekhouders">Een hypotheekhouder vestigt als geldverstrekker een recht van hypotheek als zekerheid voor de lening. .</param>
        /// <param name="bedragZekerheidsstelling">bedragZekerheidsstelling.</param>
        /// <param name="links">links.</param>
        public HypotheekHal(string identificatie = default(string), string domein = default(string), TypeBreuk aandeelInBetrokkenRecht = default(TypeBreuk), bool gedeeltelijkeBezwaringOudObject = default(bool), Waardelijst omschrijvingBetrokkenRecht = default(Waardelijst), string toelichtingBewaarder = default(string), bool betreftGedeelteVanPerceel = default(bool), List<AantekeningBasis> aantekeningen = default(List<AantekeningBasis>), List<PersoonBeperkt> hypotheekhouders = default(List<PersoonBeperkt>), Bedrag bedragZekerheidsstelling = default(Bedrag), HypotheekLinks links = default(HypotheekLinks))
        {
            this.Identificatie = identificatie;
            this.Domein = domein;
            this.AandeelInBetrokkenRecht = aandeelInBetrokkenRecht;
            this.GedeeltelijkeBezwaringOudObject = gedeeltelijkeBezwaringOudObject;
            this.OmschrijvingBetrokkenRecht = omschrijvingBetrokkenRecht;
            this.ToelichtingBewaarder = toelichtingBewaarder;
            this.BetreftGedeelteVanPerceel = betreftGedeelteVanPerceel;
            this.Aantekeningen = aantekeningen;
            this.Hypotheekhouders = hypotheekhouders;
            this.BedragZekerheidsstelling = bedragZekerheidsstelling;
            this.Links = links;
        }
        
        /// <summary>
        /// Gets or Sets Identificatie
        /// </summary>
        [DataMember(Name="identificatie", EmitDefaultValue=false)]
        public string Identificatie { get; set; }

        /// <summary>
        /// Het domein waartoe de identificatie behoort. 
        /// </summary>
        /// <value>Het domein waartoe de identificatie behoort. </value>
        [DataMember(Name="domein", EmitDefaultValue=false)]
        public string Domein { get; set; }

        /// <summary>
        /// Gets or Sets AandeelInBetrokkenRecht
        /// </summary>
        [DataMember(Name="aandeelInBetrokkenRecht", EmitDefaultValue=false)]
        public TypeBreuk AandeelInBetrokkenRecht { get; set; }

        /// <summary>
        /// Gets or Sets GedeeltelijkeBezwaringOudObject
        /// </summary>
        [DataMember(Name="gedeeltelijkeBezwaringOudObject", EmitDefaultValue=false)]
        public bool GedeeltelijkeBezwaringOudObject { get; set; }

        /// <summary>
        /// Gets or Sets OmschrijvingBetrokkenRecht
        /// </summary>
        [DataMember(Name="omschrijvingBetrokkenRecht", EmitDefaultValue=false)]
        public Waardelijst OmschrijvingBetrokkenRecht { get; set; }

        /// <summary>
        /// Toelichtende tekst van de bewaarder. De bewaarder is iemand die bij het Kadaster werkt. Hij schrijft stukken in in de openbare registers en de basisregistratie Kadaster conform de Kadasterwet. 
        /// </summary>
        /// <value>Toelichtende tekst van de bewaarder. De bewaarder is iemand die bij het Kadaster werkt. Hij schrijft stukken in in de openbare registers en de basisregistratie Kadaster conform de Kadasterwet. </value>
        [DataMember(Name="toelichtingBewaarder", EmitDefaultValue=false)]
        public string ToelichtingBewaarder { get; set; }

        /// <summary>
        /// Gets or Sets BetreftGedeelteVanPerceel
        /// </summary>
        [DataMember(Name="betreftGedeelteVanPerceel", EmitDefaultValue=false)]
        public bool BetreftGedeelteVanPerceel { get; set; }

        /// <summary>
        /// Gets or Sets Aantekeningen
        /// </summary>
        [DataMember(Name="aantekeningen", EmitDefaultValue=false)]
        public List<AantekeningBasis> Aantekeningen { get; set; }

        /// <summary>
        /// Een hypotheekhouder vestigt als geldverstrekker een recht van hypotheek als zekerheid voor de lening. 
        /// </summary>
        /// <value>Een hypotheekhouder vestigt als geldverstrekker een recht van hypotheek als zekerheid voor de lening. </value>
        [DataMember(Name="hypotheekhouders", EmitDefaultValue=false)]
        public List<PersoonBeperkt> Hypotheekhouders { get; set; }

        /// <summary>
        /// Gets or Sets BedragZekerheidsstelling
        /// </summary>
        [DataMember(Name="bedragZekerheidsstelling", EmitDefaultValue=false)]
        public Bedrag BedragZekerheidsstelling { get; set; }

        /// <summary>
        /// Gets or Sets Links
        /// </summary>
        [DataMember(Name="_links", EmitDefaultValue=false)]
        public HypotheekLinks Links { get; set; }

        /// <summary>
        /// Returns the string presentation of the object
        /// </summary>
        /// <returns>String presentation of the object</returns>
        public override string ToString()
        {
            var sb = new StringBuilder();
            sb.Append("class HypotheekHal {\n");
            sb.Append("  Identificatie: ").Append(Identificatie).Append("\n");
            sb.Append("  Domein: ").Append(Domein).Append("\n");
            sb.Append("  AandeelInBetrokkenRecht: ").Append(AandeelInBetrokkenRecht).Append("\n");
            sb.Append("  GedeeltelijkeBezwaringOudObject: ").Append(GedeeltelijkeBezwaringOudObject).Append("\n");
            sb.Append("  OmschrijvingBetrokkenRecht: ").Append(OmschrijvingBetrokkenRecht).Append("\n");
            sb.Append("  ToelichtingBewaarder: ").Append(ToelichtingBewaarder).Append("\n");
            sb.Append("  BetreftGedeelteVanPerceel: ").Append(BetreftGedeelteVanPerceel).Append("\n");
            sb.Append("  Aantekeningen: ").Append(Aantekeningen).Append("\n");
            sb.Append("  Hypotheekhouders: ").Append(Hypotheekhouders).Append("\n");
            sb.Append("  BedragZekerheidsstelling: ").Append(BedragZekerheidsstelling).Append("\n");
            sb.Append("  Links: ").Append(Links).Append("\n");
            sb.Append("}\n");
            return sb.ToString();
        }
  
        /// <summary>
        /// Returns the JSON string presentation of the object
        /// </summary>
        /// <returns>JSON string presentation of the object</returns>
        public virtual string ToJson()
        {
            return JsonConvert.SerializeObject(this, Formatting.Indented);
        }

        /// <summary>
        /// Returns true if objects are equal
        /// </summary>
        /// <param name="input">Object to be compared</param>
        /// <returns>Boolean</returns>
        public override bool Equals(object input)
        {
            return this.Equals(input as HypotheekHal);
        }

        /// <summary>
        /// Returns true if HypotheekHal instances are equal
        /// </summary>
        /// <param name="input">Instance of HypotheekHal to be compared</param>
        /// <returns>Boolean</returns>
        public bool Equals(HypotheekHal input)
        {
            if (input == null)
                return false;

            return 
                (
                    this.Identificatie == input.Identificatie ||
                    (this.Identificatie != null &&
                    this.Identificatie.Equals(input.Identificatie))
                ) && 
                (
                    this.Domein == input.Domein ||
                    (this.Domein != null &&
                    this.Domein.Equals(input.Domein))
                ) && 
                (
                    this.AandeelInBetrokkenRecht == input.AandeelInBetrokkenRecht ||
                    (this.AandeelInBetrokkenRecht != null &&
                    this.AandeelInBetrokkenRecht.Equals(input.AandeelInBetrokkenRecht))
                ) && 
                (
                    this.GedeeltelijkeBezwaringOudObject == input.GedeeltelijkeBezwaringOudObject ||
                    (this.GedeeltelijkeBezwaringOudObject != null &&
                    this.GedeeltelijkeBezwaringOudObject.Equals(input.GedeeltelijkeBezwaringOudObject))
                ) && 
                (
                    this.OmschrijvingBetrokkenRecht == input.OmschrijvingBetrokkenRecht ||
                    (this.OmschrijvingBetrokkenRecht != null &&
                    this.OmschrijvingBetrokkenRecht.Equals(input.OmschrijvingBetrokkenRecht))
                ) && 
                (
                    this.ToelichtingBewaarder == input.ToelichtingBewaarder ||
                    (this.ToelichtingBewaarder != null &&
                    this.ToelichtingBewaarder.Equals(input.ToelichtingBewaarder))
                ) && 
                (
                    this.BetreftGedeelteVanPerceel == input.BetreftGedeelteVanPerceel ||
                    (this.BetreftGedeelteVanPerceel != null &&
                    this.BetreftGedeelteVanPerceel.Equals(input.BetreftGedeelteVanPerceel))
                ) && 
                (
                    this.Aantekeningen == input.Aantekeningen ||
                    this.Aantekeningen != null &&
                    input.Aantekeningen != null &&
                    this.Aantekeningen.SequenceEqual(input.Aantekeningen)
                ) && 
                (
                    this.Hypotheekhouders == input.Hypotheekhouders ||
                    this.Hypotheekhouders != null &&
                    input.Hypotheekhouders != null &&
                    this.Hypotheekhouders.SequenceEqual(input.Hypotheekhouders)
                ) && 
                (
                    this.BedragZekerheidsstelling == input.BedragZekerheidsstelling ||
                    (this.BedragZekerheidsstelling != null &&
                    this.BedragZekerheidsstelling.Equals(input.BedragZekerheidsstelling))
                ) && 
                (
                    this.Links == input.Links ||
                    (this.Links != null &&
                    this.Links.Equals(input.Links))
                );
        }

        /// <summary>
        /// Gets the hash code
        /// </summary>
        /// <returns>Hash code</returns>
        public override int GetHashCode()
        {
            unchecked // Overflow is fine, just wrap
            {
                int hashCode = 41;
                if (this.Identificatie != null)
                    hashCode = hashCode * 59 + this.Identificatie.GetHashCode();
                if (this.Domein != null)
                    hashCode = hashCode * 59 + this.Domein.GetHashCode();
                if (this.AandeelInBetrokkenRecht != null)
                    hashCode = hashCode * 59 + this.AandeelInBetrokkenRecht.GetHashCode();
                if (this.GedeeltelijkeBezwaringOudObject != null)
                    hashCode = hashCode * 59 + this.GedeeltelijkeBezwaringOudObject.GetHashCode();
                if (this.OmschrijvingBetrokkenRecht != null)
                    hashCode = hashCode * 59 + this.OmschrijvingBetrokkenRecht.GetHashCode();
                if (this.ToelichtingBewaarder != null)
                    hashCode = hashCode * 59 + this.ToelichtingBewaarder.GetHashCode();
                if (this.BetreftGedeelteVanPerceel != null)
                    hashCode = hashCode * 59 + this.BetreftGedeelteVanPerceel.GetHashCode();
                if (this.Aantekeningen != null)
                    hashCode = hashCode * 59 + this.Aantekeningen.GetHashCode();
                if (this.Hypotheekhouders != null)
                    hashCode = hashCode * 59 + this.Hypotheekhouders.GetHashCode();
                if (this.BedragZekerheidsstelling != null)
                    hashCode = hashCode * 59 + this.BedragZekerheidsstelling.GetHashCode();
                if (this.Links != null)
                    hashCode = hashCode * 59 + this.Links.GetHashCode();
                return hashCode;
            }
        }

        /// <summary>
        /// To validate all properties of the instance
        /// </summary>
        /// <param name="validationContext">Validation context</param>
        /// <returns>Validation Result</returns>
        IEnumerable<System.ComponentModel.DataAnnotations.ValidationResult> IValidatableObject.Validate(ValidationContext validationContext)
        {
            yield break;
        }
    }

}