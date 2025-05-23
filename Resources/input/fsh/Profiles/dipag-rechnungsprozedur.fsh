Profile: DiPagRechnungsprozedur
Parent: Procedure
Title: "Digitale Patientenrechnung Rechnungsprozedur"
Id: dipag-rechnungsprozedur
* insert Meta
* status MS
  * ^short = "Status der Prozedur"
  * ^comment = "Der Status der Prozedur MUSS vorhanden sein."
* status = #completed
* code MS
* code.coding MS
* code.coding ^slicing.discriminator.type = #pattern
* code.coding ^slicing.discriminator.path = "$this"
* code.coding ^slicing.rules = #open
* code.coding contains
    OPS ..1 MS
* code.coding[OPS] only $coding-ops
  * ^short = "Code und Text nach OPS"
  * ^comment = "Die Codierung nach OPS SOLL vorhanden sein."
  * ^patternCoding.system = $ops-cs
  * system MS
    * ^short = "System des OPS Code"
    * ^comment = "Das System des OPS Code MUSS vorhanden sein."
  * code MS
    * ^short = "Code nach OPS"
    * ^comment = "Der Code nach OPS SOLL vorhanden sein."
  * display MS
    * ^short = "Text zum OPS Code"
    * ^comment = "Der Text zum OPS Code SOLL vorhanden sein."
* performed[x] MS
  * ^short = "OPS Behandlungsdatum oder -zeitraum"
  * ^comment = "Entweder das OPS Behandlungsdatum, oder der -zeitraum SOLL vorhanden sein."
* performed[x] only dateTime or Period
* performedDateTime MS
  * ^short = "OPS Behandlungsdatum"
* performedPeriod MS
  * ^short = "OPS Behandlungszeitraum"
* subject MS
  * ^short = "Referenz auf die behandelte Person"
  * ^comment = "Die Procedure SOLL auf eine zugehörige behandelte Person referenzieren."
* subject only Reference(DiPagPatient or Patient)
* subject.reference 1.. MS