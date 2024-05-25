Profile: ERGPKVRechnung
Title: "ERGPKV Rechnung"
Parent: Invoice
Id: ergpkv-rechnung
* extension contains 
  ERGPKVPDFRepraesentationRechnung named pdf-repraesentation-rechnung 0..1 MS and
  ERGPKVInvoicePeriod named period 0..1 MS and
  ERGPKVBehandlungsart named Behandlungsart 0..1 MS
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
* type = https://gematik.de/fhir/ergpkv/CodeSystem/ergpkv-rechnung-type-cs#erechnung
* type.extension contains
    ERGPKVGebuehrenordnung named Gebührenordnung ..1 MS
* status MS
* status = http://hl7.org/fhir/invoice-status#issued
* participant 0.. MS
* participant ^slicing.discriminator.type = #pattern
* participant ^slicing.discriminator.path = "role"
* participant ^slicing.rules = #open
* participant contains leistungserbringer 0..* MS
* participant[leistungserbringer]
  * role MS
  * role = http://snomed.info/sct#39607008
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
  * ^short = "Leistungsempfänger"
  * display 1..1 MS
    * ^short = "Name des Leistungsemfängers"
    * ^comment = "Der Name des Leistungeempfängers (behandelter Patient) muss angegeben werden 
    und kann vom Namen des Rechnungsempfängers abweichen, 
    z.B. wenn Eltern Rechnungen für ihre Kinder erhalten."
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
* paymentTerms.extension contains ERGPKVZahlungsziel named zahlungsziel 1..1 MS


Extension: ERGPKVPDFRepraesentationRechnung
Id: ergpkv-pdf-repraesentation-rechnung
Title: "ERGPKV PDF-Repräsentation Rechnung"
* value[x] only Reference(Binary)

Extension: ERGPKVZahlungsziel
Id: ergpkv-zahlungsziel
Title: "ERGPKV Zahlungsziel"
* value[x] only date

Extension: ERGPKVBehandlungsart
Id: ergpkv-behandlungsart
Title: "Extension Behandlungsart"
* ^context.type = #element
* ^context.expression = "Invoice"
* value[x] only Coding
* valueCoding from ERGPKVBehandlungsartVS

CodeSystem: ERGPKVBehandlungsartCS
Id: ergpkv-behandlungsartCS
Title: "Behandlungsart"
* #AMB "Ambulante Behandlung"

ValueSet: ERGPKVBehandlungsartVS
Id: ergpkv-behandlungsartVS
Title: "Behandlungsart"
Description: "Diese Codes enthalten Behandlungsarten der eRechnung PKV"
* include codes from system ERGPKVBehandlungsartCS

Extension: ERGPKVGebuehrenordnung
Id: ergpkv-gebuehrenordnung
Title: "Extension Gebührenordnung"
* ^context.type = #element
* ^context.expression = "Invoice.type"
* value[x] only Coding
* valueCoding from ERGPKVGebuehrenordnungenVS

CodeSystem: ERGPKVGebuehrenordnungenCS
Id: ergpkv-gebuehrenordnungenCS
Title: "Gebührenordnungen"
* #GOÄ "Gebührenordnung für Ärzte"
* #GOZ "Gebührenordnung für Zahnärzte"

ValueSet: ERGPKVGebuehrenordnungenVS
Id: ergpkv-gebuehrenordnungenVS
Title: "Gebührenordnungen"
Description: "Diese Codes enthalten Gebührenordnungen"
* include codes from system GebuehrenordnungenCS