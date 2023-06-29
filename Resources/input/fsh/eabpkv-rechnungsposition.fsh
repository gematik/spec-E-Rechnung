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
//* extension contains http://hl7.org/fhir/5.0/StructureDefinition/extension-ChargeItem.unitPriceComponent named unitPriceComponent 0..1 MS
