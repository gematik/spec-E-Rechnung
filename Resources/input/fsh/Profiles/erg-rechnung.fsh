Profile: ERGRechnung
Title: "ERG Rechnung"
Parent: Invoice
Id: erg-rechnung
* insert Meta
* extension contains 
  ERGPDFRepraesentationRechnung named pdf-repraesentation-rechnung 0..1 MS and
  ERGInvoicePeriod named period 0..1 MS and
  ERGBehandlungsart named Behandlungsart 0..1 MS and
  ERGAbrechnungsrelevanteDiagnose named AbrechnungsrelevanteDiagnose 0..* MS
* identifier 1.. MS
* identifier ^slicing.discriminator.type = #pattern
* identifier ^slicing.discriminator.path = "type"
* identifier ^slicing.rules = #open
* identifier contains rechnungsnummer 1..1
* identifier[rechnungsnummer]
  * ^short = "Vom System des Leistungserbringers vergebene Rechnungsnummer"
  * type 1.. MS
  * type = http://fhir.de/CodeSystem/identifier-type-de-basis#invoice
  * system 1.. MS
    * ^short = "Namensraum der Rechnungsnummern des Leistungeerbringers"
  * value 1.. MS
    * ^short = "Rechnungsnummer"
* type 1.. MS
* type = https://gematik.de/fhir/erg/CodeSystem/erg-rechnung-type-cs#erechnung
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
* date 1.. MS
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
* value[x] only Reference(Binary)

Extension: ERGZahlungsziel
Id: erg-zahlungsziel
Title: "ERG Zahlungsziel"
* value[x] only date

Extension: ERGBehandlungsart
Id: erg-behandlungsart
Title: "ERG Extension Behandlungsart"
* ^context.type = #element
* ^context.expression = "Invoice"
* value[x] only Coding
* valueCoding from ERGBehandlungsartVS

Extension: ERGAbrechnungsrelevanteDiagnose
Id: erg-abrechnungsrelevante-diagnose
Title: "ERG abrechnungsrelevante Diagnose"
* ^context.type = #element
* ^context.expression = "Invoice"
* value[x] only Reference
* valueReference only Reference(Condition)

CodeSystem: ERGBehandlungsartCS
Id: erg-behandlungsartCS
Title: "ERG Behandlungsart"
* #AMB "Ambulante Behandlung"

ValueSet: ERGBehandlungsartVS
Id: erg-behandlungsartVS
Title: "ERG Behandlungsart"
Description: "Diese Codes enthalten Behandlungsarten der eRechnung"
* include codes from system ERGBehandlungsartCS

CodeSystem: ERGParticipantRoleCS
Id: erg-participant-role-CS
Title: "ERG Teilnehmer Rolle"
* #leistungserbringer "Leistungserbringer"
* #forderungsinhaber "Forderungsinhaber"

ValueSet: ERGParticipantRoleVS
Id: erg-participant-role-VS
Title: "ERG Teilnehmer Rolle"
Description: "Diese Codes enthalten Teilnehmer Rollen der eRechnung"
* include codes from system ERGBehandlungsartCS