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

Instance: ERGPKVRechnungsworkflowCanReceiveInvoiceResponse
InstanceOf: Parameters
Usage: #example
* parameter[0].name = "outcome"
* parameter[=].resource = ERGPKVRechnungsworkflowCanReceiveInvoiceResponseOutcome
* parameter[+].name = "patient"
* parameter[=].resource = ERGPKVRechnungsworkflowCanReceiveInvoiceResponsePatient

Instance: ERGPKVRechnungsworkflowCanReceiveInvoiceResponseOutcome
InstanceOf: OperationOutcome
Usage: #example
* issue
  * severity = #information
  * code = #informational
  * details = http://hl7.org/fhir/issue-type#success

Instance: ERGPKVRechnungsworkflowCanReceiveInvoiceResponsePatient
InstanceOf: Patient
Usage: #example
* name
  * text = "Erika Musterfrau"
* identifier
  * type = http://fhir.de/CodeSystem/identifier-type-de-basis#gkv
  * system = "http://fhir.de/sid/gkv/kvid-10"
  * value = "<KVNR>"
* address
  * text = "Musterweg 2, 3. Etage, 98764 Musterhausen, DE"

Instance: ERGPKVRechnungsworkflowCanReceiveInvoiceResponseError
InstanceOf: Parameters
Usage: #example
* parameter[0].name = "outcome"
* parameter[=].resource = ERGPKVRechnungsworkflowCanReceiveInvoiceResponseOutcomeError

Instance: ERGPKVRechnungsworkflowCanReceiveInvoiceResponseOutcomeError
InstanceOf: OperationOutcome
Usage: #example
* issue
  * severity = #information
  * code = #informational
  * diagnostics = "Für die Benutzer:in mit der KV-Nummer <KNVR> liegt keine Einwilligung für die Verwendung von E-Rechnungen vor oder ein dazugehöriger Account konnte nicht gefunden werden."   
