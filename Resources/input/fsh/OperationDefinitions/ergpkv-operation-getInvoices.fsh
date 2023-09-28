// ------------- OperationDefinition -------------

Instance: ERGPKVOperationGetInvoices
InstanceOf: OperationDefinition
Usage: #example
Title: "ERGPKV Operation erechnung-getInvoices"
Description: "Abrufen von E-Rechnungen – Übersicht"
* url = "https://gematik.de/fhir/ergpkv/OperationDefinition/GetInvoices"
* status = #draft
* kind = #operation
* name = "ERechnung_GetInvoices"
* code = #erechnung-getInvoices
* resource = #Patient
* system = false
* type = false
* instance = true
* affectsState = false
* parameter[+]
  * name = #start
  * use = #in
  * min = 0
  * max = "1"
  * documentation = "Rechnungsdatums ab dem die Rechnungen abgerufen werden sollen."
  * type = #date
* parameter[+]
  * name = #end
  * use = #in
  * min = 0
  * max = "1"
  * documentation = "Rechnungsdatums bis zu dem die Rechnungen abgerufen werden sollen."
  * type = #date
* parameter[+]
  * name = #readStatus
  * use = #in
  * min = 0
  * max = "1"
  * documentation = "Angabe des Status der Rechnungen die abgerufen werden sollen."
  * type = #code
  * binding
    * strength = #required
    * valueSet = Canonical(ERGPKVGetInvoicesReadStatusVS)
* parameter[+]
  * name = #_count
  * use = #in
  * min = 0
  * max = "1"
  * documentation = "Angabe der Größe der Bundle-Seite, zur Steuerung des Pagings."
  * type = #integer