// ------------- OperationDefinition -------------

Instance: ERGOperationProcessFlag
InstanceOf: OperationDefinition
Usage: #example
Title: "ERG Operation ProcessFlag"
Description: "Änderung des Bearbeitungsstatus eines Dokumentes"
* url = "https://gematik.de/fhir/erg/OperationDefinition/ProcessFlag"
* status = #active
* version = "1.0.0-CC"
* experimental = false
* date = "2024-06-20"
* kind = #operation
* name = "ERGProcessFlag"
* code = #process-flag
* resource = #DocumentReference
* system = false
* type = false
* instance = true
* affectsState = true
* parameter[+]
  * name = #markierung
  * use = #in
  * min = 1
  * max = "1"
  * documentation = "Name der Markierung"
  * type = #Coding
* parameter[+]
  * name = #zeitpunkt
  * use = #in
  * min = 1
  * max = "1"
  * documentation = "Optionaler Zeitpunkt der Markierung"
  * type = #dateTime
* parameter[+]
  * name = #details
  * use = #in
  * min = 1
  * max = "1"
  * documentation = "Optionale Details als Freitext zur Markierung"
  * type = #string
* parameter[+]
  * name = #gelesen
  * use = #in
  * min = 1
  * max = "1"
  * documentation = "Gelesen-Status falls Markierung vom Typ 'gelesen' ist"
  * type = #boolean
* parameter[+]
  * name = #artDerArchivierung
  * use = #in
  * min = 1
  * max = "1"
  * documentation = "Details zur Art der Archivierung falls Markierung vom Typ 'archiviert' ist"
  * type = #Coding
* parameter[+]
  * name = #meta
  * use = #out
  * min = 1
  * max = "1"
  * documentation = "Vollständiges Meta-Element des Rechnungsdokuments / des Anhangs inkl. Extension (siehe ERGDocumentReferenceMarkierung) zur Erfassung der Zusatzinformationen der Markierung"
  * type = #Meta