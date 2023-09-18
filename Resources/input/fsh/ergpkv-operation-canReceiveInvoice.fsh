Instance: ERGPKVOperationCanReceiveInvoice
InstanceOf: OperationDefinition
Usage: #example
Title: "ERechnung-canReceiveInvoice"
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
* inputProfile = Canonical(https://gematik.de/fhir/ergpkv/StructureDefinition/ergpkv-canreceiveinvoice-inputparameter)
* parameter[+]
  * name = #kvnr
  * use = #in
  * min = 1
  * max = "1"
  * documentation = "KVNR der Rechnungsempfänger:in"
  * type = #string
* parameter[+]
  * name = #name
  * use = #in
  * min = 1
  * max = "1"
  * documentation = "Vollständiger Displayname der Rechnungsempfänger:in. Zur Plausibilitätsprüfung."
  * type = #string

Profile: ERGPKVRParametersCanReceiveInvoiceInput
Parent: Parameters
Id: ergpkv-canreceiveinvoice-inputparameter
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
  * value[x] only string
  * valueString 1..1 MS
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
  * valueString = "G995030567"
* parameter[displayname]
  * valueString = "Erika Mustermann"

Instance: ERGPKVRechnungsworkflowCanReceiveInvoiceResponsePatient
InstanceOf: Patient
Usage: #example
* name
  * given = "Erika"
  * family = "Musterfrau"
  * text = "Erika Musterfrau"
* identifier
  * type = http://fhir.de/CodeSystem/identifier-type-de-basis#gkv
  * system = "http://fhir.de/sid/gkv/kvid-10"
  * value = "<KVNR>"
* address
  * text = "Musterweg 2, 3. Etage, 98764 Musterhausen, DE"

Profile: ERGPKVCanReceiveInvoiceResponsePatient
Title: "ERGPKV CanReceiveInvoice Response Patient"
Parent: Patient
Id: ergpkv-canreceiveinvoiceresponsepatient
* id 1..1 MS
* gender 1.. MS
* identifier MS
  * ^slicing.discriminator.type = #pattern
  * ^slicing.discriminator.path = "$this"
  * ^slicing.rules = #open
* identifier contains
    VersichertenId-GKV 0..1 MS
* identifier[VersichertenId-GKV] only IdentifierKvid10
  * ^patternIdentifier.type = http://fhir.de/CodeSystem/identifier-type-de-basis#GKV
  * type 1.. MS
  * system MS
  * value MS
* name.text 1.. MS
* address.text 1.. MS


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
