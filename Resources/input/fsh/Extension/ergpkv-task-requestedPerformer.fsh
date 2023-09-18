Extension: ERGPKVTaskRequestedPerformer
Id: ergpkv-task-requestedPerformer
Title: "ERGPKV Task RequestedPerformer"
* ^url = "http://hl7.org/fhir/5.0/StructureDefinition/extension-Task.requestedPerformer"
* value[x] only Reference(Patient or Organization)
* valueReference 1.. MS
  * identifier 1.. MS
  * identifier only IdentifierKvid10 or IdentifierPkvVersichertenId10 // Auslagern in ergpkv-rechnungsworkflow