Profile: EABPKVRechnung
Title: "EABPKV Rechnung"
Parent: Invoice
Id: eabpkv-rechnung
* extension contains https://gematik.de/fhir/eabpkv/StructureDefinition/eabpkv-pdf-repraesentation-rechnung named pdf-repraesentation-rechnung 0..1 MS
* identifier 1.. MS
* identifier ^slicing.discriminator.type = #pattern
* identifier ^slicing.discriminator.path = "type"
* identifier ^slicing.rules = #open
* identifier contains rechnungsnummer 1..1
* identifier[rechnungsnummer].type 1.. MS
* identifier[rechnungsnummer].type = http://fhir.de/CodeSystem/identifier-type-de-basis#invoice
* identifier[rechnungsnummer].system 1.. MS
* identifier[rechnungsnummer].value 1.. MS
* type 1.. MS
* type = https://gematik.de/fhir/eabpkv/CodeSystem/eabpkv-rechnung-type-cs#erechnung
* status MS
* status = http://hl7.org/fhir/invoice-status#issued
* recipient 1.. MS
* recipient only Reference(Patient or RelatedPerson)
  * identifier 1.. MS
  * identifier only IdentifierKvid10 or IdentifierPkvVersichertenId10
  * display 1.. MS
* date 1.. MS
* issuer 1.. MS
  * identifier 1.. MS 
  * identifier only IdentifierTelematikId
  * display 1.. MS
* lineItem MS
* lineItem.chargeItem[x] only Reference
* lineItem.chargeItemReference MS
* totalPriceComponent MS
* totalPriceComponent ^slicing.discriminator.type = #pattern
* totalPriceComponent ^slicing.discriminator.path = "code"
* totalPriceComponent ^slicing.rules = #open
* totalPriceComponent contains tax 0..1 MS // ToDo: Constraint for totalPriceComponent dependant on .type?
* totalPriceComponent[tax].code = #tax
* totalPriceComponent[tax].factor 1..1 MS // Constraint 19% or 7%
* totalPriceComponent[tax].amount 0..1 MS // ToDo: 1..1 or 0..1?
* totalNet MS
* totalGross MS

Extension: EABPKVPDFRepraesentationRechnung
Id: eabpkv-pdf-repraesentation-rechnung
Title: "EABPKV PDF Repräsentation Rechnung"
* value[x] only Reference(Binary)
