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
  ERGBehandlungsart named Benhandlungsart 1..1 MS
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
  * ^comment = "Der Behandlungszeitraum SOLL vorhanden sein."
  * valuePeriod MS
    * start MS
      * ^short = "Startdatum"
    * end MS
      * ^short = "Enddatum"
* extension[Benhandlungsart]
  * ^short = "Behandlungsart"
  * ^comment = "Die Behandlungsart MUSS vorhanden sein."
  * valueCoding 1..1 MS
    * system 1.. MS
    * code 1.. MS
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
  AusrichtungDerRechnung 0..1 MS
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

// ---- Nicht überarbeitet---
* status MS
* status = http://hl7.org/fhir/invoice-status#issued
* participant 0.. MS
* participant.role MS
* participant.role from ERGParticipantRoleVS
* participant ^slicing.discriminator.type = #pattern
* participant ^slicing.discriminator.path = "role"
* participant ^slicing.rules = #open
* participant contains leistungserbringer ..* MS and forderungsinhaber ..* MS
* participant[leistungserbringer]
  * role = ERGParticipantRoleCS#leistungserbringer
  * actor only Reference(Practitioner or Organization)
    * identifier MS
    * identifier only IdentifierIknr or IdentifierTelematikId
* participant[forderungsinhaber]
  * role MS
  * role = ERGParticipantRoleCS#forderungsinhaber
  * actor only Reference(Practitioner or Organization)
    * identifier MS
    * identifier only IdentifierIknr or IdentifierTelematikId
* recipient 1.. MS
  * ^short = "Rechnungsempfänger"
  * ^comment = "Das System des Leistungserbringers referenziert hier üblicherweise 
  auf die lokale Instanz des Patienten um die Rechnung einer Patientenakte zuzuordnen. 
  Der Fachdienst substitutiert den Link mit der Referenz auf das Postfach des Patienten 
  bei der Extraktion der Invoice aus dem Bundle. Die Angabe der Versichertennummer dient 
  der Plausibilisierung. Die KV-Nummer in der Instanz des Bundles muss daher mit der 
  KV-Nummer übereinstimmen, die im Fachdienst für das Postfach des Rechnungsempfängers hinterlegt ist. "
* recipient only Reference(Patient)
  * identifier 1.. MS
  * identifier only IdentifierKvid10
  * display 1.. MS
* subject 1..1 MS
  * reference 1..1 MS
  * ^short = "Behandelte Person"
  * display 1..1 MS
    * ^short = "Name der behandelten Person"
    * ^comment = "Der Name der behandelten Person muss angegeben werden und kann vom Namen des Rechnungsempfängers abweichen, z.B. wenn Eltern Rechnungen für ihre Kinder erhalten."

* issuer 1.. MS
  * ^short = "Leistungserbringer"
  * ^comment = "Der Leistungserbringer kann vom einreichenden Benutzer 
      der Rechnung (z.B. Abrechnungsdiesntleister) abweichen"
  * identifier 1.. MS
    * ^short =  "Telematik-ID des Leistungserbrigners"
  * identifier only IdentifierTelematikId
  * display 1.. MS
    * ^short = "Name des Leistungserbringers"
* lineItem MS
  * ^short = "Rechnungspositionen"
* lineItem.chargeItem[x] only Reference
* lineItem.chargeItemReference MS
* totalPriceComponent MS
* totalPriceComponent ^slicing.discriminator.type = #pattern
* totalPriceComponent ^slicing.discriminator.path = "code"
* totalPriceComponent ^slicing.rules = #open
* totalPriceComponent contains tax 0..1 MS // ToDo: Constraint for totalPriceComponent dependant on .type?
* totalPriceComponent[tax]
  * ^short = "Steuersatz und -Betrag"
  * type = #tax
  * factor 1..1 MS // Constraint 19% or 7%
  * amount 1..1 MS 
* totalNet MS
  * ^short = "Nettobetrag der Rechnungssumme"
* totalGross MS
  * ^short = "Bruttobetrag der Rechnungssumme"
* paymentTerms.extension contains ERGZahlungsziel named zahlungsziel 1..1 MS


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
* valueCoding from $EncounterClassDe

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