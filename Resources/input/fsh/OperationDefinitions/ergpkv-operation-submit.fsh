// ------------- OperationDefinition -------------

Instance: ERGPKVOperationSubmit
InstanceOf: OperationDefinition
Usage: #example
Title: "ERGPKV Operation Erechnung-Submit"
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
* parameter[+]
  * name = #rechnung
  * use = #in
  * min = 1
  * max = "1"
  * documentation = "Vollständige E-Rechnung mit verschiedenen Attachments: 1) PDF 2) Strukturierte Daten und 3) Signatur."
  * type = #DocumentReference
* parameter[+]
  * name = #anhaenge
  * use = #in
  * min = 0
  * max = "*"
  * documentation = "Weitere Anhänge zur E-Rechnung als PDF."
  * type = #DocumentReference
* parameter[+]
  * name = #modus
  * use = #in
  * min = 0
  * max = "1"
  * documentation = "Verarbeitungshinweis für die E-Rechnung. Default: normal."
  * type = #code
  * binding
    * strength = #required
    * valueSet = "https://gematik.de/fhir/ergpkv/ValueSet/ergpkv-rechnung-submit-modus-vs"
* parameter[+]
  * name = #returnTokenPDF
  * use = #in
  * min = 0
  * max = "1"
  * documentation = "Indikation ob nur das durch den FD erstellte Rechnungstoken zurückgegeben werden soll oder das gesamte PDF inkl. QR-Code-Token. Default: false."
  * type = #boolean
* parameter[+]
  * name = #token
  * use = #out
  * min = 1
  * max = "*"
  * documentation = "Token(s) zur eineindeutigen Identifizierung der Rechnungsdokumente/-anhänge (unabhängig von returnTokenPDF)."
  * part[+]
    * name = #id
    * use = #out
    * min = 1
    * max = "*"
    * type = #id
    * documentation = "Randomisiertes Token zur Identifikation eines Dokumentes."
  * part[+]
    * name = #docRef
    * use = #out
    * min = 1
    * max = "*"
    * documentation = "Referenz auf die DocumentReference die durch das Token identifiziert wird."
    * type = #Reference
* parameter[+]
  * name = #warnungen
  * use = #out
  * min = 0
  * max = "1"
  * documentation = "Warnhinweise und Fehlern zur Validierung der E-Rechnung. Diese MÜSSEN in jedem Verarbeitungsmodus ausgegeben werden."
  * type = #OperationOutcome
* parameter[+]
  * name = #tokenPdf
  * use = #out
  * min = 0
  * max = "1"
  * documentation = "PDF mit eingebetteten Rechnungstoken als QR-Code, in Abhängigkeit vom returnTokenPDF-Parameter. Vgl. 4.1 Einreichung per Post des Feature-Dokumentes E-Rechnung."
  * type = #Binary

// ------------- Terminology -------------

CodeSystem:  ERGPKVRechnungSubmitModusCS
Id: ergpkv-rechnung-submit-modus-cs
Title: "ERGPKV Rechnung Submit Modus CS"
Description:  "CodeSystem für die Differenzierung von der Verarbeitungsmodi für $erchnung-submit"
* #test "Test" "E-Rechnung wird als Test eingereicht. Der Fachdienst validiert nur die E-Rechnung und speichert diese nicht."
* #normal "Normal" "E-Rechnung wird durch den Fachdienst gespeichert falls keine gravierenden Validierungsfehler vorhanden sind."

ValueSet:  ERGPKVRechnungSubmitModusVS
Id: ergpkv-rechnung-submit-modus-vs
Title: "ERGPKV Rechnung Type VS"
Description:  "ValueSet für die Differenzierung von der Verarbeitungsmodi für $erchnung-submit"
* include codes from system https://gematik.de/fhir/ergpkv/CodeSystem/ergpkv-rechnung-submit-modus-vs