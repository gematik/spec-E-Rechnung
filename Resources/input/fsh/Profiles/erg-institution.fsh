Profile: ERGInstitution
Parent: Organization
Title: "ERG Institution"
Id: erg-institution
* insert Meta
* identifier MS
* identifier ^slicing.discriminator.type = #pattern
* identifier ^slicing.discriminator.path = "$this"
* identifier ^slicing.rules = #open
* identifier contains
    Telematik-ID ..1 MS and
    IKNR ..1 MS and
    BSNR ..1 MS and
    USt-ID-Nr ..1 MS
* identifier[Telematik-ID] only $identifier-telematikId
  * ^patternIdentifier.type = $v2-0203#PRN
  * type 1.. MS
  * system MS
  * value MS
    * ^short = "Telematik-ID (VZD-Eintrag)"
  * ^short = "Telematik-ID (VZD-Eintrag)"
  * ^comment = "Die Telematik-ID (VZD-Eintrag) SOLL vorhanden sein."
* identifier[IKNR] only $identifier-iknr
  * ^patternIdentifier.type = $v2-0203#XX
  * type 1.. MS
  * system MS
  * value MS
    * ^short = "IK-Nummer"
  * ^short = "IK-Nummer"
  * ^comment = "Für privatärztliche Praxis SOLL die IK-Nummer vorhanden sein. Bei allen anderen Institutionen KANN sie vorhanden sein. Die IK-Nummer SOLL für alle Apotheken vorhanden sein."
* identifier[BSNR] only $identifier-bsnr
  * ^patternIdentifier.type = $v2-0203#BSNR
  * type 1.. MS
  * system MS
  * value MS
    * ^short = "Betriebsstättennummer"
  * ^short = "Betriebsstättennummer"
  * ^comment = "Die Betriebsstättennummer für vertragsärztliche Praxen SOLL vorhanden sein."
* identifier[USt-ID-Nr]
  * ^patternIdentifier.type = $v2-0203#TAX
  * type 1.. MS
  * type = $v2-0203#TAX //TODO Anfrage beim TC Term läuft
  * system ^comment = "Es gibt kein FHIR-NamingSystem für die USt.-ID von offizieller Seite. Aus dem Grund ist System nicht mit MS gekennzeichnet und SOLL nicht befüllt sein." //TODO Anfrage beim TC Term läuft
  * value 1.. MS
  * ^short = "Umsatzsteuer-Identifikationsnummer"
  * ^comment = "Die Umsatzsteuer-Identifikationsnummer KANN vorhanden sein.
  Sie KANN vorkommen, wenn eine Institution die Rolle eines 'Abweichender Forderungsinhaber', sowie des 'Rechnungsersteller' inne hat."
* type MS
* type ^slicing.discriminator.type = #pattern
* type ^slicing.discriminator.path = "$this"
* type ^slicing.rules = #open
* type contains
    Fachrichtung ..1 MS
* type[Fachrichtung] from $ihe-practiceSettingCode (required)
  * ^short = "Fachrichtung"
  * ^comment = "Die Fachrichtung SOLL vorhanden sein."
  * coding.system 1.. MS
  * coding.code 1.. MS
* name MS
  * ^short = "Institutionsname"
  * ^comment = "Der Institutionsname SOLL vorhanden sein."
* telecom MS
* telecom ^slicing.discriminator.type = #pattern
* telecom ^slicing.discriminator.path = "$this"
* telecom ^slicing.rules = #open
* telecom contains Telefon ..* MS
* telecom[Telefon]
  * ^short = "Telefon"
  * ^comment = "Die Angabe einer Telefonnummer KANN vorhanden sein.
  Sie KANN vorkommen, wenn eine Institution die Rolle eines 'Abweichender Forderungsinhaber', sowie des 'Rechnungsersteller' inne hat."
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
    * extension[Hausnummer] 0..1 MS
    * extension[Adresszusatz] 0..1 MS
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
  //* obeys address-cnt-2or3-char TODO Frage an Alexander Z.
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
  * city MS
    * ^short = "Ort"
    * ^comment = "Der Ort SOLL vorhanden sein."
  * postalCode MS
    * ^short = "Postleitzahl"
    * ^comment = "Die Postleitzahl SOLL vorhanden sein."
  * country MS
    * ^short = "Länderkennzeichen"
    * ^comment = "Das Länderkennzeichen KANN vorhanden sein."