Extension: DiPagTaskRequestedPerformer
Id: dipag-task-requestedPerformer
Title: "Digitale Patientenrechnung Task RequestedPerformer"
* insert Meta
* ^url = "http://hl7.org/fhir/5.0/StructureDefinition/extension-Task.requestedPerformer"
* value[x] only Reference(Patient)
* valueReference 1.. MS
  * reference 1..1 MS
  * identifier 1.. MS
  * identifier only IdentifierKvid10