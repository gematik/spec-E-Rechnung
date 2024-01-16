Instance: BeispielBundleTasks3-FD
InstanceOf: Bundle
* type = #searchset
* total = 1
* entry.resource = BeispielTaskRechnungsworkflow3-FD

Instance: BeispielParametersCreateReimbursmentTask3
InstanceOf: Parameters
* parameter[+]
  * name = "rechnung"
  * valueReference = Reference(BeispielDocumentReferenceRechnung3-LE)
* parameter[+]
  * name = "anhang"
  * valueReference = Reference(BeispielDocumentReferenceSonstigesDokument3-LE)
* parameter[+]
  * name = "kostentraeger"
  * valueReference = Reference(BeispielOrganizationKostentraeger3)

Instance: BeispielOrganizationKostentraeger3
InstanceOf: Organization
* identifier
  * system = $tmid
  * value = "1234567890"
* name = "Kaiser Permanente"

Instance: BeispielTaskReimbursment3
InstanceOf: Task 
* owner = Reference(BeispielOrganizationKostentraeger3)
* status = #ready
* identifier[+]
  * system = $token
  * value = "123-456-789"
* businessStatus = #neu
* intent = http://hl7.org/fhir/request-intent#proposal
* code = https://gematik.de/fhir/ergpkv/CodeSystem/ergpkv-workflow-cs#einreichungsworkflow
* requester = Reference(BeispielPatient3-FD)
* requester.identifier
  * system = $kvid
  * value = "A000000000"
* input
  * type.text = "Rechnung"
  * valueReference = Reference(BeispielDocumentReferenceRechnung3-LE)
* input
  * type.text = "Anhang"
  * valueReference = Reference(BeispielDocumentReferenceSonstigesDokument3-LE)

Instance: BeispielParametersAddNote
InstanceOf: Parameters
* parameter[+]
  * name = "notiz"
  * valueString = "Bitte Arztbrief nachreichen."
