Profile: ERGRechnungsposition
Title: "ERG Rechnungsposition"
Parent: ChargeItem
Id: erg-rechnungsposition
* insert Meta
* status MS // ToDo: ValueSet einschränken auf? nur billable?
* code MS
  * coding MS
    * ^slicing.discriminator.type = #pattern
    * ^slicing.discriminator.path = "$this"
    * ^slicing.rules = #open
  * coding contains
      GOÄ 0..1 MS and
      GOZ 0..1 MS
  * coding[GOÄ] ^patternCoding.system = "http://fhir.de/CodeSystem/bäk/goä"
  * coding[GOZ] ^patternCoding.system = "http://fhir.de/CodeSystem/bzäk/goz"
  * text 1.. MS
* subject MS
* subject.reference MS
* subject.reference ^comment = "Die referenzierte Instanz sollte valide zum Profil ERGersichertePerson sein"
* occurrencePeriod 1.. MS
* quantity 1.. MS
* factorOverride 1.. MS
* priceOverride 1.. MS
* extension contains https://gematik.de/fhir/erg/StructureDefinition/erg-preisdetails-rechnungsposition named unitPriceComponent 0..1 MS

Extension: ERGPreisDetailsRechnungsposition
Id: erg-preisdetails-rechnungsposition
Title: "ERG Preisdetails Rechnungsposition"
* insert Meta
* extension contains type 1..1 MS and code 0..1 and factor 0..1 and amount 0..1
* extension[type].value[x] only code
* extension[type].valueCode from http://hl7.org/fhir/invoice-priceComponentType (required)
* extension[code].value[x] only CodeableConcept // ToDo: Create VS
* extension[factor].value[x] only decimal
* extension[amount].value[x] only Money