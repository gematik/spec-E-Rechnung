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
* extension[WegegeldReiseentschädigung] MS
  * extension[Wegegeld] MS
    * ^short = "Wegegeld bis 25km"
    * ^comment = "Das Wegegeld bis 25km SOLL vorhanden sein."
    * extension[Entfernung] MS
      * ^short = "Entfernung in km"
      * valueQuantity MS
        * unit 1.. MS
        * code 1.. MS
        * system 1.. MS
        * value 1.. MS
    * extension[Nacht] MS
      * ^short = "Nacht"
      * valueBoolean MS
  * extension[Reiseentschädigung] MS
    * ^short = "Reiseentschädigung ab 25 km"
    * ^comment = "Die Reiseentschädigung ab 25 km SOLL vorhanden sein."
    * extension[Abwesenheit] MS
      * ^short = "Abwesenheit in Stunden"
      * valueQuantity MS
        * unit 1.. MS
        * code 1.. MS
        * system 1.. MS
        * value 1.. MS
    * extension[Entfernung] MS
      * ^short = "Entfernung in km"
      * valueQuantity MS
        * unit 1.. MS
        * code 1.. MS
        * system 1.. MS
        * value 1.. MS
    * extension[Übernachtung] MS
      * ^short = "Kosten der Übernachtung"
      * valueMoney MS
        * currency 1.. MS
        * value 1.. MS
    * extension[Verkehrsmittel] MS
      * ^short = "Verkehrsmittel"
      * valueString 1.. MS
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