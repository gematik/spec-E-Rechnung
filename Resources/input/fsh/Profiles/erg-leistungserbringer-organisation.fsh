Profile: ERGLeistungserbringerOrganisation
Parent: Organization
Title: "ERG leistungserbringende Organisation"
Id: erg-leistungserbringer-organisation
* insert Meta
* identifier MS
* identifier ^slicing.discriminator.type = #pattern
* identifier ^slicing.discriminator.path = "$this"
* identifier ^slicing.rules = #open
* identifier contains
    IKNR 0..1 MS
* identifier[IKNR] only $identifier-iknr
* identifier[IKNR] ^patternIdentifier.type = $v2-0203#XX
* identifier[IKNR].type 1..
* type MS
* type ^slicing.discriminator.type = #pattern
* type ^slicing.discriminator.path = "$this"
* type ^slicing.rules = #open
* type contains
    KBV-Schlüsseltabelle ..1 MS
* type[KBV-Schlüsseltabelle] from $kbv-fachrichtung-vs (required)
* address only $adresse-de
* address MS
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
* name MS