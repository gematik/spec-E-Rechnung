Instance: ERGPKVOperationDiscard
InstanceOf: OperationDefinition
Usage: #example
Title: "erechnung-discard"
Description: "Rechnungsentwurf verwerfen"
* url = "https://gematik.de/fhir/ergpkv/OperationDefinition/Discard"
* status = #draft
* kind = #operation
* name = "ERechnung_Discard"
* code = #erechnung-discard
* resource = #Invoice
* system = false
* type = true
* instance = false
* affectsState = true
* comment = "Test Comment"
* parameter[+]
  * name = #rechnungstoken
  * use = #in
  * min = 1
  * max = "1"
  * documentation = "Rechnungstoken zur eindeutigen Identifizierung der Rechnung"
  * type = #Identifier

Profile: ERGPKVRParametersDiscardInput
Parent: Parameters
Id: ergpkv-discardinput-parameter
Title: "DiscardInput"
Description: "Profil zur Validierung der Input-Parameter für $erechnung-discard"
* parameter 1..1 MS
  * ^slicing.discriminator.type = #value
  * ^slicing.discriminator.path = "name"
  * ^slicing.rules = #closed
* parameter contains token 1..1 MS
* parameter[token]
  * name MS
  * name = "token"
  * value[x] only Identifier
  * valueIdentifier 1..1 MS
    * type 1.. MS
    * type = http://terminology.hl7.org/CodeSystem/v2-0203#RI
    * system 1.. MS
    * system = #https://gematik.de/fhir/sid/ergpkv-token
    * value 1.. MS
  * resource 0..0
  * part 0..0

Instance: ERGPKVDiscardInvoice
InstanceOf: ERGPKVRParametersDiscardInput
Usage: #example
* parameter[token]
  * valueIdentifier
    * system = "https://gematik.de/fhir/sid/ergpkv-token"
    * value = "<rechnungstoken>"