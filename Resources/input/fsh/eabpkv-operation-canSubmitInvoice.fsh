Instance: EABPKVOperationCanSubmitInvoice
InstanceOf: OperationDefinition
Usage: #example
Title: "erechnung-canSubmitInvoice"
Description: "Abfrage der Einwilligung der Rechnungsempfänger:in für die Zustellung einer E-Rechnung"
* url = "https://gematik.de/fhir/eabpkv/OperationDefinition/CanSubmitInvoice"
* status = #draft
* kind = #operation
* name = "ERechnung_CanSubmitInvoice"
* code = #erechnung-canSubmitInvoice
* resource = #Patient
* system = false
* type = true
* instance = false
* affectsState = false
* comment = "Test Comment"
* parameter[+]
  * name = #kvnr
  * use = #in
  * min = 1
  * max = "1"
  * documentation = "KVNR der Rechnungsempfänger:in"
  * type = #Identifier
* parameter[+]
  * name = #name
  * use = #in
  * min = 1
  * max = "1"
  * documentation = "Vollständiger Displayname der Rechnungsempfänger:in"
  * type = #string

Profile: CanSubmitInvoiceInput
Parent: Parameters
Id: eabpkv-cansubmitinvoiceinput-parameter
Title: "CanSubmitInvoiceInput"
Description: "Profil zur Validierung der Input-Parameter für $erechnung-canSubmitInvoice"
* parameter 2..* MS
  * ^slicing.discriminator.type = #value
  * ^slicing.discriminator.path = "name"
  * ^slicing.rules = #open
* parameter contains iknr 1..1 MS 
    and displayname 1..1 MS
* parameter[iknr]
  * name MS
  * name = "iknr"
  * value[x] only Identifier
  * valueIdentifier 1..1 MS
  * valueIdentifier only IdentifierKvid10 or IdentifierPkvVersichertenId10
  * resource 0..0
  * part 0..0
* parameter[displayname]
  * name MS
  * name = "displayname"
  * value[x] only string
  * valueString 1..1 MS
  * resource 0..0
  * part 0..0
