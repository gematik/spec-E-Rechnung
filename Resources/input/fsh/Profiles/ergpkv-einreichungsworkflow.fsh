Profile: ERGPKVEinreichnungsworkflow
Title: "ERGPKV Einreichungsworkflow"
Parent: Task
Id: ergpkv-einreichungsworkflow
* extension contains http://hl7.org/fhir/5.0/StructureDefinition/extension-Task.requestedPerformer named kostentraeger 1..1 MS
* status MS 
* status from https://gematik.de/fhir/ergpkv/ValueSet/ergpkv-rechnungsworkflow-status-vs (required)
  * ^short = "Taskstatus ( ready | completed )"
  //* ^comment = "ready | completed"
* identifier 1.. MS
* identifier ^slicing.discriminator.type = #pattern
* identifier ^slicing.discriminator.path = "type"
* identifier ^slicing.rules = #open
* identifier contains token 1..1 MS
* identifier[token]
  * ^short = "Zugriffstoken"
  * type 1.. MS
  * type = http://terminology.hl7.org/CodeSystem/v2-0203#RI
  * system 1.. MS
  * system = "https://gematik.de/fhir/sid/ergpkv-token"
  * value 1.. MS
* businessStatus 1.. MS
  * ^short = "Workflowstatus"
  * ^comment = "neu | offen | eingereicht | erledigt"
* businessStatus from https://gematik.de/fhir/ergpkv/ValueSet/ergpkv-einreichungsworkflow-businessStatus-vs (required)
* intent MS
  * ^short = "fix: proposal"
* intent = http://hl7.org/fhir/request-intent#proposal
* code 1.. MS
  * ^short = "fix: einreichungsworkflow"
* code = https://gematik.de/fhir/ergpkv/CodeSystem/ergpkv-workflow-cs#einreichungsworkflow
* focus 1.. MS
* focus only Reference(Invoice)
  * ^short = "Rechnungsbezug"
* requester only Reference(Patient)
  * ^short = "Rechnungsempfänger"
* requester 1.. MS
  * identifier 1.. MS
  * identifier only IdentifierKvid10 
    * ^short = "Krankenversichertennummer (KVID)"
