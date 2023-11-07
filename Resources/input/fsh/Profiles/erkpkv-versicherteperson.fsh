// ToDo: .text für .name und. .address ausreichend?
Profile: ERGPKVersichertePerson
Title: "ERGPKV CanReceiveInvoice Response Patient"
Parent: Patient
Id: ergpkv-canreceiveinvoiceresponsepatient
* id 1..1 MS
* gender 1.. MS
* identifier MS
  * ^slicing.discriminator.type = #pattern
  * ^slicing.discriminator.path = "$this"
  * ^slicing.rules = #open
* identifier contains
    VersichertenId-GKV 0..1 MS
* identifier[VersichertenId-GKV] only IdentifierKvid10
  * ^patternIdentifier.type = http://fhir.de/CodeSystem/identifier-type-de-basis#GKV
  * type 1.. MS
  * system MS
  * value MS
* name.text 1.. MS
* address.text 1.. MS

Instance: ERGPKVRechnungsworkflowCanReceiveInvoiceResponsePatient
InstanceOf: ERGPKVersichertePerson
Usage: #example
* name
  * text = "Leon Musterfrau"
* gender = #male
* identifier
  * type = http://fhir.de/CodeSystem/identifier-type-de-basis#gkv
  * system = "http://fhir.de/sid/gkv/kvid-10"
  * value = "<KVNR>"
* address
  * text = "Musterweg 2, 3. Etage, 98764 Musterhausen, DE"

Instance: ERGPKVRechnungsworkflowCanReceiveInvoiceResponseRgEmpfaenger
InstanceOf: ERGPKVersichertePerson
Usage: #example
* name
  * text = "Erika Musterfrau"
* gender = #female
* identifier
  * type = http://fhir.de/CodeSystem/identifier-type-de-basis#gkv
  * system = "http://fhir.de/sid/gkv/kvid-10"
  * value = "<KVNR>"
* address
  * text = "Musterweg 2, 3. Etage, 98764 Musterhausen, DE"

