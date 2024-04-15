Profile: ERGPKVersichertePerson
Title: "ERGPKVersichertePerson"
Parent: Patient
Id: ergpkv-versicherteperson
* id 1..1 MS
* active 1.. MS
* birthDate MS
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
* name 1.. MS
  * text 1.. MS
