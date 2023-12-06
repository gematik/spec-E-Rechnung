Profile: ERGPKVRechnungsworkflow
Title: "ERGPKV Rechnungsworkflow"
Parent: Task
Description: "Diese Task-Ressource wird vom Fachdienst angelegt 
und beschreibt den Vorgang des Einstellens 
einer Rechnung in das Postfach eines Patienten bzw. Rechnungsempfängers.
Sie kann als &quot;Kuvert&quot; interpretiert werden, in dem ein 
Leistungserbringer Rechnungen und assoziierte Dokumente aggregiert 
und im Postfach eines Patienten bzw. Rechnungsempfängers bereitstellt."
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
  * ^short = "Rechnungstoken"
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
  * ^comment = "Die Leistungserbringer:in wird eindeutig identifiziert durch eine Telematik-ID, diese kann entweder eine persönliche Telematik-ID sein (per HBA) oder für die geamte Organisation gelten (per SMC-B). Es kann zudem der Fall eintreten, dass die Rechnung durch einen Abrechnungsdienstleister versendet wird. Hierbei zeigt die Telematik-ID auf die einreichende Organisation und nicht auf die Leistungserbringer:in."
* requester 1.. MS
  * identifier 1.. MS  
    * ^short = "Telematik-ID des Leistungserbringers bzw. der einreichenden Organisation"
  * identifier only IdentifierTelematikId
* input MS
  * ^short = "Eingereichte Rechnung/Dokumente"
  * ^slicing.discriminator.type = #pattern
  * ^slicing.discriminator.path = "type"
  * ^slicing.rules = #open
* input contains originalRechnung 1..1 MS
* input[originalRechnung]
  * ^short = "Original-Rechnung"
  * ^comment = "Das Bundle enthält die signierte Rechnung inkl. Rechnungsdetails (Invoice), 
  Rechnungspositionen(ChargeItems), sowie PDF-Repräsentation (Binary/PDF). 
  Der Fachdienst persistiert dieses Bundle unverändert."
  * type MS
  * type from https://gematik.de/fhir/ergpkv/CodeSystem/ergpkv-rechnungsworkflow-inputtype-cs (required)
  * type = https://gematik.de/fhir/ergpkv/CodeSystem/ergpkv-rechnungsworkflow-inputtype-cs#originalRechnung
  * value[x] only Reference(Bundle)
  * valueReference 1..1 MS
    * reference 1..1 MS
* output MS
  * ^slicing.discriminator.type = #pattern
  * ^slicing.discriminator.path = "type"
  * ^slicing.rules = #open
* output contains tokenPdf 1..1 
    and sonstigesDokument 0..* MS 
    and rechnung 1..1 MS 
    and rechnungsposition 1..* MS
* output[tokenPdf]
  * ^short = "Vom Fachdienst mit Token-Barcode versehenes PDF der Rechnung"
  * ^comment = "Wenn das Rechnungs-PDF beim Leistungserbringer ausgedruckt 
  oder auf andere Art und Weise weitergegeben wird, so muss sichergestellt sein, dass 
  die mit dem Token-Barcode versehene Version des PDFs verwendet wird. Dadurch ist sichergestellt,
  dass das Dokument stets der im Postfach eingestellen Rechnung zugeordnet werden kann 
  und Doppelerfassungen/-einrichungen vermieden werden. Der Fachdienst übernimmt die Aufgabe, 
  das vom Leistungserbringer eingereichte PDF mit dem Token-Barcode zu versehen und gibt das 
  entsprechend markierte Dokument an das System des Leistungserbringers zurück. Dies erfolgt über eine DocumentReference-Ressource die auf das Binary mit dem PDF referenziert."
  * type MS
  * type from https://gematik.de/fhir/ergpkv/CodeSystem/ergpkv-rechnungsworkflow-outputtype-cs (required)
  * type = https://gematik.de/fhir/ergpkv/CodeSystem/ergpkv-rechnungsworkflow-outputtype-cs#tokenPdf
  * value[x] only Reference(DocumentReference)
  * valueReference 1..1 MS
    * reference 1..1 MS
* output[rechnung]
  *  ^comment = "Der Fachdienst extrahiert die Rechnung um diese einzeln auffindbar zu machen."
  * type MS
  * type from https://gematik.de/fhir/ergpkv/CodeSystem/ergpkv-rechnungsworkflow-outputtype-cs (required)
  * type = https://gematik.de/fhir/ergpkv/CodeSystem/ergpkv-rechnungsworkflow-outputtype-cs#rechnung
  * value[x] only Reference(Invoice)
  * valueReference 1..1 MS
    * reference 1..1 MS
* output[rechnungsposition]
  * ^short = "Einzelpositionen der Rechnung"
  * ^comment = "Der Fachdienst extrahiert die Rechnungspositionen um diese einzeln auffindbar zu machen."
  * type MS
  * type from https://gematik.de/fhir/ergpkv/CodeSystem/ergpkv-rechnungsworkflow-outputtype-cs (required)
  * type = https://gematik.de/fhir/ergpkv/CodeSystem/ergpkv-rechnungsworkflow-outputtype-cs#rechnungsposition
  * value[x] only Reference(ChargeItem)
  * valueReference 1..1 MS
    * reference 1..1 MS
* output[sonstigesDokument]
  * ^short = "Sonstiges Dokument"
  * ^comment = "Der Fachdienst extrahiert die zusammen mit der Rechnung eingereichten Dokumente um diese einzeln auffindbar zu machen."
  * type MS
  * type from https://gematik.de/fhir/ergpkv/CodeSystem/ergpkv-rechnungsworkflow-outputtype-cs (required)
  * type = https://gematik.de/fhir/ergpkv/CodeSystem/ergpkv-rechnungsworkflow-outputtype-cs#sonstigeDokumente
  * value[x] only Reference(DocumentReference)
  * valueReference 1..1 MS
    * reference 1..1 MS

Instance: ERGPKVRechnungsworkflowExample
InstanceOf: ERGPKVRechnungsworkflow
Usage: #example
* extension[rechnungsempfaenger]
  * valueReference
    * reference = "Patient/rechnungsempfaenger"
    * identifier.value = "<kvid>"
* status = #ready
* identifier[token].value = "<token>"
* businessStatus = https://gematik.de/fhir/ergpkv/CodeSystem/ergpkv-rechnungsworkflow-businessStatus-cs#neu
* requester.identifier.value = "<telematik id>"
* input[originalRechnung].valueReference.reference = "Bundle/originalRechnung"
* output[rechnung].valueReference.reference = "Invoice/rechnung"
* output[rechnungsposition].valueReference.reference = "ChargeItem/rechnungsposition"
* output[tokenPdf].valueReference.reference = "Binary/tokenPdf"


