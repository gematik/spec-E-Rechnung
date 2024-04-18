// ------------- OperationDefinition -------------

Instance: ERGPKVOperationChangeStatus
InstanceOf: OperationDefinition
Usage: #example
Title: "ERGPKV Operation ChangeStatus"
Description: "Änderung des Bearbeitungsstatus eines Dokumentes"
* url = "https://gematik.de/fhir/ergpkv/OperationDefinition/ChangeStatus"
* status = #draft
* kind = #operation
* name = "ERechnung_ChangeStatus"
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
  * documentation = "Valider Code aus CodeSystem ERGPKVARechnungsstatus"
  * type = #code
* parameter[+]
  * name = #meta
  * use = #out
  * min = 1
  * max = "1"
  * documentation = "Geänderte Meta-Element der geänderten DocumentReference"
  * type = #Meta