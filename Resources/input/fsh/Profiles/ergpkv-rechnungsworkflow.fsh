Profile: ERGPKVRechnungsworkflow
Title: "ERGPKV Rechnungsworkflow"
Parent: Task
Id: ergpkv-rechnungsworkflow
* extension contains http://hl7.org/fhir/5.0/StructureDefinition/extension-Task.requestedPerformer named requestedPerformer 1..1 MS
* status MS 
* status from https://gematik.de/fhir/ergpkv/ValueSet/ergpkv-rechnungsworkflow-status-vs (required)
* identifier 1.. MS
* identifier 
  * ^slicing.discriminator.type = #pattern
  * ^slicing.discriminator.path = "type"
  * ^slicing.rules = #open
* identifier contains token 1..1 MS
* identifier[token] 
  * type 1.. MS
  * type = http://terminology.hl7.org/CodeSystem/v2-0203#RI
  * system 1.. MS
  * system = "https://gematik.de/fhir/sid/ergpkv-token"
  * value 1.. MS
* businessStatus 1.. MS
* businessStatus from https://gematik.de/fhir/ergpkv/ValueSet/ergpkv-rechnungsworkflow-businessStatus-vs (required)
* intent MS
* intent = http://hl7.org/fhir/request-intent#order
* code 1.. MS
* code = https://gematik.de/fhir/ergpkv/CodeSystem/ergpkv-workflow-cs#rechnungsworkflow
* focus 1.. MS
* focus only Reference(Invoice)
* requester only Reference(Organization or Practitioner)
* requester 1.. MS
  * identifier 1.. MS 
  * identifier only IdentifierTelematikId
* input MS
  * ^slicing.discriminator.type = #pattern
  * ^slicing.discriminator.path = "type"
  * ^slicing.rules = #open
* input contains sonstigeDokumente 1..1 MS and originalRechnung 0..1 MS and rechnung 0..1 MS and rechnungsposition 0..* MS and rechnungsdokument 0..1 MS
* input[sonstigeDokumente]
  * type MS
  * type from https://gematik.de/fhir/ergpkv/CodeSystem/ergpkv-rechnungsworkflow-inputtype-cs (required)
  * type = https://gematik.de/fhir/ergpkv/CodeSystem/ergpkv-rechnungsworkflow-inputtype-cs#sonstigeDokumente
  * value[x] only Reference(DocumentReference)
  * valueReference 1..1 MS
    * reference 1..1 MS
* input[originalRechnung]
  * type MS
  * type from https://gematik.de/fhir/ergpkv/CodeSystem/ergpkv-rechnungsworkflow-inputtype-cs (required)
  * type = https://gematik.de/fhir/ergpkv/CodeSystem/ergpkv-rechnungsworkflow-inputtype-cs#originalRechnung
  * value[x] only Reference(Bundle)
  * valueReference 1..1 MS
    * reference 1..1 MS
* input[rechnung]
  * type MS
  * type from https://gematik.de/fhir/ergpkv/CodeSystem/ergpkv-rechnungsworkflow-inputtype-cs (required)
  * type = https://gematik.de/fhir/ergpkv/CodeSystem/ergpkv-rechnungsworkflow-inputtype-cs#rechnung
  * value[x] only Reference(Bundle)
  * valueReference 1..1 MS
    * reference 1..1 MS
* input[rechnungsposition]
  * type MS
  * type from https://gematik.de/fhir/ergpkv/CodeSystem/ergpkv-rechnungsworkflow-inputtype-cs (required)
  * type = https://gematik.de/fhir/ergpkv/CodeSystem/ergpkv-rechnungsworkflow-inputtype-cs#rechnungsposition
  * value[x] only Reference(Bundle)
  * valueReference 1..1 MS
    * reference 1..1 MS
* input[rechnungsdokument]
  * type MS
  * type from https://gematik.de/fhir/ergpkv/CodeSystem/ergpkv-rechnungsworkflow-inputtype-cs (required)
  * type = https://gematik.de/fhir/ergpkv/CodeSystem/ergpkv-rechnungsworkflow-inputtype-cs#rechnungsposition
  * value[x] only Reference(Bundle)
  * valueReference 1..1 MS
    * reference 1..1 MS