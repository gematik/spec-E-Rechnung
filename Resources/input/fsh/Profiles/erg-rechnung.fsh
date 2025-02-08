Profile: ERGRechnung
Title: "ERG Rechnung"
Parent: Invoice
Id: erg-rechnung
* insert Meta
//TODO @Alexander Z, sollen wir das drin lassen? Im Workshop ist das gar nicht auf der Liste für die Inhalte gelandet
* extension contains 
  ERGPDFRepraesentationRechnung named pdf-repraesentation-rechnung 0..1 MS and 
  http://hl7.org/fhir/5.0/StructureDefinition/extension-Invoice.period[x] named Behandlungszeitraum 0..1 MS and
  ERGAbrechnungsDiagnoseProzedur named AbrechnungsDiagnoseProzedur 0..* MS and
  ERGAbrechnungsDiagnoseProzedurFreitext named AbrechnungsDiagnoseProzedurFreitext ..1 MS and
  ERGBehandlungsart named Benhandlungsart 1..1 MS and
  ERGFachrichtung named Fachrichtung 1..1 MS and
  $extension-replaces named Korrekturrechnung ..1 MS
* extension[AbrechnungsDiagnoseProzedur]
  * extension[Use].valueCoding MS
    * ^short = "Kennzeichen Hauptdiagnose"
    * ^comment = "Das Kennzeichen Hauptdiagnose SOLL vorhanden sein."
    * code = http://TODO.de#main-diagnosis
  * extension[Referenz].valueReference MS
    * ^short = "Zuordnung von Diagnosen oder Prozeduren zur Rechnung"
    * ^comment = "Diagnosen und Prozeduren SOLLEN zur Rechnung zugeordnet sein."
* extension[Behandlungszeitraum]
  * ^short = "Behandlungszeitraum"
  * ^comment = "Entweder ein Behandlungszeitraum, oder ein -datum SOLL vorhanden sein."
  * valuePeriod MS
    * start MS
      * ^short = "Startdatum"
    * end MS
      * ^short = "Enddatum"
  * valueDate MS
    * ^short = "Behandlungsdatum"
* extension[AbrechnungsDiagnoseProzedurFreitext]
  * ^short = "Einleitung"
  * ^comment = "Diagnose und Prozedure als Freitextangabe"
  * valueString 1.. MS
* extension[Benhandlungsart]
  * ^short = "Behandlungsart"
  * ^comment = "Die Behandlungsart MUSS vorhanden sein."
  * valueCoding 1..1 MS
    * system 1.. MS
    * code 1.. MS
* extension[Fachrichtung]
  * ^short = "Fachrichtung"
  * ^comment = "Die Fachrichtung MUSS vorhanden sein."
  * valueCoding 1..1 MS
    * system 1.. MS
    * code 1.. MS
* extension[Korrekturrechnung]
  * ^short = "Info Korrekturrechnung"
  * ^comment = "Wenn die Instanz dieser Rechnung eine Korrektur einer anderen Rechnung ist, soll die ersetzte Rechnung hier referenziert werden."
  * valueCanonical 1..1 MS
  * valueCanonical only Canonical(ERGRechnung or Invoice)
* identifier 1.. MS
* identifier ^slicing.discriminator.type = #pattern
* identifier ^slicing.discriminator.path = "$this"
* identifier ^slicing.rules = #open
* identifier contains
  Rechnungsnummer 1..1 MS and
  Antragsnummer ..1 MS
* identifier[Rechnungsnummer]
  * ^patternIdentifier.type = http://TODO.de#invoice
  * ^short = "Rechnungs-Nr. (der LEI)"
  * ^comment = "Die Rechnungs-Nr. (der LEI) MUSS vorhanden sein."
  * type 1.. MS
  * type = http://TODO.de#invoice
  * system 1.. MS
    * ^short = "NamingSystem der Rechnungs-Nr. (der LEI)"
  * value 1.. MS
    * ^short = "Rechnungs-Nr. (der LEI)"
* date 1.. MS
  * ^short = "Rechnungsdatum"
  * ^comment = "Das Rechnungsdatum MUSS vorhanden sein."
* identifier[Antragsnummer]
  * ^patternIdentifier.type = http://TODO.de#Auftragsnummer
  * ^short = "Referenz auf Heil- und Kostenplan, Kostenvoranschlag oder Kostenübernahmeantrag"
  * ^comment = "Die Rechnungs-Nr. (der LEI) MUSS vorhanden sein."
  * type 1.. MS
  * type = http://TODO.de#Auftragsnummer
  * system 1.. MS
    * ^short = "NamingSystem der Rechnungs-Nr. (der LEI)"
  * value 1.. MS
    * ^short = "Rechnungs-Nr. (der LEI)"
* date 1.. MS
  * ^short = "Rechnungsdatum"
  * ^comment = "Das Rechnungsdatum MUSS vorhanden sein."
* type MS
* type.coding 1.. MS
  * ^slicing.discriminator.type = #pattern
  * ^slicing.discriminator.path = "$this"
  * ^slicing.rules = #open
* type.coding contains 
  AusrichtungDerRechnung ..1 MS and
  Rechnungsart ..1 MS
* type.coding[AusrichtungDerRechnung] from ERGRechnungAbrechnungsartVS (required)
  * ^patternCoding.system = Canonical(ERGRechnungAbrechnungsartCS)
  * ^short = "Abrechnungsart der Rechnung"
  * ^comment = "Die Grundsätzliche Ausrichtung der Rechnung (Abrechnungsart) SOLL vorhanden sein."
  * system 1.. MS
  * code 1.. MS
  * extension contains ERGZusatzinformationZurAbrechnungsart named Zusatzinformation ..1 MS
  * extension[Zusatzinformation]
    * ^short = "Zusatzinformation zur Abrechnungsart"
    * ^comment = "Die Zusatzinformation zur Abrechnungsart SOLL vorhanden sein, wenn es sich um eine Abrechnung nach §13 Abs. 2 SGB V handelt."
  * extension[Zusatzinformation].valueBoolean MS
* type.coding[Rechnungsart] from ERGRechnungsartVS (required)
  * ^patternCoding.system = Canonical(ERGRechnungsartCS)
  * ^short = "Rechnungsart"
  * ^comment = "Die Rechnungsart SOLL vorhanden sein."
  * system 1.. MS
  * code 1.. MS
* subject 1..1 MS
* subject only Reference(ERGPerson or Patient)
  * reference 1..1 MS
  * ^short = "Behandelte Person"
  * display 1..1 MS //TODO Hatten wir in der ersten Version drin, sollen wir den entfernen jetzt?
    * ^short = "Name der behandelten Person"
    * ^comment = "Der Name der behandelten Person SOLL angegeben werden und kann vom Rechnungsempfänger abweichen, z.B. wenn Eltern Rechnungen für ihre Kinder erhalten."
* recipient 1.. MS
  * ^short = "Rechnungsempfänger"
  * ^comment = "Das System des Leistungserbringers referenziert hier üblicherweise 
  auf die lokale Instanz des Patienten um die Rechnung einer Patientenakte zuzuordnen. 
  Der Fachdienst substitutiert den Link mit der Referenz auf das Postfach des Patienten 
  bei der Extraktion der Invoice aus dem Bundle. Die Angabe der Versichertennummer dient 
  der Plausibilisierung. Die KV-Nummer in der Instanz des Bundles muss daher mit der 
  KV-Nummer übereinstimmen, die im Fachdienst für das Postfach des Rechnungsempfängers hinterlegt ist. " //TODO Text aus erster Version
* recipient only Reference(ERGPerson or Patient)
  * reference MS
  * identifier 1.. MS
  * identifier only IdentifierKvid10 //TODO hatten wir in der ersten Version drin, sollen wir das so lassen?
  * display 1.. MS
* status MS
  * ^short = "Status der Rechnung"
  * ^comment = "Der Status MUSS vorhanden sein. Im Normalfall ist der Code 'issued' anzugeben."
* issuer 1.. MS
* issuer only Reference(ERGInstitution or Organization)
  * ^short = "Rechnungsersteller"
  * ^comment = "Der Rechnungsersteller MUSS vorhanden sein."
  * reference 1.. MS 
* participant MS
  * ^short = "weitere behandelnde Leistungserbringer oder abweichender Forderungsinhaber"
* participant.role MS
* participant.role from ERGParticipantRoleVS (required)
* participant ^slicing.discriminator.type = #pattern
* participant ^slicing.discriminator.path = "role"
* participant ^slicing.rules = #open
* participant contains 
  Leistungserbringer 1..* MS and
  Forderungsinhaber ..1 MS
* participant[Leistungserbringer]
  * ^short = "Weitere behandelnde Leistungserbringer"
  * ^comment = "Weitere behandelnde Leistungserbringer SOLLEN vorhanden sein."
  * role = ERGParticipantRoleCS#leistungserbringer
  * actor only Reference(ERGLeistungserbringerPerson or ERGInstitution or Practitioner or Organization)
* participant[Forderungsinhaber]
  * ^short = "Abweichender Forderungsinhaber"
  * ^comment = "Der abweichender Forderungsinhaber SOLL vorhanden sein."
  * role MS
  * role = ERGParticipantRoleCS#forderungsinhaber
  * actor only Reference(ERGLeistungserbringerPerson or ERGInstitution or Practitioner or Organization)
* note MS
  * ^short = "Hinweise an den Kostenträger"
  * ^comment = "Der Hinweise an den Kostenträger KANN vorhanden sein."
* paymentTerms MS
  * ^short = "Zahlungsdaten Überweisung und weitere Zahlungsmethoden"
  * ^comment = "Die Zahlungsdaten zur Überweisung SOLLEN vorhanden sein.
  Weitere Zahlungsmethoden wie bspw. Paypal, Klarna, Kreditkarte KÖNNEN auch hier angegeben werden.
  Die Extensions zur qualifizierung der Zahlungsdaten KÖNNEN vorhanden sein." //TODO Extensions hinzufügen
* paymentTerms.extension contains ERGZahlungsziel named Zahlungsziel 1..1 MS
* paymentTerms.extension[Zahlungsziel]
  * ^short = "Zahlungsziel als Datum oder Fristangabe"
  * ^comment = "Das Zahlungsziel SOLL vorhanden sein."
* totalNet 1.. MS
  * ^short = "Rechnungsbetrag (Netto)"
  * ^comment = "Der Rechnungsbetrag in Netto MUSS vorhanden sein."
* totalGross 1.. MS
  * ^short = "Rechnungsbetrag (Brutto)"
  * ^comment = "Der Rechnungsbetrag in Brutto MUSS vorhanden sein."
* totalPriceComponent MS
* totalPriceComponent ^slicing.discriminator.type = #pattern
* totalPriceComponent ^slicing.discriminator.path = "code"
* totalPriceComponent ^slicing.rules = #open
* totalPriceComponent contains 
  SummeRechnungspositionen ..1 MS and
  MinderungNachGOZ ..1 MS and
  Abzug ..* MS
* totalPriceComponent[SummeRechnungspositionen]
  * ^short = "Summe aller Rechnungspositionen"
  * ^comment = "Die Summe aller Rechnungspositionen SOLL vorhanden sein."
  * type MS
  * type = #base
  * code 1.. MS
  * code = ERGTotalPriceComponentTypeCS#SummeRechnungspositionen
  * factor 0..0
  * amount ..1 MS
    * ^short = "Wert in EUR"
    * currency 1.. MS
    * currency = #EUR
    * value 1.. MS
* totalPriceComponent[MinderungNachGOZ]
  * ^short = "Minderungen nach §7 GOZ"
  * ^comment = "Die Minderungen nach §7 GOZ SOLLEN vorhanden sein."
  * type MS
  * type = #deduction
  * code 1.. MS
  * code = ERGTotalPriceComponentTypeCS#Minderung7GOZ
  * factor 0..0
  * amount ..1 MS
    * ^short = "Wert in EUR"
    * currency 1.. MS
    * currency = #EUR
    * value 1.. MS
* totalPriceComponent[Abzug]
  * ^short = "Abzug"
  * ^comment = "Der Abzug SOLL vorhanden sein."
  * type MS
  * type = #deduction
  * code 1.. MS
  * code from ERGTotalPriceComponentTypeVS (required)
    * ^short = "Kategorisierung des Abzugs"
    * ^comment = "Die Kategorisierung des Abzugs SOLL vorhanden sein."
  * factor 0..0
  * amount ..1 MS
    * ^short = "Wert in EUR"
    * currency 1.. MS
    * currency = #EUR
    * value 1.. MS
  * extension contains ERGAbzugKassenanteil named Kassenanteil ..1 MS
  * extension[Kassenanteil]
    * ^short = "Kassenanteil in Prozent"
    * ^comment = "Der Kassenanteil in Prozent SOLL vorhanden sein."
    * valueQuantity 1.. MS
      * unit MS
      * value MS
      * system MS
      * code MS
// ---- Nicht überarbeitet---
* lineItem MS
  * ^short = "Rechnungspositionen"
* lineItem.chargeItem[x] only Reference
* lineItem.chargeItemReference MS

Extension: ERGPDFRepraesentationRechnung
Id: erg-pdf-repraesentation-rechnung
Title: "ERG PDF-Repräsentation Rechnung"
* insert Meta
* value[x] only Reference(Binary)

Extension: ERGZahlungsziel
Id: erg-zahlungsziel
Title: "ERG Zahlungsziel"
* insert Meta
* value[x] only date

Extension: ERGBehandlungsart
Id: erg-behandlungsart
Title: "ERG Extension Behandlungsart"
* insert Meta
* ^context.type = #element
* ^context.expression = "Invoice"
* value[x] only Coding
* valueCoding from ERGRechnungBehandlungsartVS

CodeSystem: ERGParticipantRoleCS
Id: erg-participant-role-CS
Title: "ERG Teilnehmer Rolle"
* insert Meta
* #leistungserbringer "Leistungserbringer"
* #forderungsinhaber "Forderungsinhaber"

ValueSet: ERGParticipantRoleVS
Id: erg-participant-role-VS
Title: "ERG Teilnehmer Rolle"
Description: "Diese Codes enthalten Teilnehmer Rollen der eRechnung"
* insert Meta
* include codes from system ERGParticipantRoleCS

Extension: ERGAbrechnungsDiagnoseProzedur
Id: ERGAbrechnungsDiagnoseProzedur
Title: "Abrechnungsrelevanz von Diagnosen und Prozeduren"
Description: """Diese Extension erlaubt es einer Invoice Diagnosen oder Prozeduren, incl. Qualifier wie bspw: "Primär-DRG" zuzuordnen. Dies ermöglicht unter anderem das Zuordnen von Haupt- und Nebendiagnosen zu einem Account zum Zweck der DRG Erstellung."""
* insert Meta
* ^context.type = #element
* ^context.expression = "Invoice"
* . ^short = "Abrechnungsrelevanz von Diagnosen und Prozeduren"
* extension contains
    Use 1..1 and
    Referenz 1..*
* extension[Use].value[x] only Coding
* extension[Use].valueCoding 0..1
* extension[Use].valueCoding from http://fhir.de/ValueSet/AbrechnungsDiagnoseProzedur (extensible)
* extension[Referenz].value[x] only Reference(Condition or Procedure)

Extension: ERGAbrechnungsDiagnoseProzedurFreitext
Id: ERGAbrechnungsDiagnoseProzedurFreitext
Title: "Abrechnungsrelevanz von Diagnosen und Prozeduren als Freitext"
Description: ""
* insert Meta
* ^context.type = #element
* ^context.expression = "Invoice"
* . ^short = "Abrechnungsrelevanz von Diagnosen und Prozeduren als Freitext"
* value[x] only string

Extension: ERGZusatzinformationZurAbrechnungsart
Id: ERGZusatzinformationZurAbrechnungsart
Title: "Zusatzinformation zur Abrechnungsart"
Description: "Die Abrechnung nach §13 kann ergänzend zu den grundsätzlichen Ausrichtungen der Abrechnung aufgeführt werden. Diese Extension erlaubt es, die Ausrichtung der Rechnung entsprechend zu flaggen.
Ist die Extension gesetzt, dann ist die Frage der Abrechnung nach §13 Abs. 2 SGB V mit 'Ja' beantwortet"
* insert Meta
* ^context.type = #element
* ^context.expression = "Invoice.type"
* . ^short = "Zusatzinformation zur Abrechnungsart"
* value[x] only boolean
* valueBoolean = true

Extension: ERGFachrichtung
Id: erg-fachrichtung
Title: "ERG Extension Fachrichtung"
* insert Meta
* ^context.type = #element
* ^context.expression = "Invoice"
* value[x] only Coding
* valueCoding from $ihe-practiceSettingCode (required)

Extension: ERGAbzugKassenanteil
Id: erg-abzug-kassenanteil
Title: "ERG Extension Abzug Kassenanteil in Prozent"
* insert Meta
* ^context.type = #element
* ^context.expression = "Invoice.totalPriceComponent"
* value[x] only Quantity
* valueQuantity
  * unit 1..
  * unit = "%"
  * code 1..
  * code = #%
  * system 1..
  * system = "http://unitsofmeasure.org"