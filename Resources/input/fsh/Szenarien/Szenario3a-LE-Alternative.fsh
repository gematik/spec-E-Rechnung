
Instance: PatientVater
InstanceOf: Patient
Usage: #example
* active = true
* name
  * given = "Manfred"
  * family = "Mustermann"
* identifier
  * type = http://fhir.de/CodeSystem/identifier-type-de-basis#gkv
  * system = "http://fhir.de/sid/gkv/kvid-10"
  * value = "A000000000"

/*
Instance: RPVater
InstanceOf: RelatedPerson
Usage: #example
* name
  * given = "Manfred"
  * family = "Mustermann"
* gender = #male
* identifier
  * type = http://fhir.de/CodeSystem/identifier-type-de-basis#gkv
  * system = "http://fhir.de/sid/gkv/kvid-10"
  * value = "A000000000"
* address
  * text = "Musterweg 2, 3. Etage, 98764 Musterhausen, DE"
* patient = Reference (PatientKind)
*/

Instance: PatientKind
InstanceOf: Patient
Usage: #example
* active = false
* name
  * given = "Moritz"
  * family = "Mustermann"
* gender = #male
* identifier
  * type = http://fhir.de/CodeSystem/identifier-type-de-basis#gkv
  * system = "http://fhir.de/sid/gkv/kvid-10"
  * value = "A111111111"
* address
  * text = "Musterweg 2, 3. Etage, 98764 Musterhausen, DE"
* extension[+]
  * url = "http://foo.bar/Extension/abweichenderRechnungsempfaenger"
  * valueReference = Reference(PatientVater)
    * display = "Manfred Mustermann"

Instance: PatientenBundle
InstanceOf: Bundle
* type = #searchset
* total = 1
* entry[+]
  * resource = PatientVater
  * search.mode = #match

Instance: KindBundle
InstanceOf: Bundle
* type = #searchset
* total = 1
* entry[+]
  * resource = PatientKind
  * search.mode = #match
* entry[+]
  * resource = PatientVater
  * search.mode = #include


Instance: BeispielTaskRechnungsworkflowMitAbwRechnEmpf
InstanceOf: Task
* owner = Reference(PatientVater)
* for = Reference(PatientKind)
* status = #ready
* intent = http://hl7.org/fhir/request-intent#proposal
* businessStatus = https://gematik.de/fhir/ergpkv/CodeSystem/ergpkv-rechnungsworkflow-businessStatus-cs#neu
//TODO: Würde der Fachdienst hier nicht die Telematik-ID substituieren und auf einen Benutzer-Account vom Typ "Practitioner/-Role" verweisen???
* requester.identifier.value = "<telematik id>"
* input[+]
  * type.coding.display = "rechnung"
  * valueReference = Reference(BeispielDocumentReferenceRechnung3-LE)
* input[+]
  * type.coding.display = "anhang"
  * valueReference = Reference(BeispielDocumentReferenceSonstigesDokument3-LE)
* output[+]
  * type.coding.display = "rechnung-meta"
  * valueReference = Reference(BeispielDocumentReferenceRechnung3-FD)
* output[+]
  * type.coding.display = "anhang-meta"
  * valueReference = Reference(BeispielDocumentReferenceSonstigesDokument3-FD)