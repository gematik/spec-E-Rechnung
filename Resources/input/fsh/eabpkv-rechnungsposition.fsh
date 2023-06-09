Profile: EABPKVRechnungsposition
Title: "EABPKV Rechnungsposition"
Parent: ChargeItem
Id: eabpkv-rechnungsposition
* status MS // ToDo: ValueSet einschränken
* code MS
  * coding MS
    * ^slicing.discriminator.type = #pattern
    * ^slicing.discriminator.path = "$this"
    * ^slicing.rules = #open
  * coding contains
      GOÄ 0..1 MS and
      GOZ 0..1 MS
  * coding[GOÄ]
    * ^patternCoding.system = "http://fhir.de/CodeSystem/bäk/goä"
  * coding[GOZ]
    * ^patternCoding.system = "http://fhir.de/CodeSystem/bzäk/goz"
  * text 1.. MS
* subject MS
* occurrencePeriod 1.. MS
* quantity 1.. MS
* factorOverride 1.. MS
* priceOverride 1.. MS
* extension contains https://gematik.de/fhir/eabpkv/StructureDefinition/eabpkv-preisdetails-rechnungsposition named unitPriceComponent 0..1 MS

Extension: EABPKVPreisDetailsRechnungsposition
Id: eabpkv-preisdetails-rechnungsposition
Title: "EABPKV Preisdetails Rechnungsposition"
* extension contains type 1..1 MS and code 0..1 and factor 0..1 and amount 0..1
* extension[type].value[x] only code
* extension[type].valueCode from http://hl7.org/fhir/invoice-priceComponentType (required)
* extension[code].value[x] only CodeableConcept // ToDo: Create VS
* extension[factor].value[x] only decimal
* extension[amount].value[x] only Money
