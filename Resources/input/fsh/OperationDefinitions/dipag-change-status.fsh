// ------------- OperationDefinition -------------

Instance: DiPagOperationChangeStatus
InstanceOf: OperationDefinition
Usage: #example
Title: "Digitale Patientenrechnung Operation ChangeStatus"
Description: "Änderung des Bearbeitungsstatus eines Dokumentes"
* url = "https://gematik.de/fhir/dipag/OperationDefinition/ChangeStatus"
* status = #active
* version = "1.0.0-CC"
* experimental = false
* date = "2024-06-20"
* kind = #operation
* name = "Digitale Patientenrechnung ChangeStatus"
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
  * documentation = "Valider Code aus CodeSystem DiPagARechnungsstatus"
  * type = #code
* parameter[+]
  * name = #meta
  * use = #out
  * min = 1
  * max = "1"
  * documentation = "Geänderte Meta-Element der geänderten DocumentReference"
  * type = #Meta