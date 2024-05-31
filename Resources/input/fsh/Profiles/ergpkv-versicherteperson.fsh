Profile: ERGPKVersichertePerson
Title: "ERGPKVersichertePerson"
Parent: Patient
Id: ergpkv-versicherteperson
* insert Meta
* id 1..1 MS
* extension contains https://gematik.de/fhir/ergpkv/StructureDefinition/ergpkv-abweichender-rechnungsempfaenger named abweichender-rechnungsempfaenger 0..1 MS
* active 1.. MS
  * ^comment = "Indikation für den Client, dass es sich um eine Person handelt die über ein aktives Postfach im Fachdienst verfügt."
* birthDate MS
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
  * text 1.. MS

//TODO alle AbweichenderRechnungsempfaenger entfernen
Extension: ERGPKVAbweichenderRechnungsempfaenger
Id: ergpkv-abweichender-rechnungsempfaenger
Title: "ERGPKV Abweichender Rechnungsempfaenger"
* extension contains abweichenderRechnungsempfaenger 1..1 MS
* extension[abweichenderRechnungsempfaenger].value[x] only Reference(Patient)
* extension[abweichenderRechnungsempfaenger].value[x].reference 1..1 MS
* extension[abweichenderRechnungsempfaenger].value[x].display 1..1 MS
