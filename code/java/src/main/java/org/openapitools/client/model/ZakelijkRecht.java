/*
 * Kadaster - BRK-Bevragen API
 * D.m.v. deze toepassing worden meerdere, korte bevragingen op de Basis Registratie Kadaster beschikbaar gesteld. Deze toepassing betreft het verstrekken van Kadastrale Onroerende Zaak informatie. 
 *
 * The version of the OpenAPI document: 1.3.0
 * 
 *
 * NOTE: This class is auto generated by OpenAPI Generator (https://openapi-generator.tech).
 * https://openapi-generator.tech
 * Do not edit the class manually.
 */


package org.openapitools.client.model;

import java.util.Objects;
import java.util.Arrays;
import com.google.gson.TypeAdapter;
import com.google.gson.annotations.JsonAdapter;
import com.google.gson.annotations.SerializedName;
import com.google.gson.stream.JsonReader;
import com.google.gson.stream.JsonWriter;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * ZakelijkRecht
 */
@javax.annotation.Generated(value = "org.openapitools.codegen.languages.JavaClientCodegen", date = "2021-09-22T10:30:56.069820Z[Etc/UTC]")
public class ZakelijkRecht {
  public static final String SERIALIZED_NAME_STUK_IDENTIFICATIES = "stukIdentificaties";
  @SerializedName(SERIALIZED_NAME_STUK_IDENTIFICATIES)
  private List<String> stukIdentificaties = null;

  public static final String SERIALIZED_NAME_IS_GEBASEERD_OP_STUKDEEL_IDENTIFICATIES = "isGebaseerdOpStukdeelIdentificaties";
  @SerializedName(SERIALIZED_NAME_IS_GEBASEERD_OP_STUKDEEL_IDENTIFICATIES)
  private List<String> isGebaseerdOpStukdeelIdentificaties = null;

  public static final String SERIALIZED_NAME_IS_VERMELD_IN_STUKDEEL_IDENTIFICATIES = "isVermeldInStukdeelIdentificaties";
  @SerializedName(SERIALIZED_NAME_IS_VERMELD_IN_STUKDEEL_IDENTIFICATIES)
  private List<String> isVermeldInStukdeelIdentificaties = null;


  public ZakelijkRecht stukIdentificaties(List<String> stukIdentificaties) {
    
    this.stukIdentificaties = stukIdentificaties;
    return this;
  }

  public ZakelijkRecht addStukIdentificatiesItem(String stukIdentificatiesItem) {
    if (this.stukIdentificaties == null) {
      this.stukIdentificaties = new ArrayList<>();
    }
    this.stukIdentificaties.add(stukIdentificatiesItem);
    return this;
  }

   /**
   * Identificatie van het stuk. Een stuk is een brondocument dat aanleiding geeft tot een wijziging van de gegevens in een basisregistratie. Dit kan een aangeboden stuk of een kadasterstuk zijn. 
   * @return stukIdentificaties
  **/
  @javax.annotation.Nullable
  @ApiModelProperty(value = "Identificatie van het stuk. Een stuk is een brondocument dat aanleiding geeft tot een wijziging van de gegevens in een basisregistratie. Dit kan een aangeboden stuk of een kadasterstuk zijn. ")

  public List<String> getStukIdentificaties() {
    return stukIdentificaties;
  }


  public void setStukIdentificaties(List<String> stukIdentificaties) {
    this.stukIdentificaties = stukIdentificaties;
  }


  public ZakelijkRecht isGebaseerdOpStukdeelIdentificaties(List<String> isGebaseerdOpStukdeelIdentificaties) {
    
    this.isGebaseerdOpStukdeelIdentificaties = isGebaseerdOpStukdeelIdentificaties;
    return this;
  }

  public ZakelijkRecht addIsGebaseerdOpStukdeelIdentificatiesItem(String isGebaseerdOpStukdeelIdentificatiesItem) {
    if (this.isGebaseerdOpStukdeelIdentificaties == null) {
      this.isGebaseerdOpStukdeelIdentificaties = new ArrayList<>();
    }
    this.isGebaseerdOpStukdeelIdentificaties.add(isGebaseerdOpStukdeelIdentificatiesItem);
    return this;
  }

   /**
   * De identificatie van het stukdeel (paragraaf in een akte met een rechtsfeit) waarop dit zakelijk recht is gebaseerd. 
   * @return isGebaseerdOpStukdeelIdentificaties
  **/
  @javax.annotation.Nullable
  @ApiModelProperty(value = "De identificatie van het stukdeel (paragraaf in een akte met een rechtsfeit) waarop dit zakelijk recht is gebaseerd. ")

  public List<String> getIsGebaseerdOpStukdeelIdentificaties() {
    return isGebaseerdOpStukdeelIdentificaties;
  }


  public void setIsGebaseerdOpStukdeelIdentificaties(List<String> isGebaseerdOpStukdeelIdentificaties) {
    this.isGebaseerdOpStukdeelIdentificaties = isGebaseerdOpStukdeelIdentificaties;
  }


  public ZakelijkRecht isVermeldInStukdeelIdentificaties(List<String> isVermeldInStukdeelIdentificaties) {
    
    this.isVermeldInStukdeelIdentificaties = isVermeldInStukdeelIdentificaties;
    return this;
  }

  public ZakelijkRecht addIsVermeldInStukdeelIdentificatiesItem(String isVermeldInStukdeelIdentificatiesItem) {
    if (this.isVermeldInStukdeelIdentificaties == null) {
      this.isVermeldInStukdeelIdentificaties = new ArrayList<>();
    }
    this.isVermeldInStukdeelIdentificaties.add(isVermeldInStukdeelIdentificatiesItem);
    return this;
  }

   /**
   * De identificaties van de stukdelen (paragrafen in een akte met een rechtsfeit) waarin dit zakelijk recht is vermeld. 
   * @return isVermeldInStukdeelIdentificaties
  **/
  @javax.annotation.Nullable
  @ApiModelProperty(value = "De identificaties van de stukdelen (paragrafen in een akte met een rechtsfeit) waarin dit zakelijk recht is vermeld. ")

  public List<String> getIsVermeldInStukdeelIdentificaties() {
    return isVermeldInStukdeelIdentificaties;
  }


  public void setIsVermeldInStukdeelIdentificaties(List<String> isVermeldInStukdeelIdentificaties) {
    this.isVermeldInStukdeelIdentificaties = isVermeldInStukdeelIdentificaties;
  }


  @Override
  public boolean equals(Object o) {
    if (this == o) {
      return true;
    }
    if (o == null || getClass() != o.getClass()) {
      return false;
    }
    ZakelijkRecht zakelijkRecht = (ZakelijkRecht) o;
    return Objects.equals(this.stukIdentificaties, zakelijkRecht.stukIdentificaties) &&
        Objects.equals(this.isGebaseerdOpStukdeelIdentificaties, zakelijkRecht.isGebaseerdOpStukdeelIdentificaties) &&
        Objects.equals(this.isVermeldInStukdeelIdentificaties, zakelijkRecht.isVermeldInStukdeelIdentificaties);
  }

  @Override
  public int hashCode() {
    return Objects.hash(stukIdentificaties, isGebaseerdOpStukdeelIdentificaties, isVermeldInStukdeelIdentificaties);
  }

  @Override
  public String toString() {
    StringBuilder sb = new StringBuilder();
    sb.append("class ZakelijkRecht {\n");
    sb.append("    stukIdentificaties: ").append(toIndentedString(stukIdentificaties)).append("\n");
    sb.append("    isGebaseerdOpStukdeelIdentificaties: ").append(toIndentedString(isGebaseerdOpStukdeelIdentificaties)).append("\n");
    sb.append("    isVermeldInStukdeelIdentificaties: ").append(toIndentedString(isVermeldInStukdeelIdentificaties)).append("\n");
    sb.append("}");
    return sb.toString();
  }

  /**
   * Convert the given object to string with each line indented by 4 spaces
   * (except the first line).
   */
  private String toIndentedString(Object o) {
    if (o == null) {
      return "null";
    }
    return o.toString().replace("\n", "\n    ");
  }

}
