Profile: DiPagRechnungsposition
Title: "Digitale Patientenrechnung Rechnungsposition"
Parent: ChargeItem
Id: dipag-rechnungsposition
* insert Meta
* extension contains
  DiPagRechnungspositionType named Rechnungspositionstyp 1..1 MS and
  DiPagRechnungspositionZusatz named Zusatz ..1 MS and
  DiPagWegegeldReiseentschaedigung named WegegeldReiseentschädigung ..1 MS and
  DiPagRechnungspositionGOAngaben named GebührenordnungAngaben ..1 MS and
  DiPagRechnungspositionBehandlungsdatum named Behandlungsdatum ..1 MS
* extension[Rechnungspositionstyp]
  * ^short = "Rechnungspositionstyp"
  * ^comment = "Der Rechnungspositionstyp MUSS vorhanden sein."
  * valueCoding 1.. MS
    * code 1.. MS
    * system 1.. MS
* extension[Zusatz]
  * ^short = "Zusatz"
  * ^comment = "Im Falle einer GOÄ, GOÄ-neu oder GOZ Rechnungsposition, SOLL der Zusatz vorhanden sein.
  Der Code F 'Leistungs zur Früherkennung' ist für GOZ-Rechnungen nicht relevant."
  * valueCoding MS
    * code 1.. MS
    * system 1.. MS
* extension[WegegeldReiseentschädigung] MS
  * ^short = "Wegegeld oder Reiseentschädigung"
  * ^comment = "Im Falle einer GOÄ, GOÄ-neu oder GOZ Rechnungsposition SOLL Wegegeld oder Reiseentschädigung vorhanden sein."
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
      * valueCoding 1.. MS
* extension[GebührenordnungAngaben]
  * extension[Einfachsatz] MS
    * ^short = "Gebühr Einfachsatz in EUR"
    * ^comment = "Im Falle einer GOÄ, GOÄ-neu oder GOZ Rechnungsposition, SOLL der Gebühr Einfachsatz in EUR vorhanden sein."
    * valueMoney MS
      * currency 1.. MS
      * value 1.. MS
  * extension[Faktor] MS
    * extension[Value]
      * ^short = "Faktor"
      * ^comment = "Im Falle einer GOÄ, GOÄ-neu oder GOZ Rechnungsposition SOLL der Faktor vorhanden sein."
      * valueDecimal MS
    * extension[FaktorGrund] MS
      * ^short = "Faktor Grund"
      * ^comment = "Im Falle einer GOÄ-neu Rechnungsposition SOLL der Faktor Grund vorhanden sein.
      Im Falle einer GOÄ Rechnungsposition KANN der Faktor Grund vorhanden sein.
      Im Falle einer GOZ Rechnungsposition ist der Faktor Grund nicht gefordert."
      * valueCoding MS
  * extension[MinderungP6GOÄ] MS
    * ^short = "Minderungen nach §6a GOÄ in Prozent"
    * ^comment = "Im Falle einer GOÄ oder GOÄ-neu Rechnungsposition SOLL die Minderungen nach §6a GOÄ in Prozent vorhanden sein.
    Im Falle einer GOZ Rechnungsposition ist das Element nicht gefordert."
    * valueQuantity MS
      * unit 1.. MS
      * code 1.. MS
      * system 1.. MS
      * value 1.. MS
* extension[Behandlungsdatum]
  * ^short = "Behandlungsdatum"
  * ^comment = "Das Behandlungsdatum SOLL vorhanden sein."
  * valueDate MS
* code MS
  * ^short = "Gebührenziffer"
  * ^comment = "Ist der Rechnungspositionstyp auf eine Gebührenordnung festgelegt, SOLL die Gebührenziffer vorhanden sein.
Mit 'Gebührenziffer' ist die eindeutige Kennung zu verstehen, die eine spezifische medizinische oder zahnmedizinische Leistung in den entsprechenden Gebührenordnungen beschreibt. Sie dient als Grundlage für die Abrechnung zwischen Leistungserbringern (Ärzten/Zahnärzten) und Kostenträgern (z. B. Krankenkassen oder Patienten). In spezifischen Gebührenordnungen werden ggf. abweichende Begriffe hierfür verwendet."
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
      * ^short = "Legendentext der Gebührenordnung / Leistungsbeschreibung"
  * coding[GOZ]
    * ^short = "GOZ Ziffer"
    * ^patternCoding.system = "http://fhir.de/CodeSystem/bäk/gzä"
    * code MS
    * system MS
    * display MS
      * ^short = "Legendentext der Gebührenordnung / Leistungsbeschreibung"
  * text MS
    * ^short = "Bezeichnung für Auslagen/Sachkosten, z.B. Wirkstoffname oder Fremdlaborleistung"
* occurrence[x] MS
* occurrence[x] only Period
  * ^short = "Leistungszeitraum"
  * ^comment = "Im Falle einer GOÄ, GOÄ-neu oder GOZ Rechnungsposition, SOLL der Leistungszeitraum vorhanden sein."
* occurrencePeriod MS
  * ^short = "Behandlungszeitraum"
  * start MS
  * end MS
* performer MS
  * actor MS
  * actor only Reference(DiPagPerson or DiPagInstitution or Practitioner or Organization)
    * ^short = "Referenz Behandelnder Leistungserbringer"
    * ^comment = "Im Falle einer GOÄ-neu Rechnungsposition, SOLL die Referenz auf einen behandelnden Leistungserbringer vorhanden sein.
    Im Fall einer GOÄ Rechnungsposition, KANN ein behandelnder Leistungserbringer vorhanden sein.
    Bei GOZ Leistungen ist ein behandelnder Leistungserbringer nicht gefordert."
* reason MS
* reason.text MS
  * ^short = "Begründung in Abhängigkeit zur Gebührenziffer"
  * ^comment = "Im Falle einer GOÄ, GOÄ-neu oder GOZ Rechnungsposition, SOLL die Begründung in Abhängigkeit zur Gebührenziffer vorhanden sein.
  Beispiele sind:
  - obligatorisch bei analoger Rechnungsposition
  - Angabe zu den behandelten Organen
  - Überschreitung der Regelsätze"
* bodysite MS
* bodysite.extension contains DiPagZahnRegion named ZahnRegion ..1 MS
* bodysite.extension[ZahnRegion]
  * ^short = "Zahn/Region"
  * ^comment = "Im Falle einer GOZ Rechnungsposition, SOLL das Element Zahn/Region vorhanden sein.
  Im Falle einer GOÄ oder GOÄ-neu Rechnungsposition ist das Element nicht gefordert.
  Im GOZ-Rechnungsformular zugelassen ist 
  - zwei Ziffern durch Komma und Leerzeichen getrennt
  - Bereich zugelassen, z.B. 17-27
  Die Kieferbezeichnung mit 'OK' und 'UK' ist im Formular nicht zulässig, da die Verwendung allerdings die Regel ist, wird der Inhalt des Feldes nicht nach Korrektheit überprüft."
  * valueString 1.. MS
* product[x] MS
* product[x] only CodeableConcept
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
    * ^comment = "Im Falle einer GOÄ oder GOÄ-neu Rechnungsposition SOLL die Pharmazentralnummer (PZN) vorhanden sein.
    Im Falle einer GOZ Rechnungsposition wird die PZN nicht gefordert."
* quantity MS
  * ^short = "Anzahl oder verbrauchte Menge"
  * ^comment = "Ist die Rechnungsposition vom Typ 'Auslagen/Sachkosten' und es eine GOÄ, GOÄ-neu oder GOZ Rechnungsposition, SOLL hier die Anzahl des unter product[x] angegebenen Medikament, Wirkstoff oder Material vorhanden sein.
  Ist die Rechnungsposition vom Typ 'GOÄ' oder 'GOZ' SOLL hier die Anzahl vorhanden sein."
  * value 1.. MS
    * ^short = "Menge"
  * unit 1.. MS
    * ^short = "Einheit"
  * system 1.. MS
  * system = "http://unitsofmeasure.org"
  * code 1.. MS
    * ^short = "Einheit als UCUM-Code"
* status MS
* status = #billable
  * ^short = "Der Status der Rechnungsposition MUSS vorhanden sein."
* subject MS
* subject only Reference(DiPagPatient or Patient)
  * ^short = "Behandelte Person"
  * reference 1.. MS