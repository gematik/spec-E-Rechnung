Profile: ERGersichertePerson
Title: "ERG Versicherte Person"
Parent: Patient
Id: erg-versicherteperson
* insert Meta
* id 1..1 MS
* active 1.. MS
  * ^comment = "Indikation für den Client, dass es sich um eine Person handelt die über ein aktives Postfach im Fachdienst verfügt."
* birthDate 1.. MS
  * ^comment = "vgl. Abschnitt 5.4.2.3 Bereitgestellte Claims und Scopes, Feature-Dokument E-Rechnung"
* identifier MS
  * ^slicing.discriminator.type = #pattern
  * ^slicing.discriminator.path = "$this"
  * ^slicing.rules = #open
* identifier contains
    Krankenversicherten-ID 0..1 MS
* identifier[Krankenversicherten-ID] only IdentifierKvid10
  * ^patternIdentifier.type = http://fhir.de/CodeSystem/identifier-type-de-basis#KVZ10
  * ^comment = "vgl. Abschnitt 5.4.2.3 Bereitgestellte Claims und Scopes, Feature-Dokument E-Rechnung"
  * type 1.. MS
  * system MS
  * value MS
* name 1.. MS
  * ^comment = "vgl. Abschnitt 5.4.2.3 Bereitgestellte Claims und Scopes, Feature-Dokument E-Rechnung"
  * given 1.. MS
  * family 1.. MS
  * text 1.. MS