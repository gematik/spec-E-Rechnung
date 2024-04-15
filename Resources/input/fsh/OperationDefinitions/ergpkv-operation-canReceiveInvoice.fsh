// ------------- OperationDefinition -------------

Instance: ERGPKVOperationCanReceiveInvoice
InstanceOf: OperationDefinition
Usage: #example
Title: "ERGPKV Operation erechnung-canReceiveInvoice"
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
* outputProfile = Canonical(https://gematik.de/fhir/ergpkv/StructureDefinition/ergpkv-canreceiveinvoice-outputparameter)
* parameter[+]
  * name = #kvnr
  * use = #in
  * min = 1
  * max = "1"
  * documentation = "KVNR der Rechnungsempfänger:in"
  * type = #string
* parameter[+]
  * name = #displayname
  * use = #in
  * min = 1
  * max = "1"
  * documentation = "Vollständiger Displayname der Rechnungsempfänger:in. Zur Plausibilitätsprüfung."
  * type = #string
* parameter[+]
  * name = #rechnungsempfaenger
  * use = #out
  * min = 0
  * max = "1"
  * documentation = "Referenz auf die Patient-Instanz im Fachdienst welche die versichterten Person repräsentiert."
  * type = #Reference
  * targetProfile = Canonical(Patient)
* parameter[+]
  * name = #rechnungsempfaenger
  * use = #out
  * min = 0
  * max = "*"
  * documentation = "Referenz auf die Patient-Instanz im Fachdienst welche die Rechnungsempfänger:in repräsentiert."
  * type = #Reference
  * targetProfile = Canonical(Patient)

// ------------- Input Parameter -------------

Profile: ERGPKVRParametersCanReceiveInvoiceInput
Parent: Parameters
Id: ergpkv-canreceiveinvoice-inputparameter
Title: "ERGPKV CanReceiveInvoice Input-Parameter"
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
  * valueString = "<KVNR>"
* parameter[displayname]
  * valueString = "Leon Mustermann"

// ------------- Output Parameter -------------

Profile: ERGPKVRParametersCanReceiveInvoiceOutput
Parent: Parameters
Id: ergpkv-canreceiveinvoice-outputparameter
Title: "ERGPKV CanReceiveInvoice Output-Parameter"
Description: "Profil zur Validierung der Output-Parameter für $erechnung-canReceiveInvoice"
* parameter 1..* MS
  * ^slicing.discriminator.type = #value
  * ^slicing.discriminator.path = "name"
  * ^slicing.rules = #closed
* parameter contains rechnungsempfaenger 1..* MS 
    and versichertePerson 1..1 MS
* parameter[rechnungsempfaenger]
  * name MS
  * name = "rechnungsempfaenger"
  * value[x] 0..0
  * resource 1..1 MS 
  * resource only ERGPKVersichertePerson
  * part 0..0
* parameter[versichertePerson]
  * name MS
  * name = "versichertePerson"
  * value[x] 0..0
  * resource 1..1 MS 
  * resource only ERGPKVersichertePerson
  * part 0..0

// ------------- Output Parameter (Error) -------------

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
