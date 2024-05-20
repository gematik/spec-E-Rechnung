Profile: RGPKVLeistungserbringer
Parent: Practitioner
Id: RGPKVLeistungserbringer
* identifier ^slicing.discriminator.type = #pattern
* identifier ^slicing.discriminator.path = "$this"
* identifier ^slicing.rules = #open
* identifier contains
    TelematikId 0..1 MS
* identifier[TelematikId] only $identifier-tmid
* identifier[TelematikId] ^patternIdentifier.type = $v2-0203#PRN
* identifier[TelematikId].type 1..
* address only $adresse-de
* address
  * extension[Stadtteil] MS
  * type MS
  * line MS
  * line.extension[Strasse] MS
  * line.extension[Hausnummer] MS
  * line.extension[Adresszusatz] MS
  * city MS
  * postalCode MS
  * country MS
* name only $name-de
* name
  * use MS
  * family MS
  * family.extension[namenszusatz] MS
  * family.extension[nachname] MS
  * family.extension[vorsatzwort] MS
  * given MS
  * prefix MS
  * prefix.extension[prefix-qualifier] MS
* gender MS
* gender.extension contains $gender-de named Geschlecht-Administrativ 0..1 MS
* gender.extension[Geschlecht-Administrativ].value[x] MS
* qualification.code MS //TODO VS Binding