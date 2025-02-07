Profile: ERGRechnungsposition
Title: "ERG Rechnungsposition"
Parent: ChargeItem
Id: erg-rechnungsposition
* insert Meta
* extension contains
  ERGChargeItemType named Rechnungspositionstyp 1..1 MS
* extension[Rechnungspositionstyp]
  * ^short = "Rechnungspositionstyp"
  * ^comment = "Der Rechnungspositionstyp MUSS vorhanden sein."
  * valueCoding 1.. MS
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


// ----- noch nicht überarbeitet -----
* status MS
* subject MS
* subject.reference MS
* subject.reference ^comment = "Die referenzierte Instanz sollte valide zum Profil ERGersichertePerson sein"
* quantity 1.. MS
* factorOverride 1.. MS
* priceOverride 1.. MS
* extension contains https://gematik.de/fhir/erg/StructureDefinition/erg-preisdetails-rechnungsposition named unitPriceComponent 0..1 MS

Extension: ERGPreisDetailsRechnungsposition
Id: erg-preisdetails-rechnungsposition
Title: "ERG Preisdetails Rechnungsposition"
* insert Meta
* extension contains type 1..1 MS and code 0..1 and factor 0..1 and amount 0..1
* extension[type].value[x] only code
* extension[type].valueCode from http://hl7.org/fhir/invoice-priceComponentType (required)
* extension[code].value[x] only CodeableConcept // ToDo: Create VS
* extension[factor].value[x] only decimal
* extension[amount].value[x] only Money

Extension: ERGChargeItemType
Id: erg-chargeitem-type
Title: ""
Description: ""
* insert Meta
* ^context.type = #element
* ^context.expression = "ChargeItem"
* value[x] only Coding
* valueCoding from ERGChargeItemTypeVS (required)

CodeSystem: ERGChargeItemTypeCS
Id: erg-chargeitem-type-CS
Title: ""
* insert Meta
* #GOÄ "Leistung nach Gebührenordnung GOÄ"
* #GOZ "Leistung nach Gebührenordnung GOZ"
* #BEMA "BEMA-Leistung"
* #LabborleistungMaterial "Laborleistung/Material (inkl. BEL/BEB )"
* #SachkostenAuslagen "Sachkosten/Auslagen"
* #WegegeldReiseentschaedigung "Wegegeld/Reiseentschädigung"

ValueSet: ERGChargeItemTypeVS
Id: erg-chargeitem-type-VS
Title: ""
Description: ""
* insert Meta
* include codes from system ERGChargeItemTypeCS