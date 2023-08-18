Instance: ERGPKVOperationGenerateDraft
InstanceOf: OperationDefinition
Usage: #example
Title: "erechnung-generateDraft"
Description: "Rechnungstoken anfordern"
* url = "https://gematik.de/fhir/ergpkv/OperationDefinition/GenerateDraft"
* status = #draft
* kind = #operation
* name = "ERechnung_GenerateDraft"
* code = #erechnung-generateDraft
* resource = #Invoice
* system = false
* type = true
* instance = false
* affectsState = true
* comment = "Test Comment"

Instance: ERGPKVRechnungsworkflowGenerateDraft
InstanceOf: ERGPKVRechnungsworkflow
Usage: #example
* extension.url = "http://hl7.org/fhir/5.0/StructureDefinition/extension-Task.requestedPerformer"
* extension[0].valueIdentifier.type = http://fhir.de/CodeSystem/identifier-type-de-basis#gkv
* extension[0].valueIdentifier.system = "http://fhir.de/sid/gkv/kvid-10"
* extension[0].valueIdentifier.value = "<KVNR>"
* identifier[token].value = "<token>"
* status = http://hl7.org/fhir/task-status#draft
* businessStatus = https://gematik.de/fhir/ergpkv/CodeSystem/ergpkv-rechnungsworkflow-businessStatus-cs#neu
* focus
  * extension.url = "http://hl7.org/fhir/StructureDefinition/data-absent-reason"
  * extension.valueCode = http://terminology.hl7.org/CodeSystem/data-absent-reason#unknown
* requester.identifier.value = "<Telematik-ID>"
