Profile: ERGPKVEinreichnungsworkflow
Title: "ERGPKV Einreichungsworkflow"
Parent: Task
Id: ergpkv-einreichungsworkflow
* extension contains http://hl7.org/fhir/5.0/StructureDefinition/extension-Task.requestedPerformer named requestedPerformer 1..1 MS
* extension contains https://gematik.de/fhir/ergpkv/StructureDefinition/ergpkv-rechnungsworkflow-sonstigesDokument named sonstigesDokument 0..* MS
* status MS 
* status from https://gematik.de/fhir/ergpkv/ValueSet/ergpkv-rechnungsworkflow-status-vs (required) // ToDo: Umbenennung rechnungsworkflow -> workflow
* identifier 1.. MS
* identifier ^slicing.discriminator.type = #pattern
* identifier ^slicing.discriminator.path = "type"
* identifier ^slicing.rules = #open
* identifier contains token 1..1 MS
* identifier[token].type 1.. MS
* identifier[token].type = http://terminology.hl7.org/CodeSystem/v2-0203#RI
* identifier[token].system 1.. MS
* identifier[token].system = "https://gematik.de/fhir/sid/ergpkv-token"
* identifier[token].value 1.. MS
* businessStatus 1.. MS
* businessStatus from https://gematik.de/fhir/ergpkv/ValueSet/ergpkv-einreichungsworkflow-businessStatus-vs (required)
* intent MS
* intent = http://hl7.org/fhir/request-intent#proposal
* code 1.. MS
* code = https://gematik.de/fhir/ergpkv/CodeSystem/ergpkv-workflow-cs#einreichungsworkflow
* focus 1.. MS
* focus only Reference(Invoice)
* requester only Reference(Patient)
* requester 1.. MS
  * identifier 1.. MS
  * identifier only IdentifierKvid10 or IdentifierPkvVersichertenId10