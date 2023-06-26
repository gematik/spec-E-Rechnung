Profile: EABPKVRechnungsworkflow
Title: "EABPKV Rechnungsworkflow"
Parent: Task
Id: eabpkv-rechnungsworkflow
* extension contains http://hl7.org/fhir/5.0/StructureDefinition/extension-Task.requestedPerformer named requestedPerformer 1..1 MS
* status MS 
* status from https://gematik.de/fhir/ValueSet/eabpkv-rechnungsworkflow-status-vs (required)
* identifier 1.. MS // token
* identifier ^slicing.discriminator.type = #pattern
* identifier ^slicing.discriminator.path = "type"
* identifier ^slicing.rules = #open
* identifier contains token 1..1
* identifier[token].type 1.. MS
* identifier[token].type = http://terminology.hl7.org/CodeSystem/v2-0203#RI
* identifier[token].system 1.. MS
* identifier[token].system = "https://gematik.de/fhir/sid/eabpkv-token"
* identifier[token].value 1.. MS
* businessStatus 1.. MS
* businessStatus from https://gematik.de/fhir/ValueSet/eabpkv-rechnungsworkflow-businessStatus-vs (required)
* intent MS
* intent = http://hl7.org/fhir/request-intent#order
* code 1.. MS
* code = https://gematik.de/fhir/CodeSystem/eabpkv-workflow-cs#rechnungsworkflow
* focus 1.. MS
* focus only Reference(Invoice)
* requester only Reference(Organization or Practitioner)
* requester 1.. MS
  * identifier 1.. MS 
  * identifier only IdentifierTelematikId

Extension: EABPKVRechnungsworkflowRequestedPerformer
Id: eabpkv-rechnungsworkflow-requestedPerformer
Title: "EABPKV Rechnungsworkflow RequestedPerformer"
* ^url = "http://hl7.org/fhir/5.0/StructureDefinition/extension-Task.requestedPerformer"
* value[x] only Reference(Patient or RelatedPerson)
* valueReference 1.. MS
  * identifier 1.. MS
  * identifier only IdentifierKvid10 or IdentifierPkvVersichertenId10
