Profile: ERGPKVRechnungsworkflow
Title: "ERGPKV Rechnungsworkflow"
Parent: Task
Id: ergpkv-rechnungsworkflow
* extension contains http://hl7.org/fhir/5.0/StructureDefinition/extension-Task.requestedPerformer named rechnungsempfaenger 1..1 MS
  * ^short = "Rechnungsempfänger:in"
  * ^comment = "Rechnungsempfänger:in oder Patient:in. Diese Person ist die Rechnungsempfänger:in und damit für die Handhabung der Rechnung zuständig."
* status MS
  * ^short = "Taskstatus ( ready | completed )"
  * ^comment = "Sobald eine Rechnung versendet wird durch die Leistungserbringer:in wird ein neuer Rechnungsworkflow angelegt. Vorläufige Rechnungen können nicht angelegt werden. Sobald die Rechnung durch die Rechnungsempfänger:in in die EPA oder die persönliche Ablage verschoben wird, kann der Task als abgeschlossen gekennzeichnet werden."
* status from https://gematik.de/fhir/ergpkv/ValueSet/ergpkv-rechnungsworkflow-status-vs (required)
* identifier 1.. MS
* identifier 
  * ^slicing.discriminator.type = #pattern
  * ^slicing.discriminator.path = "type"
  * ^slicing.rules = #open
* identifier contains token 1..1 MS
* identifier[token]
  * ^short = "Zugriffstoken"
  * ^comment = "Zufällig durch den Fachdienst generiertes Token zu eindeutigen Identifizierung einer E-Rechnung."
  * type 1.. MS
  * type = http://terminology.hl7.org/CodeSystem/v2-0203#RI
  * system 1.. MS
  * system = "https://gematik.de/fhir/sid/ergpkv-token"
  * value 1.. MS
* businessStatus 1.. MS
  * ^short = "Workflowstatus"
  * ^comment = "Eine Rechnung kann zunächst durch das PVS der Leistungserbringer:in geprüft werden. Sobald eine Rechnung final übermittel wurde, erhält der Rechnungsworkflow den Status \"Neu\". Nach dem ersten Abruf einer Rechnung durch den Rechnungsempfänger wechselt der Status auf \"Offen\". Zudem wird der Status durch den Fachdienst erneut angepasst sobald die Rechnung oder ein Teil der Rechnung bei einem Kostenträger eingereicht wurde. Eine Rechnung kann manuell durch die Rechnungsempfänger:in als \"Erledigt\" gekennzeichnet werden (vgl. Task.status)."
* businessStatus from https://gematik.de/fhir/ergpkv/ValueSet/ergpkv-rechnungsworkflow-businessStatus-vs (required)
* intent MS
  * ^short = "fix: order"
  * ^comment = "Der Rechnungsworkflow wird als \"order\" gekennzeichnet, da die Leistungserbinger die Begleichung der Rechnung erwartet."
* intent = http://hl7.org/fhir/request-intent#order
* code 1.. MS
  * ^short = "fix: rechnungsworkflow"
  * ^comment = "Der Fachdienst muss zwischen einem Rechnungsworkflow und einem Einreichungsworkflow unterscheiden."
* code = https://gematik.de/fhir/ergpkv/CodeSystem/ergpkv-workflow-cs#rechnungsworkflow
* requester only Reference(Organization or Practitioner)
  * ^short = "Leistungserbringer"
  * ^comment = "Die Leistungserbringer:in wird eindeutig identifiziert durch eine Telematik-ID, diese kann entweder eine persönliche Telematik-ID sein (per HBA) oder für die geamte Organisation gelten (per SMC-B)."
* requester 1.. MS
  * identifier 1.. MS  
    * ^short = "Telematik-ID des Leistungserbringers"
  * identifier only IdentifierTelematikId
  // No focus element, all inputs are equally important 
* input MS
  * ^short = "Eingereichte Rechnung/Dokumente"
  * ^slicing.discriminator.type = #pattern
  * ^slicing.discriminator.path = "type"
  * ^slicing.rules = #open
* input contains sonstigeDokumente 0..* MS and originalRechnung 1..1 MS and rechnung 1..1 MS and rechnungsposition 1..* MS and rechnungsdokument 1..1 MS
* input[originalRechnung]
  * ^short = "Original-Rechnung"
  * ^comment = "Enthält die signierte Rechnung inkl. Rechnungsdetails, Rechnungspositionen, sowie PDF-Repräsentation. Der Fachdienst übernimmt die Rechnung ohne Veränderung aus dem System der Leistungserbringer:in."
  * type MS
  * type from https://gematik.de/fhir/ergpkv/CodeSystem/ergpkv-rechnungsworkflow-inputtype-cs (required)
  * type = https://gematik.de/fhir/ergpkv/CodeSystem/ergpkv-rechnungsworkflow-inputtype-cs#originalRechnung
  * value[x] only Reference(Bundle)
  * valueReference 1..1 MS
    * reference 1..1 MS
* input[rechnung]
  *  ^comment = "Der Fachdienst extrahiert die Rechnung um diese einzeln auffindbar zu machen."
  * type MS
  * type from https://gematik.de/fhir/ergpkv/CodeSystem/ergpkv-rechnungsworkflow-inputtype-cs (required)
  * type = https://gematik.de/fhir/ergpkv/CodeSystem/ergpkv-rechnungsworkflow-inputtype-cs#rechnung
  * value[x] only Reference(Invoice)
  * valueReference 1..1 MS
    * reference 1..1 MS
* input[rechnungsposition]
  * ^short = "Einzelpositionen der Rechnung"
  * ^comment = "Der Fachdienst extrahiert die Rechnungspositionen um diese einzeln auffindbar zu machen."
  * type MS
  * type from https://gematik.de/fhir/ergpkv/CodeSystem/ergpkv-rechnungsworkflow-inputtype-cs (required)
  * type = https://gematik.de/fhir/ergpkv/CodeSystem/ergpkv-rechnungsworkflow-inputtype-cs#rechnungsposition
  * value[x] only Reference(ChargeItem)
  * valueReference 1..1 MS
    * reference 1..1 MS
* input[rechnungsdokument]
  * ^short = "Rechnungsdokument (PDF)"
  * ^comment = "Der Fachdienst extrahiert die PDF-Repräsentation der Rechnung um diese einzeln auffindbar zu machen."
  * type MS
  * type from https://gematik.de/fhir/ergpkv/CodeSystem/ergpkv-rechnungsworkflow-inputtype-cs (required)
  * type = https://gematik.de/fhir/ergpkv/CodeSystem/ergpkv-rechnungsworkflow-inputtype-cs#rechnungsposition
  * value[x] only Reference(Binary)
  * valueReference 1..1 MS
    * reference 1..1 MS
* input[sonstigeDokumente]
  * ^short = "Sonstige Dokumente"
  * ^comment = "Der Fachdienst extrahiert die Rechnungsanhänge der Rechnung um diese einzeln auffindbar zu machen."
  * type MS
  * type from https://gematik.de/fhir/ergpkv/CodeSystem/ergpkv-rechnungsworkflow-inputtype-cs (required)
  * type = https://gematik.de/fhir/ergpkv/CodeSystem/ergpkv-rechnungsworkflow-inputtype-cs#sonstigeDokumente
  * value[x] only Reference(DocumentReference)
  * valueReference 1..1 MS
    * reference 1..1 MS
* output MS
  * ^slicing.discriminator.type = #pattern
  * ^slicing.discriminator.path = "type"
  * ^slicing.rules = #open
* output contains tokenPdf 1..1
* output[tokenPdf]
  * ^short = "Mit Token-Barcode versehenes PDF der Rechnung"
  * ^comment = "Eine PDF-Version der Rechnung inkl. aufgedrucktem Rechnungstoken muss immer durch den Fachdienst erstell werden und sollte als präferierte Variante an die Rehnungsempfänger:in, die Leistungserbringer:in oder den Kostenträger herausgegeben werden."
  * type MS
  * type from https://gematik.de/fhir/ergpkv/CodeSystem/ergpkv-rechnungsworkflow-outputtype-cs (required)
  * type = https://gematik.de/fhir/ergpkv/CodeSystem/ergpkv-rechnungsworkflow-outputtype-cs#tokenPdf
  * value[x] only Reference(Binary)
  * valueReference 1..1 MS
    * reference 1..1 MS

Instance: ERGPKVRechnungsworkflowExample
InstanceOf: ERGPKVRechnungsworkflow
Usage: #example
* extension[rechnungsempfaenger]
  * valueReference
    * identifier.value = "<kvid>"
* status = #ready
* identifier[token].value = "<token>"
* businessStatus = https://gematik.de/fhir/ergpkv/CodeSystem/ergpkv-rechnungsworkflow-businessStatus-cs#neu
* requester.identifier.value = "<telematik id>"
* input[originalRechnung].valueReference.reference = "Bundle/originalRechnung"
* input[rechnung].valueReference.reference = "Invoice/rechnung"
* input[rechnungsposition].valueReference.reference = "ChargeItem/rechnungsposition"
* input[rechnungsdokument].valueReference.reference = "Binary/rechnungsdokument"
* output[tokenPdf].valueReference.reference = "Binary/tokenPdf"
