Profile: DiPagRechnungsdiagnose
Parent: Condition
Title: "Digitale Patientenrechnung Rechnungsdiagnose"
Id: dipag-rechnungsdiagnose
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
    * ^short = "System des ICD-10 Code"
    * ^comment = "Das System des ICD-10 Code MUSS vorhanden sein."
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
    * system 1.. MS
    * code 1.. MS
* onset[x] MS
* onset[x] only dateTime
* onsetDateTime MS
  * ^short = "Behandlungsdatum (Erstdiagnose)"
  * ^comment = "Das Behandlungsdatum (Erstdiagnose) SOLL vorhanden sein."
* subject MS
  * ^short = "Referenz auf die behandelte Person"
  * ^comment = "Die Diagnose SOLL auf eine zugehörige behandelte Person referenzieren."
* subject only Reference(DiPagPatient or Patient)
* subject.reference 1.. MS
