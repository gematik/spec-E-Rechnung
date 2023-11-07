Profile: ERGPKVRechnung
Title: "ERGPKV Rechnung"
Parent: Invoice
Id: ergpkv-rechnung
* extension contains ERGPKVPDFRepraesentationRechnung named pdf-repraesentation-rechnung 0..1 MS
* identifier 1.. MS
* identifier ^slicing.discriminator.type = #pattern
* identifier ^slicing.discriminator.path = "type"
* identifier ^slicing.rules = #open
* identifier contains rechnungsnummer 1..1
* identifier[rechnungsnummer]
  * ^short = "Vom System des Leistungserbringers vergebene Rechnungsnummer"
  * type 1.. MS
  * type = http://fhir.de/CodeSystem/identifier-type-de-basis#invoice
  * system 1.. MS
    * ^short = "Namensraum der Rechnungsnummern des Leistungeerbringers"
  * value 1.. MS
    * ^short = "Rechnungsnummer"
* type 1.. MS
* type = https://gematik.de/fhir/ergpkv/CodeSystem/ergpkv-rechnung-type-cs#erechnung
* status MS
* status = http://hl7.org/fhir/invoice-status#issued
* recipient 1.. MS
  * ^short = "Rechnungsempfänger"
  * ^comment = "Das System des Leistungserbringers referenziert hier üblicherweise 
  auf die lokale Instanz des Patienten um die Rechnung einer Patientenakte zuzuordnen. 
  Der Fachdienst substitutiert den Link mit der Referenz auf das Postfach des Patienten 
  bei der Extraktion der Invoice aus dem Bundle. Die Angabe der Versichertennummer dient 
  der Plausibilisierung. Die KV-Nummer in der Instanz des Bundles muss daher mit der 
  KV-Nummer übereinstimmen, die im Fachdienst für das Postfach des Rechnungsempfängers hinterlegt ist. "
* recipient only Reference(Patient)
  * identifier 1.. MS
  * identifier only IdentifierKvid10
  * display 1.. MS
* subject 1..1 MS
  * ^short = "Leistungsempfänger"
  * display 1..1 MS
    * ^short = "Name des Leistungsemfängers"
    * ^comment = "Der Name des Leistungeempfängers (behandelter Patient) muss angegeben werden 
    und kann vom Namen des Rechnungsempfängers abweichen, 
    z.B. wenn Eltern Rechnungen für ihre Kinder erhalten."
* date 1.. MS
* issuer 1.. MS
  * ^short = "Leistungserbringer"
  * identifier 1.. MS
    * ^short =  "Telematik-ID des Leistungserbrigners"
  * identifier only IdentifierTelematikId
  * display 1.. MS
    * ^short = "Name des Leistungserbringers"
* lineItem MS
  * ^short = "Rechnungspositionen"
* lineItem.chargeItem[x] only Reference
* lineItem.chargeItemReference MS
* totalPriceComponent MS
* totalPriceComponent ^slicing.discriminator.type = #pattern
* totalPriceComponent ^slicing.discriminator.path = "code"
* totalPriceComponent ^slicing.rules = #open
* totalPriceComponent contains tax 0..1 MS // ToDo: Constraint for totalPriceComponent dependant on .type?
* totalPriceComponent[tax]
  * ^short = "Steuersatz und -Betrag"
  * type = #tax
  * factor 1..1 MS // Constraint 19% or 7%
  * amount 1..1 MS 
* totalNet MS
  * ^short = "Nettobetrag der Rechnungssumme"
* totalGross MS
  * ^short = "Bruttobetrag der Rechnungssumme"


Extension: ERGPKVPDFRepraesentationRechnung
Id: ergpkv-pdf-repraesentation-rechnung
Title: "ERGPKV PDF Repräsentation Rechnung"
* value[x] only Reference(Binary)

