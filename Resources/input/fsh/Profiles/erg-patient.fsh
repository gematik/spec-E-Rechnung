Profile: ERGPerson
Parent: Patient
Id: erg-person
* insert Meta
* identifier MS
  * ^slicing.discriminator.type = #pattern
  * ^slicing.discriminator.path = "$this"
  * ^slicing.rules = #open
* identifier contains
    KVNR ..1 MS
* identifier[KVNR] only $identifier-kvnr
  * ^patternIdentifier.type = $identifier-kvnr-type#KVZ10
  * type 1.. MS
  * system MS
  * value MS
    * ^short = "KVNR (Krankenversichertennummer)"
  * ^short = "KVNR (Krankenversichertennummer)"
  * ^comment = "Die KVNR MUSS vorkommen, wenn eine Institution die Rolle des 'Rechnungsempfänger' inne hat."
  * assigner MS
    * identifier MS
    * identifier only $identifier-iknr
      * type 1.. MS
      * system MS
      * value MS
        * ^short = "IK-Nummer der Krankenkasse"
      * ^short = "IK-Nummer der Krankenkasse"
      * ^comment = "Bei GKV-Versicherten Personen MUSS die IK-Nummer der Krankenkasse angegeben werden."
* birthDate 1.. MS
  * ^short = "Geburtsdatum"
  * ^comment = "Das Geburtsdatum MUSS vorhanden sein."
* name only $humanname-de
* name MS
  * ^short = "Name"
  * ^comment = "Der Name SOLL vorhanden sein."
  * use MS
  * text MS
    * ^short = "Voller Name inkl. Anrede"
    * ^comment = "Die Anrede SOLLEN vorhanden sein."
  * family MS
    * ^short = "Nachname"
    * ^comment = "Der Nachname MUSS in der Rolle einer 'Behandelte Person' vorhanden sein.
    Der Nachname SOLL in der Rolle eines 'Rechnungsempfänger' vorhanden sein.
    Die Extensions zur strukurierten Erfassung KÖNNEN vorhanden sein."
    * extension[namenszusatz] MS
      * ^comment = "Die Extension zur strukurierten Erfassung des Namenszusatz KANN vorhanden sein."
    * extension[nachname] MS
      * ^comment = "Die Extension zur strukurierten Erfassung des Nachnamen KANN vorhanden sein."
    * extension[vorsatzwort] MS
      * ^comment = "Die Extension zur strukurierten Erfassung des Vorsatzwort KANN vorhanden sein."
  * given MS
    * ^short = "Vorname"
    * ^comment = "Der Vorname MUSS in der Rolle einer 'Behandelte Person' vorhanden sein.
    Der Vorname SOLL in der Rolle eines 'Rechnungsempfänger' vorhanden sein."
  * prefix MS
    * ^short = "Titel"
    * ^comment = "Der Titel SOLL vorhanden sein, die Extension zur Qualifizierung KANN vorhanden sein."
  * prefix.extension[prefix-qualifier] MS
    * ^comment = "Die Extension zur Qualifizierung des Titeks KANN vorhanden sein."
* address MS
* address ^slicing.discriminator.type = #pattern
* address ^slicing.discriminator.path = "$this"
* address ^slicing.rules = #open
* address contains
    Strassenanschrift 0..* MS and
    Postfach 0..* MS
* address[Strassenanschrift] only $adresse-de
  * ^short = "Strassenanschrift"
  * ^comment = "Die Strassenanschrift SOLL vorhanden sein."
  * ^patternAddress.type = #both
  * type MS
  * line MS
    * ^short = "Straße und Hausnummer"
    * ^comment = "Straße und Hausnummer SOLLEN angegeben werden, die Extensions zur strukurierten Erfassung KÖNNEN vorhanden sein."
    * extension[Strasse] 0..1 MS
      * ^comment = "Die Extension zur strukurierten Erfassung der Straße KANN vorhanden sein."
    * extension[Hausnummer] 0..1 MS
      * ^comment = "Die Extension zur strukurierten Erfassung der Hausnummer KANN vorhanden sein."
    * extension[Adresszusatz] 0..1 MS
      * ^comment = "Die Extension zur strukurierten Erfassung des Adresszusatz KANN vorhanden sein."
    * extension[Postfach] 0..0
  * city MS
    * ^short = "Ort"
    * ^comment = "Der Ort SOLL vorhanden sein."
  * postalCode MS
    * ^short = "Postleitzahl"
    * ^comment = "Die Postleitzahl SOLL vorhanden sein."
  * country MS
    * ^short = "Länderkennzeichen"
    * ^comment = "Das Länderkennzeichen KANN vorhanden sein."
* address[Postfach] only $adresse-de
  //* obeys address-cnt-2or3-char TODO-102
  * ^short = "Postfach"
  * ^comment = "Das Postfach SOLL vorhanden sein."
  * ^patternAddress.type = #postal
  * type MS
  * line MS
    * ^short = "Postfach-Angabe"
    * ^comment = "Die Postfach-Angabe SOLL angegeben werden, die Extensions zur strukurierten Erfassung KANN vorhanden sein."
    * extension[Strasse] 0..0 
    * extension[Hausnummer] 0..0 
    * extension[Adresszusatz] 0..0 
    * extension[Postfach] 0..1 MS
      * ^comment = "Die Extension zur strukurierten Erfassung des Postfach KANN vorhanden sein."
  * city MS
    * ^short = "Ort"
    * ^comment = "Der Ort SOLL vorhanden sein."
  * postalCode MS
    * ^short = "Postleitzahl"
    * ^comment = "Die Postleitzahl SOLL vorhanden sein."
  * country MS
    * ^short = "Länderkennzeichen"
    * ^comment = "Das Länderkennzeichen KANN vorhanden sein."