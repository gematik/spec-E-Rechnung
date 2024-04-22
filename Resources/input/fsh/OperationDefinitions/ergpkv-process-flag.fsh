// ------------- OperationDefinition -------------

Instance: ERGPKVOperationProcessFlag
InstanceOf: OperationDefinition
Usage: #example
Title: "ERGPKV Operation ProcessFlag"
Description: "Änderung des Bearbeitungsstatus eines Dokumentes"
* url = "https://gematik.de/fhir/ergpkv/OperationDefinition/ProcessFlag"
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
  * name = #meta
  * use = #out
  * min = 1
  * max = "1"
  * documentation = "Coding-Element welches die Markierung repräsentiert inkl. Extensions zur Erfassung der Zusatzinformationen der Markierung"
  * type = #Coding