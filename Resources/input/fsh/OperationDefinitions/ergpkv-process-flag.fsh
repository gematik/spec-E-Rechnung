// ------------- OperationDefinition -------------

Instance: ERGOperationProcessFlag
InstanceOf: OperationDefinition
Usage: #example
Title: "ERG Operation ProcessFlag"
Description: "Änderung des Bearbeitungsstatus eines Dokumentes"
* url = "https://gematik.de/fhir/erg/OperationDefinition/ProcessFlag"
* status = #draft
* kind = #operation
* name = "ERechnung_ProcessFlag"
* code = #process-flag
* resource = #DocumentReference
* system = false
* type = false
* instance = true
* affectsState = true
* parameter[+]
  * name = #flag
  * use = #in
  * min = 1
  * max = "1"
  * documentation = "Coding-Element welches die Markierung repräsentiert inkl. Extensions zur Erfassung der Zusatzinformationen der Markierung"
  * type = #Coding
* parameter[+]
  * name = #flag
  * use = #out
  * min = 1
  * max = "1"
  * documentation = "Coding-Element welches die Markierung repräsentiert inkl. Extensions zur Erfassung der Zusatzinformationen der Markierung"
  * type = #Coding