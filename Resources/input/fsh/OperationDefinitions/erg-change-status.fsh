// ------------- OperationDefinition -------------

Instance: ERGOperationChangeStatus
InstanceOf: OperationDefinition
Usage: #example
Title: "ERG Operation ChangeStatus"
Description: "Änderung des Bearbeitungsstatus eines Dokumentes"
* url = "https://gematik.de/fhir/erg/OperationDefinition/ChangeStatus"
* status = #draft
* kind = #operation
* name = "ERGChangeStatus"
* code = #change-status
* resource = #DocumentReference
* system = false
* type = false
* instance = true
* affectsState = true
* parameter[+]
  * name = #tag
  * use = #in
  * min = 1
  * max = "1"
  * documentation = "Valider Code aus CodeSystem ERGARechnungsstatus"
  * type = #code
* parameter[+]
  * name = #meta
  * use = #out
  * min = 1
  * max = "1"
  * documentation = "Geänderte Meta-Element der geänderten DocumentReference"
  * type = #Meta