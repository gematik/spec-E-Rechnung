Profile: ERGRechnungsposition
Title: "ERG Rechnungsposition"
Parent: ChargeItem
Id: erg-rechnungsposition
* insert Meta
* extension contains
  ERGRechnungspositionType named Rechnungspositionstyp 1..1 MS and
  ERGRechnungspositionZusatz named Zusatz ..1 MS and
  ERGWegegeldReiseentschaedigung named WegegeldReiseentschädigung ..1 MS and
  ERGRechnungspositionGOAngaben named GebührenordnungAngaben ..1 MS
* extension[Rechnungspositionstyp]
  * ^short = "Rechnungspositionstyp"
  * ^comment = "Der Rechnungspositionstyp MUSS vorhanden sein."
  * valueCoding 1.. MS
    * code 1.. MS
    * system 1.. MS
* extension[Zusatz]
  * ^short = "Zusatz"
  * ^comment = "Der Zusatz SOLL vorhanden sein."
  * valueCoding MS
    * code 1.. MS
    * system 1.. MS
* code MS
  * ^short = "Gebührenordnung-Nummer (Ziffer oder Paragraph)"
  * ^comment = "Ist der Rechnungspositionstyp auf eine Gebührenordnung festgelegt, SOLL die Gebührenordnung-Nummer als Ziffer oder Paragraph vorhanden sein."
  * coding MS
    * ^slicing.discriminator.type = #pattern
    * ^slicing.discriminator.path = "$this"
    * ^slicing.rules = #open
  * coding contains
      GOÄ 0..1 MS and
      GOZ 0..1 MS
  * coding[GOÄ]
    * ^short = "GOÄ Ziffer"
    * ^patternCoding.system = "http://fhir.de/CodeSystem/bäk/goä"
    * code MS
    * system MS
    * display MS
      * ^short = "Legendentext der Gebührenordnung"
  * coding[GOZ]
    * ^short = "GOZ Ziffer"
    * ^patternCoding.system = "http://fhir.de/CodeSystem/bzäk/goz"
    * code MS
    * system MS
    * display MS
      * ^short = "Legendentext der Gebührenordnung"
  * text MS
    * ^short = "Bezeichnung für Auslagen/Sachkosten, z.B. Wirkstoffname"
* occurrence[x] MS
* occurrence[x] only dateTime or Period
  * ^short = "Behandlungsdatum oder -zeitraum"
  * ^comment = "Mindestens eins, Datum oder Zeitraum, SOLLEN zur Behandlung vorhanden sein."
* occurrenceDateTime MS
  * ^short = "Behandlungsdatum"
* occurrencePeriod MS
  * ^short = "Behandlungszeitraum"
  * start MS
  * end MS
* performer MS
  * actor MS
  * actor only Reference(ERGLeistungserbringerPerson or ERGInstitution or Practitioner or Organization)
    * ^short = "Referenz Behandelnder Leistungserbringer"
    * ^comment = "Eine Referenz auf behandelnder Leistungserbringer SOLL vorhanden sein."
* reason MS
* reason.text MS
  * ^short = "Begründung in Abhängigkeit zur Gebührenziffer"
  * ^comment = "Die Begründung in Abhängigkeit zur Gebührenziffer SOLL vorhanden sein.
  Beispiele sind:
  - obligatorisch bei analoger Rechnungsposition
  - Angabe zu den behandelten Organen
  - Überschreitung der Regelsätze"
* bodysite MS
* bodysite.extension contains ERGZahnRegion named ZahnRegion ..1 MS
* bodysite.extension[ZahnRegion]
  * valueString 1.. MS
* product[x] MS
* product[x] only CodeableConcept
  * ^comment = "Bei Auslagen oder Sachkosten SOLL hier die PZN oder der Name des Medikamentes, Wirkstoffs oder Material angegeben werden."
* productCodeableConcept MS
  * text MS
    * ^short = "Material / Wirkstoffname"
    * ^comment = "Das Material oder der Wirkstoffname SOLLEN hier vorhanden sein."
  * coding ^slicing.discriminator.type = #pattern
  * coding ^slicing.discriminator.path = "$this"
  * coding ^slicing.rules = #open
  * coding contains PZN ..1 MS
  * coding[PZN] only $coding-pzn
    * ^short = "Pharmazentralnummer"
    * ^comment = "Die Pharmazentralnummer (PZN) SOLL vorhanden sein."
* quantity MS
  * ^short = "Anzahl oder verbrauchte Menge"
  * ^comment = "Ist die Rechnungsposition vom Typ 'Auslagen/Sachkosten' SOLL hier die Anzahl des unter product[x] angegebenen Medikament, Wirkstoff oder Material vorhanden sein.
  Ist die Rechnungsposition vom Typ 'GOÄ', 'GOZ' oder 'BEMA' SOLL hier die Anzahl vorhanden sein."
  * value 1.. MS
    * ^short = "Menge"
  * unit 1.. MS
    * ^short = "Einheit"
  * system 1.. MS
  * system = "http://unitsofmeasure.org"
  * code 1.. MS
    * ^short = "Einheit als UCUM-Code"
* status MS
  * ^short = "Der Status der Rechnungsposition MUSS vorhanden sein. Im Normalfall ist 'billable' zu nutzen." //TODO Passt der Status?
* subject MS
* subject only Reference(ERGVersichertePerson or Patient)
  * ^short = "Behandelte Person"
  * reference 1.. MS

Extension: ERGRechnungspositionType
Id: erg-rechnungsposition-type
Title: "ERG Typ der Rechnungsposition Extension"
Description: "In dieser Extension wird der Typ einer Rechnungsposition im Kontext der eRechnung abgebildet."
* insert Meta
* ^context.type = #element
* ^context.expression = "ChargeItem"
* value[x] only Coding
* valueCoding from ERGRechnungspositionTypeVS (required)

CodeSystem: ERGRechnungspositionTypeCS
Id: erg-chargeitem-type-CS
Title: "ERG Typ der Rechnungsposition CodeSystem"
* insert Meta
* #GOÄ "Leistung nach Gebührenordnung GOÄ"
* #GOZ "Leistung nach Gebührenordnung GOZ"
* #BEMA "BEMA-Leistung"
* #LabborleistungMaterial "Laborleistung/Material (inkl. BEL/BEB )"
* #SachkostenAuslagen "Sachkosten/Auslagen"
* #WegegeldReiseentschaedigung "Wegegeld/Reiseentschädigung"

ValueSet: ERGRechnungspositionTypeVS
Id: erg-chargeitem-type-VS
Title: "ERG Typ der Rechnungsposition ValueSet"
* insert Meta
* include codes from system ERGRechnungspositionTypeCS

CodeSystem: ERGRechnungspositionZusatzCS
Id: erg-rechnungsposition-zusatz-CS
Title: "ERG Rechnungsposition Zusatz CodeSystem"
* #V "auf Verlangen erbrachte Leistung"
* #F "Leistung zur Früherkennung"
* #A "analoge Leistung"

ValueSet: ERGRechnungspositionZusatzVS
Id: erg-rechnungsposition-zusatz-VS
Title: "ERG Rechnungsposition Zusatz ValueSet"
* include codes from system ERGRechnungspositionZusatzCS

Extension: ERGRechnungspositionZusatz
Id: ERGRechnungspositionZusatz
Title: "ERG Rechnungsposition Zusatz Extension"
Description: "In dieser Extension wird der Zusatz zu einer Rechnungsposition im Kontext der eRechnung abgebildet."
Context: ChargeItem
* value[x] only Coding
* valueCoding from ERGRechnungspositionZusatzVS

Extension: ERGZahnRegion
Id: erg-zahnregion
Title: "ERG Zahn/Region Extension"
Description: "In dieser Extension wird die Angabe der Zahn/Region an einer Rechnungsposition der eRechnung abgebildet."
Context: ChargeItem.bodysite
* value[x] only string
* valueString
  * ^short = ""
  * ^comment = "Das Element Zahn/Region ist ein Freitextfelt und SOLL vorhanden sein.
  Im GOZ-Rechnungsformular zugelassen ist 
  - zwei Ziffern durch Komma und Leerzeichen getrennt
  - Bereich zugelassen, z.B. 17-27
  Die Kieferbezeichnung mit 'OK' und 'UK' ist im Formular nicht zulässig, da die Verwendung allerdings die Regel ist, wird der Inhalt des Feldes nicht nach Korrektheit überprüft."

Extension: ERGWegegeldReiseentschaedigung
Id: erg-wegegeld-reiseentschaedigung
Title: "ERG Wegegeld/Reiseentschädigung Extension"
Context: ChargeItem
* extension contains
  Wegegeld ..1 MS and
  Reiseentschädigung ..1 MS
* extension[Wegegeld]
  * ^short = "Wegegeld bis 25km"
  * ^comment = "Das Wegegeld bis 25km SOLL vorhanden sein."
  * extension contains
    Entfernung ..1 MS and
    Nacht ..1 MS
  * extension[Entfernung]
    * ^short = "Entfernung in km"
    * value[x] only Quantity
    * valueQuantity MS
      * unit 1.. MS
      * unit = "km"
      * code 1.. MS
      * code = #km
      * system 1.. MS
      * system = "http://unitsofmeasure.org"
      * value 1.. MS
  * extension[Nacht]
    * ^short = "Nacht"
    * value[x] only boolean
    * valueBoolean MS
* extension[Reiseentschädigung]
  * ^short = "Reiseentschädigung ab 25 km"
  * ^comment = "Die Reiseentschädigung ab 25 km SOLL vorhanden sein."
  * extension contains
    Abwesenheit ..1 MS and
    Entfernung ..1 MS and
    Übernachtung ..1 MS and
    Verkehrsmittel ..1 MS
  * extension[Abwesenheit]
    * ^short = "Abwesenheit in Stunden"
    * value[x] only Quantity
    * valueQuantity MS
      * unit 1.. MS
      * unit = "h"
      * code 1.. MS
      * code = #h
      * system 1.. MS
      * system = "http://unitsofmeasure.org"
      * value 1.. MS
  * extension[Entfernung]
    * ^short = "Entfernung in km"
    * value[x] only Quantity
    * valueQuantity MS
      * unit 1.. MS
      * unit = "km"
      * code 1.. MS
      * code = #km
      * system 1.. MS
      * system = "http://unitsofmeasure.org"
      * value 1.. MS
  * extension[Übernachtung]
    * ^short = "Kosten der Übernachtung"
    * value[x] only Money
    * valueMoney MS
      * currency 1.. MS
      * currency = #EUR
      * value 1.. MS
  * extension[Verkehrsmittel]
    * ^short = "Verkehrsmittel"
    * value[x] only string
    * valueString 1.. MS

Extension: ERGRechnungspositionGOAngaben
Id: erg-rechnungsposition-go-angaben
Title: "ERG Angaben bei Gebührenordnungen bei einer Rechnungsposition"
Context: ChargeItem
* extension contains
  Einfachsatz ..1 MS and
  Punktzahl ..1 MS and
  Faktor ..1 MS and
  FaktorId ..1 MS and
  Minderung§6GOÄ ..1 MS
* extension[Einfachsatz]
  * ^short = "Gebühr Einfachsatz in EUR"
  * ^comment = "Der Gebühr Einfachsatz in EUR SOLL vorhanden sein."
  * value[x] only Money
  * valueMoney MS
    * currency 1.. MS
    * currency = #EUR
    * value 1.. MS
* extension[Punktzahl]
  * ^short = "Punktzahl BEMA"
  * ^comment = "Die Punktzahl BEMA SOLL vorhanden sein."
  * value[x] only decimal
  * valueDecimal MS
* extension[Faktor]
  * ^short = "Faktor"
  * ^comment = "Der Faktor SOLL vorhanden sein."
  * value[x] only decimal
  * valueDecimal MS
* extension[FaktorId]
  * extension contains
    Id ..1 MS and
    Ausprägung ..1 MS
  * extension[Id]
    * ^short = "Faktor ID"
    * ^comment = "Die Faktor ID SOLL vorhanden sein."
    * value[x] only string //TODO Klärung des Datentyp
  * extension[Ausprägung]
    * ^short = "Faktor ID Ausprägung"
    * ^comment = "Die Faktor ID Ausprägung SOLL vorhanden sein."
    * value[x] only Coding
    * valueCoding MS
    * valueCoding from ERGRechnungspositionFaktorIdAuspraegungenVS (required)
* extension[Minderung§6GOÄ]
  * ^short = "Minderungen nach §6a GOÄ in Prozent"
  * ^comment = "Die Minderungen nach §6a GOÄ in Prozent SOLL vorhanden sein."
  * value[x] only Quantity
  * valueQuantity MS
    * unit 1.. MS
    * unit = "%"
    * code 1.. MS
    * code = #%
    * system 1.. MS
    * system = "http://unitsofmeasure.org"
    * value 1.. MS

CodeSystem: ERGRechnungspositionFaktorIdAuspraegungenCS
Id: erg-rechnungsposition-faktor-id-auspraegungen-CS
Title: "ERG Rechnungsposition Ausprägungen der FaktorID CodeSystem"
* #HV "Honorarvereinbarung" "Die HV ist der Rechnung beizulegen."
* #BT "Basistarif"
* #ST "Standardtarif"
* #NT "Notlagentarif"
* #AB "Allgemeine Bestimmung" "In Begründung AB angeben."

ValueSet: ERGRechnungspositionFaktorIdAuspraegungenVS
Id: erg-rechnungsposition-faktor-id-auspraegungen-VS
Title: "ERG Rechnungsposition Ausprägungen der FaktorID ValueSet"
* include codes from system ERGRechnungspositionFaktorIdAuspraegungenCS
