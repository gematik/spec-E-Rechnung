// ------------- OperationDefinition -------------

Instance: ERGPKVOperationSubmit
InstanceOf: OperationDefinition
Usage: #example
Title: "ERGPKV Operationerechnung-submit"
Description: "Rechnung einreichen durch die Leistungserbringer:in"
* url = "https://gematik.de/fhir/ergpkv/OperationDefinition/Submit"
* status = #draft
* kind = #operation
* name = "ERechnung_Submit"
* code = #erechnung-submit
* resource = #Patient
* system = false
* type = false
* instance = true
* affectsState = true
* inputProfile = Canonical(https://gematik.de/fhir/ergpkv/StructureDefinition/ergpkv-submit-inputparameter)
* outputProfile = Canonical(https://gematik.de/fhir/ergpkv/StructureDefinition/ergpkv-submit-outputparameter)
* parameter[+]
  * name = #rechnung
  * use = #in
  * min = 1
  * max = "1"
  * documentation = "Vollständige E-Rechnung inkl. Signatur"
  * type = #Bundle
* parameter[+]
  * name = #modus
  * use = #in
  * min = 0
  * max = "1"
  * documentation = "Verarbeitungshinweis für die E-Rechnung"
  * type = #code
* parameter[+]
  * name = #anhaenge
  * use = #in
  * min = 0
  * max = "1"
  * documentation = "Weitere Anhänge zur E-Rechnung"
  * type = #DocumentReference
* parameter[+]
  * name = #returnTokenPDF
  * use = #in
  * min = 0
  * max = "1"
  * documentation = "Indikation ob QR-Code-Token in das signierte PDF eingefügt werden soll"
  * type = #boolean
* parameter[+]
  * name = #token
  * use = #out
  * min = 1
  * max = "1"
  * documentation = "Token zur eineindeutigen Identifizierung der E-Rechnung (unabhängig von returnTokenPDF)"
  * type = #Identifier
* parameter[+]
  * name = #warnungen
  * use = #out
  * min = 0
  * max = "1"
  * documentation = "Warnhinweise zur Validierung der E-Rechnung. Werden nur im Modus \"Test\" und \"Force\" ausgegeben."
  * type = #OperationOutcome
* parameter[+]
  * name = #tokenPdf
  * use = #out
  * min = 0
  * max = "1"
  * documentation = "PDF mit eingebetteten Rechnungstoken, in Abhängigkeit vom returnTokenPDF-Parameter"
  * type = #Binary

// ------------- Input Parameter -------------

Profile: ERGPKVRParametersSubmitInput
Parent: Parameters
Id: ergpkv-submit-inputparameter
Title: "ERGPKV Submit Input-Parameter"
Description: "Profil zur Validierung der Input-Parameter für $erechnung-submit"
* parameter 0.. MS
  * ^slicing.discriminator.type = #value
  * ^slicing.discriminator.path = "name"
  * ^slicing.rules = #closed
* parameter contains returnTokenPdf 0..1 MS and anhaenge 0..1 MS and modus 0..1 MS and rechnung 1..1 MS
* parameter[rechnung]
  * name MS
  * name = "rechnung"
  * value[x] 0..0
  * resource 1.. MS
  * resource only Bundle // ToDo: Profil erstellen um zu überprüfen, dass das Bundle self-contained ist (bis auf Reference auf Patient)
  * part 0..0
* parameter[modus]
  * name MS
  * name = "modus"
  * value[x] 1.. MS
  * value[x] only code
  * valueCode from ERGPKVRechnungSubmitModusVS (required)
  * resource 0..0
  * part 0..0
* parameter[anhaenge]
  * name MS
  * name = "anhaenge"
  * value[x] 0..0
  * resource 0..1 MS
  * resource only ERGPKVSonstigesDokument
  * part 0..0
* parameter[returnTokenPdf]
  * name MS
  * name = "returnTokenPdf"
  * value[x] MS
  * value[x] only boolean
  * resource 0..0
  * part 0..0

// ToDo: IG sollte beschreiben, dass das Profil keinen Constraint enthält zur Validierung ob was Bundle vollständig ist. Dies muss aufgrund der teilweise vorhandenen logischen Referenzen per Businesslogik im Fachdienst implementiert werden.
Profile: ERGPKVRechungscontainer
Title: "ERGPKV Rechnungscontainer"
Parent: Bundle
Id: ergpkv-rechnungscontainer
* type = #collection
* entry 3.. MS
  * ^slicing.discriminator.type = #type
  * ^slicing.discriminator.path = "resource"
  * ^slicing.rules = #closed
* entry contains invoice 1..1 MS and chargeItem 1.. MS and binary 1.. MS
* entry[invoice]
  * resource 1.. MS
  * resource only Invoice
* entry[chargeItem]
  * resource 1.. MS
  * resource only ChargeItem
* entry[binary]
  * resource 1.. MS
  * resource only Binary
* signature 1.. MS

// ------------- Output Parameter -------------

Profile: ERGPKVRParametersSubmitOutput
Parent: Parameters
Id: ergpkv-submit-outputparameter
Title: "ERGPKV Submit Output-Parameter"
Description: "Profil zur Validierung der Output-Parameter für $erechnung-submit"
* parameter 0.. MS
  * ^slicing.discriminator.type = #value
  * ^slicing.discriminator.path = "name"
  * ^slicing.rules = #closed
* parameter contains tokenPdf 0..1 MS and warnungen 0..1 MS and token 1..1 MS
* parameter[token]
  * name MS
  * name = "token"
  * value[x] 1..1 MS
  * valueIdentifier only IdentifierERechnungToken
  * resource 0..0
  * part 0..0
* parameter[warnungen]
  * name MS
  * name = "warnungen"
  * value[x] 0..0
  * resource 0..1 MS 
  * resource only OperationOutcome // ToDo: Dokumentation im IG wie diese OperationOutcome aufgebaut ist, da kein seperates Profil existiert
  * part 0..0
* parameter[tokenPdf]
  * name MS
  * name = "modus"
  * value[x] 0..0
  * resource 0..1 MS
  * resource only ERGPKVSonstigesDokument
  * part 0..0

// ------------- Terminology -------------

CodeSystem:  ERGPKVRechnungSubmitModusCS
Id: ergpkv-rechnung-submit-modus-cs
Title: "ERGPKV Rechnung Submit Modus CS"
Description:  "CodeSystem für die Differenzierung von der Verarbeitungsmodi für $erchnung-submit"
* #test "Test" "E-Rechnung wird als Test eingereicht. Der Fachdienst validiert nur die E-Rechnung und speichert diese nicht."
* #normal "Normal" "E-Rechnung wird durch den Fachdienst gespeichert falls keine semantischen Validierungsfehler vorhanden sind."
* #force "Force" "E-Rechnung wird durch den Fachdienst gespeichert auch falls nicht-kritische semantische Validierungsfehler vorhaden sind."

ValueSet:  ERGPKVRechnungSubmitModusVS
Id: ergpkv-rechnung-submit-modus-vs
Title: "ERGPKV Rechnung Type VS"
Description:  "ValueSet für die Differenzierung von der Verarbeitungsmodi für $erchnung-submit"
* include codes from system https://gematik.de/fhir/ergpkv/CodeSystem/ergpkv-rechnung-submit-modus-vs