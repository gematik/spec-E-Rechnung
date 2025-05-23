Instance: PatientenBundle
InstanceOf: Bundle
* type = #searchset
* total = 1
* entry[+]
  * resource = PatientVater
  * search.mode = #match

Instance: PatientVater
InstanceOf: Patient
Usage: #example
* active = true
* name
  * given = "Manfred"
  * family = "Mustermann"
* identifier
  * type = http://fhir.de/CodeSystem/identifier-type-de-basis#KVZ10
  * system = "http://fhir.de/sid/gkv/kvid-10"
  * value = "A000000000"
* gender = #male
* birthDate = "1970-01-01"