Profile: ERGRechnungsdiagnose
Parent: Condition
Title: "ERG Rechnungsdiagnose"
Id: erg-rechnungsdiagnose
* insert Meta
* code MS
* code.coding MS
* code.coding ^slicing.discriminator.type = #pattern
* code.coding ^slicing.discriminator.path = "$this"
* code.coding ^slicing.rules = #open
* code.coding contains
    ICD-10-GM ..1 MS
* code.coding[ICD-10-GM] only $coding-icd-10
  * ^short = "Code und Text nach ICD-10"
  * ^comment = "Die Codierung nach ICD-10 SOLL vorhanden sein."
  * ^patternCoding.system = $icd10-cs
  * system MS
  * code MS
    * ^short = "Code nach ICD-10"
    * ^comment = "Der Code nach ICD-10 SOLL vorhanden sein."
  * display MS
    * ^short = "Text zum ICD-10 Code"
    * ^comment = "Der Text zum ICD-10 Code SOLL vorhanden sein."
  * extension[Seitenlokalisation] MS
    * ^short = "Lokalisierung"
    * ^comment = "Die Lokalisierung SOLL vorhanden sein."
  * extension[Seitenlokalisation].valueCoding MS
    * system MS
    * code MS
* onset[x] MS
* onset[x] only dateTime
* onsetDateTime MS
  * ^short = "Behandlungsdatum (Erstdiagnose)"
  * ^comment = "Das Behandlungsdatum (Erstdiagnose) SOLL vorhanden sein."
* subject MS
* subject only Reference(ERGPerson or Patient)
* subject.reference 1.. MS
* subject.reference ^comment = "Die Diagnose SOLL auf eine zugehörige Behandelte Person referenzieren." //TODO wirklich SOLL?
