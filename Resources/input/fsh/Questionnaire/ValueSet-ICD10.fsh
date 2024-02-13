Alias: $icd-10-gm = http://fhir.de/CodeSystem/dimdi/icd-10-gm

ValueSet: TESTICD10GM
Id: TESTICD10GM
Title: "Testdatensatz zur Simulation einer ICD-10-Validierung für Beispieldatensätze"
Description: "NUR ZUR VALIDIERUNG VON BEISPIELDATENSÄTZEN!!! NICHT ZUR VALIDIERUNG VON ICD-10-DIAGNOSEN GEEIGENT!!!! Die Validierung von ICD 10 Diagnosen muss durch einen geeigneten Terminologie-Server erfolgen. Eine Expansion von ICD-10(-GM) ist aufgrund der Menge an Codes und der Postkoordination nicht ausreichend, um ICD-10-Codes zu validieren! Enthält sowohl einzelne als auch postkoordinierte Codes, um das Vorhandensein einer Post-Koordinationsgrammatik zu simulieren!"
* ^meta.profile = "http://hl7.org/fhir/StructureDefinition/shareablevalueset"
* ^url = "http://fhir.de/ValueSet/dimdi/icd-10-gm"
* ^status = #draft
* ^experimental = true
* ^expansion.identifier = "440c50b5-7272-4184-9ddd-95a75d8207f8"
* ^expansion.timestamp = "2019-07-06"
* ^expansion.total = 2
* ^expansion.contains[0].system = "http://fhir.de/CodeSystem/dimdi/icd-10-gm"
* ^expansion.contains[=].version = "2019"
* ^expansion.contains[=].code = #F71
* ^expansion.contains[=].display = "Mittalgradige Intelligenzminderung"
* ^expansion.contains[+].system = "http://fhir.de/CodeSystem/dimdi/icd-10-gm"
* ^expansion.contains[=].version = "2019"
* ^expansion.contains[=].code = #F16.1
* ^expansion.contains[=].display = "Psychische Verhaltensstörung durch Halluzinogene (Akute Intoxikation)"
* ^expansion.contains[+].system = "http://fhir.de/CodeSystem/dimdi/icd-10-gm"
* ^expansion.contains[=].version = "2019"
* ^expansion.contains[=].code = #U69.32
* ^expansion.contains[=].display = "Intravenöser Konsum sonstiger psychotroper Substanzen"
* ^expansion.contains[+].system = "http://fhir.de/CodeSystem/dimdi/icd-10-gm"
* ^expansion.contains[=].version = "2019"
* ^expansion.contains[=].code = #"F16.1 U69.32!"
* ^expansion.contains[=].display = "Psychische Verhaltensstörung durch Halluzinogene (Akute Intoxikation) bei intravenösem Konsum"
* ^expansion.contains[+].system = "http://fhir.de/CodeSystem/dimdi/icd-10-gm"
* ^expansion.contains[=].version = "2019"
* ^expansion.contains[=].code = #"E10.30† H36.0*"
* ^expansion.contains[=].display = "Diabetische Retinopathie"
* ^expansion.contains[+].system = "http://fhir.de/CodeSystem/dimdi/icd-10-gm"
* ^expansion.contains[=].version = "2019"
* ^expansion.contains[=].code = #E10.30
* ^expansion.contains[=].display = "Diabetes mellitus, Typ 1 : Mit Augenkomplikationen : Nicht als entgleist bezeichnet"
* ^expansion.contains[+].system = "http://fhir.de/CodeSystem/dimdi/icd-10-gm"
* ^expansion.contains[=].version = "2019"
* ^expansion.contains[=].code = #H36.0
* ^expansion.contains[=].display = "Affektionen der Netzhaut bei anderenorts klassifizierten Krankheiten"
* include codes from system $icd-10-gm