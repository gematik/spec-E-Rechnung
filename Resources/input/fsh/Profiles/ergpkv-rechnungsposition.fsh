Profile: ERGPKVRechnungsposition
Title: "ERGPKV Rechnungsposition"
Parent: ChargeItem
Id: ergpkv-rechnungsposition
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
* extension contains https://gematik.de/fhir/ergpkv/StructureDefinition/ergpkv-preisdetails-rechnungsposition named unitPriceComponent 0..1 MS

Extension: ERGPKVPreisDetailsRechnungsposition
Id: ergpkv-preisdetails-rechnungsposition
Title: "ERGPKV Preisdetails Rechnungsposition"
* extension contains type 1..1 MS and code 0..1 and factor 0..1 and amount 0..1
* extension[type].value[x] only code
* extension[type].valueCode from http://hl7.org/fhir/invoice-priceComponentType (required)
* extension[code].value[x] only CodeableConcept // ToDo: Create VS
* extension[factor].value[x] only decimal
* extension[amount].value[x] only Money

Instance: DummyChargeItem
InstanceOf: ERGPKVRechnungsposition
* status = #billable
//* code = http://fhir.de/CodeSystem/bäk/goä#123 "keine Ahnung"
* code.coding
  * system = "http://fhir.de/CodeSystem/bäk/goä"
  * code = #123
* code.text = "weiß auch nicht"
* subject.display = "irgendwer"
* occurrencePeriod.start = 1970-01-01
* quantity.value = 1
* factorOverride = 0.0
* priceOverride.value = 0
* extension[unitPriceComponent]
  * extension[type].valueCode = #tax
