Profile: ERGRechnungsdiagnose
Parent: Condition
Title: "ERG Rechnungsdiagnose"
Id: erg-rechnungsdiagnose
* insert Meta
* code 1.. MS
* code.coding MS
* code.coding ^slicing.discriminator.type = #pattern
* code.coding ^slicing.discriminator.path = "$this"
* code.coding ^slicing.rules = #open
* code.coding contains
    ICD-10-GM 1..1 MS
* code.coding[ICD-10-GM] //Version ist nicht in der Beispielrechnung dabei, ist das richtig? Was ist mit Diagnosesicherheit, Mehrfachkodierung etc? In der PDF finde ich nichts.
  * system MS
  * system = "http://fhir.de/CodeSystem/bfarm/icd-10-gm"
  * code MS
  * display MS
* subject MS
* subject.reference 1.. MS
* subject.reference ^comment = "Die referenzierte Instanz sollte valide zum Profil ERVersichertePerson sein"
