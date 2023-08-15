Instance: ERGPKVOperationCanReceiveInvoice
InstanceOf: OperationDefinition
Usage: #example
Title: "erechnung-canReceiveInvoice"
Description: "Abfrage der Einwilligung der Rechnungsempfänger:in für die Zustellung einer E-Rechnung"
* url = "https://gematik.de/fhir/ergpkv/OperationDefinition/CanReceiveInvoice"
* status = #draft
* kind = #operation
* name = "ERechnung_CanReceiveInvoice"
* code = #erechnung-canReceiveInvoice
* resource = #Patient
* system = false
* type = true
* instance = false
* affectsState = false
* comment = "Test Comment"
* inputProfile = Canonical(https://gematik.de/fhir/ergpkv/StructureDefinition/ergpkv-canreceiveinvoiceinput-parameter)
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
  * documentation = "Vollständiger Displayname der Rechnungsempfänger:in. Zur Plausibilitätsprüfung."
  * type = #string

Profile: ERGPKVRParametersCanReceiveInvoiceInput
Parent: Parameters
Id: ergpkv-canreceiveinvoiceinput-parameter
Title: "CanReceiveInvoiceInput"
Description: "Profil zur Validierung der Input-Parameter für $erechnung-canReceiveInvoice"
* parameter 2..2 MS
  * ^slicing.discriminator.type = #value
  * ^slicing.discriminator.path = "name"
  * ^slicing.rules = #closed
* parameter contains kvnr 1..1 MS 
    and displayname 1..1 MS
* parameter[kvnr]
  * name MS
  * name = "kvnr"
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

Instance: ERGPKVInvokeCanReceiveInvoice
InstanceOf: ERGPKVRParametersCanReceiveInvoiceInput
Usage: #example
* parameter[kvnr]
  * valueIdentifier
    * type = http://fhir.de/CodeSystem/identifier-type-de-basis#GKV
    * system = "http://fhir.de/sid/gkv/kvid-10"
    * value = "G995030567"
* parameter[displayname]
  * valueString = "Erika Mustermann"  
