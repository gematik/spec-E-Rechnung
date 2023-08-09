Profile: ERGPKVSonstigesDokument
Title: "ERGPKV Sonstiges Dokument"
Parent: DocumentReference
Id: ergpkv-sonstiges-dokument
* status MS
* type 1.. MS
* type.coding 1.. 
  * ^slicing.discriminator.type = #pattern
  * ^slicing.discriminator.path = "$this"
  * ^slicing.rules = #open
* type.coding contains KDL 1..1 MS
* type.coding[KDL] from http://dvmd.de/fhir/ValueSet/kdl (required)
* content MS
  * attachment MS
    * contentType 1.. MS
    * url 1.. MS
