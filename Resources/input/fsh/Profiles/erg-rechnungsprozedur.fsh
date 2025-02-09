Profile: ERGRechnungsprozedur
Parent: Procedure
Title: "ERG Rechnungsprozedur"
Id: erg-rechnungsprozedur
* insert Meta
* status MS //TODO-102 Wie gehen wir generell mit dem Status um? Fix Wert?
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
  * code MS
    * ^short = "Code nach OPS"
    * ^comment = "Der Code nach OPS SOLL vorhanden sein."
  * display MS
    * ^short = "Text zum OPS Code"
    * ^comment = "Der Text zum OPS Code SOLL vorhanden sein."
* performed[x] MS
  * ^comment = "Entweder das OPS Behandlungsdatum, oder der -zeitraum SOLL vorhanden sein."
* performed[x] only dateTime or Period
* performedDateTime MS
  * ^short = "OPS Behandlungsdatum"
* performedPeriod MS
  * ^short = "OPS Behandlungszeitraum"
* subject MS
* subject only Reference(ERGPerson or Patient)
* subject.reference 1.. MS
* subject.reference ^comment = "Die Procedure SOLL auf eine zugehörige Behandelte Person referenzieren." //TODO wirklich SOLL?
