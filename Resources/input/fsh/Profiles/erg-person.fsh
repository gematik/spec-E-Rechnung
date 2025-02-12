Profile: ERGPerson
Id: erg-person
Parent: Practitioner
Title: "ERG Person"
Description: "Das Profil ERGPerson wird in für die Rolle 'Behandelnder Leistungserbringer' oder 'Abweichender Forderungsinhaber' verwendet."
* insert Meta
* identifier MS
* identifier ^slicing.discriminator.type = #pattern
* identifier ^slicing.discriminator.path = "$this"
* identifier ^slicing.rules = #open
* identifier contains
    Telematik-ID ..1 MS and
    USt-ID-Nr ..1 MS
* identifier[Telematik-ID] only $identifier-telematikId
  * ^patternIdentifier.type = $v2-0203#PRN
  * type 1.. MS
  * system MS
  * value MS
    * ^short = "Telematik-ID (VZD-Eintrag)"
  * ^short = "Telematik-ID (VZD-Eintrag)"
  * ^comment = "Die Telematik-ID (VZD-Eintrag) SOLL vorhanden sein."
* identifier[USt-ID-Nr]
  * ^patternIdentifier.type.text = "UmsatzsteuerId"
  * type 1.. MS
  * system ^comment = "Es gibt kein FHIR-NamingSystem für die USt.-ID von offizieller Seite. Aus dem Grund ist System nicht mit MS gekennzeichnet und SOLL nicht befüllt sein."
  * value 1.. MS
  * ^short = "Umsatzsteuer-Identifikationsnummer"
  * ^comment = "Die Umsatzsteuer-Identifikationsnummer KANN vorhanden sein.
  Sie KANN vorkommen, wenn eine Institution die Rolle eines 'Abweichender Forderungsinhaber', sowie des 'Rechnungsersteller' inne hat."
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
    * ^comment = "Der Nachname SOLL vorhanden sein, die Extensions zur strukurierten Erfassung KÖNNEN vorhanden sein."
    * extension[namenszusatz] MS
      * ^comment = "Die Extension zur strukurierten Erfassung des Namenszusatz KANN vorhanden sein."
    * extension[nachname] MS
      * ^comment = "Die Extension zur strukurierten Erfassung des Nachnamen KANN vorhanden sein."
    * extension[vorsatzwort] MS
      * ^comment = "Die Extension zur strukurierten Erfassung des Vorsatzwort KANN vorhanden sein."
  * given MS
    * ^short = "Vorname"
    * ^comment = "Der Vorname SOLL vorhanden sein."
  * prefix MS
    * ^short = "Titel"
    * ^comment = "Der Titel SOLL vorhanden sein, die Extension zur Qualifizierung KANN vorhanden sein."
  * prefix.extension[prefix-qualifier] MS
    * ^comment = "Die Extension zur Qualifizierung des Titeks KANN vorhanden sein."
* telecom MS
* telecom ^slicing.discriminator.type = #pattern
* telecom ^slicing.discriminator.path = "$this"
* telecom ^slicing.rules = #open
* telecom contains Telefon ..* MS
* telecom[Telefon]
  * ^short = "Telefon"
  * ^comment = "Die Angabe einer Telefonnummer KANN vorhanden sein.
  Sie KANN vorkommen, wenn eine Person die Rolle eines 'Abweichender Forderungsinhaber' inne hat."
  * ^patternContactPoint.system = #phone
  * system MS
  * system = #phone
  * value MS
    * ^short = "Telefonnummer"
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
  * obeys address-cnt-2or3-char
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
* qualification.code.coding
  * ^slicing.discriminator.type = #pattern
  * ^slicing.discriminator.path = "$this"
  * ^slicing.rules = #open
* qualification.code.coding contains
    Fachrichtung ..1 MS
* qualification.code.coding[Fachrichtung] from $ihe-practiceSettingCode (required)
  * ^short = "Fachrichtung"
  * ^comment = "Die Fachrichtung SOLL vorhanden sein."
  * system 1.. MS
  * code 1.. MS