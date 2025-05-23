// ------------- OperationDefinition -------------

Instance: DiPagOperationSubmit
InstanceOf: OperationDefinition
Usage: #example
Title: "Digitale Patientenrechnung Operation DiPag-Submit"
Description: "Rechnung einreichen durch die Leistungserbringer:in"
* url = "https://gematik.de/fhir/dipag/OperationDefinition/Submit"
* status = #active
* version = "1.0.0-CC"
* experimental = false
* date = "2024-06-20"
* kind = #operation
* name = "Digitale PatientenrechnungSubmit"
* code = #dipag-submit
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
  * documentation = "Vollständige Digitale Patientenrechnung mit verschiedenen Attachments: 1) Rechnungs-PDF 2) Strukturierte Daten OHNE Signatur."
  * type = #DocumentReference
* parameter[+]
  * name = #anhang
  * use = #in
  * min = 0
  * max = "*"
  * documentation = "Weitere Anhänge zur Digitale Patientenrechnung als PDF."
  * type = #DocumentReference
* parameter[+]
  * name = #modus
  * use = #in
  * min = 0
  * max = "1"
  * documentation = "Verarbeitungshinweis für die Digitale Patientenrechnung. Default: normal."
  * type = #code
  * binding
    * strength = #required
    * valueSet = "https://gematik.de/fhir/dipag/ValueSet/dipag-rechnung-submit-modus-vs"
* parameter[+]
  * name = #angereichertesPDF
  * use = #in
  * min = 0
  * max = "1"
  * documentation = "Indikation ob nur das durch den FD erstellte Dokumententoken zurückgegeben werden soll oder das gesamte PDF inkl. Dokumententoken. Default: false."
  * type = #boolean
* parameter[+]
  * name = #token
  * use = #out
  * min = 0
  * max = "*"
  * documentation = "Token(s) zur eineindeutigen Identifizierung der Rechnungsdokumente/-anhänge (unabhängig von returnTokenPDF). Dieser Parameter ist NUR optional falls modus = 'test'."
  * part[+]
    * name = #id
    * use = #out
    * min = 1
    * max = "1"
    * type = #id
    * documentation = "Randomisiertes Token zur Identifikation eines Dokumentes."
  * part[+]
    * name = #docRef
    * use = #out
    * min = 1
    * max = "1"
    * documentation = "Eindeutiger Identifikatior der Rechnung und Anhänge auf welche sich das Token bezieht."
    * type = #Identifier
  * part[+]
    * name = #angereichertesPDF
    * use = #out
    * min = 0
    * max = "1"
    * documentation = "PDF mit eingebetteten Token und strukturierten Daten, in Abhängigkeit vom angereichertesPDF-Parameter. Vgl. 4.1 Einreichung per Post des Feature-Dokumentes Digitale Patientenrechnung."
    * type = #Binary
* parameter[+]
  * name = #warnungen
  * use = #out
  * min = 0
  * max = "1"
  * documentation = "Warnhinweise und Fehlern zur Validierung der Digitale Patientenrechnung. Diese MÜSSEN in jedem Verarbeitungsmodus ausgegeben werden."
  * type = #OperationOutcome

// ------------- Terminology -------------

CodeSystem:  DiPagRechnungSubmitModusCS
Id: dipag-rechnung-submit-modus-cs
Title: "Digitale Patientenrechnung Rechnung Submit Modus CS"
Description:  "CodeSystem für die Differenzierung von der Verarbeitungsmodi für $erchnung-submit"
* insert Meta
* #test "Test" "Digitale Patientenrechnung wird als Test eingereicht. Der Fachdienst validiert nur die Digitale Patientenrechnung und speichert diese nicht."
* #normal "Normal" "Digitale Patientenrechnung wird durch den Fachdienst gespeichert falls keine gravierenden Validierungsfehler vorhanden sind."

ValueSet:  DiPagRechnungSubmitModusVS
Id: dipag-rechnung-submit-modus-vs
Title: "Digitale Patientenrechnung Rechnung Type VS"
Description:  "ValueSet für die Differenzierung von der Verarbeitungsmodi für $erchnung-submit"
* insert Meta
* include codes from system https://gematik.de/fhir/dipag/CodeSystem/dipag-rechnung-submit-modus-cs