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