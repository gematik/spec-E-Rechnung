// **************************************************
// Szenario 0: 
// Rechnung für Patient mit eigenem Postfach 
// mit einfacher Rechnung (ohne separate Positionen)
// ohne beigefügte Dokumente
// **************************************************


// **************************************************
//  Vom Leistungserbringer erzeugte Daten
// **************************************************

Instance: BeispielDocumentReferenceRechnung3-LE
InstanceOf: DocumentReference
* status = #current
* type = $kdl#AM010106 "Rechnung ambulante/stationäre Behandlung"
* description = "Rechnung Reiseimpfung vom 10.01.2024"
//TODO: Der Vater/Rechnungsempfänger ist in diesem Szenario NICHT das Subject des Dokumentes!!!
* subject = Reference(BeispielPatient3-FD)
//* subject.display = "Max Musterkind"
* content[+]
  * attachment
    * contentType = #application/pdf
    * data = "DIESISTNUREINBEISPIELDIESISTKEINVALIDESPDF00"
* content[+]
  * format = #xrechnung
  * attachment
    * contentType = #application/xml
    * data = "DIESISTNUREINBEISPIELDIESISTKEINVALIDESXML00"
* content[+]
  * format = #gematik-erechnung
  * attachment
    * contentType = #application/fhir+xml
    * data = "DIESISTNUREINBEISPIELDIESISTKEINVALIDESXML00"

Instance: BeispielDocumentReferenceSonstigesDokument3-LE
InstanceOf: DocumentReference
* status = #current
* type = $kdl#PT130102 "Molekularpathologiebefund"
* description = "Molekularpathologiebefund vom 31.12.21"
* subject = Reference(BeispielPatient3-FD)
//* subject.display = "Max Musterkind"
* content[+]
  * attachment.
    * contentType = #application/pdf
    * data = "DIESISTNUREINBEISPIELDIESISTKEINVALIDESPDF00"

Instance: BeispielProvenanceMitSignatur3-LE
InstanceOf: Provenance
* target[+] = Reference(BeispielDocumentReferenceRechnung3-LE)
* recorded = 2024-01-10T08:39:24+02:00
* agent.type = http://terminology.hl7.org/CodeSystem/provenance-participant-type#attester
* agent.who.identifier.value = "<telematik id>"
* insert signatureDummy


// **************************************************
// Operations zwischen LE und FD
// **************************************************  


//Input für Aufruf der $canReceiveInvoice-Operation
Instance: BeispielParameterCanReceiveInvoiceInput3-LE
InstanceOf: ERGPKVRParametersCanReceiveInvoiceInput
* parameter[kvnr]
  * valueString = "A000000000"
* parameter[displayname]
  * valueString = "Manfred Mustermann"

//Output zur $canReceiveInvoice-Operation
Instance: BeispielParameterCanReceiveInvoiceOutput3-LE
InstanceOf: ERGPKVRParametersCanReceiveInvoiceOutput
Usage: #example
* parameter[rechnungsempfaenger]
  * resource = BeispielPatient3-FD
* parameter[versichertePerson]
  * resource = BeispielPatient3-FD

//Input für Aufruf der $submit-Operation
Instance: BeispielParameterSubmitInput3-LE
InstanceOf: Parameters
* parameter[+]
  * name = "rechnung"
  * resource = BeispielDocumentReferenceRechnung3-LE
* parameter[+]
  * name = "signatur"
  * resource = BeispielProvenanceMitSignatur3-LE
* parameter[+]
  * name = "anhang"
  * resource = BeispielDocumentReferenceSonstigesDokument3-LE
// nicht erforderlich, da default
//* parameter[modus]
//  * valueCode = #normal
//* parameter[returnTokenPdf]
//  * valueBoolean = #true

//Output zur $submit-Operation
Instance: BeispielParameterSubmitOutput3-FD
InstanceOf: ERGPKVRParametersSubmitOutput
* parameter[token].valueIdentifier.value = "123-456-789"
* parameter[tokenPdf].resource = BeispielBinaryRechnungsPDF0-FD


// **************************************************
// Vom Fachdienst erstellter Task & extrahierte Daten
// **************************************************  

Instance: BeispielPatient3-FD
InstanceOf: ERGPKVersichertePerson
Usage: #example
* name
  * text = "Manfred Mustermann"
* gender = #male
* identifier
  * type = http://fhir.de/CodeSystem/identifier-type-de-basis#gkv
  * system = "http://fhir.de/sid/gkv/kvid-10"
  * value = "A000000000"
* address
  * text = "Musterweg 2, 3. Etage, 98764 Musterhausen, DE"

  
Instance: BeispielTaskRechnungsworkflow3-FD
InstanceOf: Task
* owner = Reference(BeispielPatient3-FD)
* for = Reference(BeispielPatient3-FD)
* status = #ready
* intent = http://hl7.org/fhir/request-intent#proposal
* businessStatus = https://gematik.de/fhir/ergpkv/CodeSystem/ergpkv-rechnungsworkflow-businessStatus-cs#neu
* identifier
  * system = "https://gematik.de/fhir/sid/ergpkv-token"
  * value = "123-456-789"
//TODO: Würde der Fachdienst hier nicht die Telematik-ID substituieren und auf einen Benutzer-Account vom Typ "Practitioner/-Role" verweisen???
* requester.identifier.value = "<telematik id>"
* input[+]
  * type.coding.display = "rechnung"
  * valueReference = Reference(BeispielDocumentReferenceRechnung3-LE)
* input[+]
  * type.coding.display = "signatur"
  * valueReference = Reference(BeispielProvenanceMitSignatur3-LE)
* input[+]
  * type.coding.display = "anhang"
  * valueReference = Reference(BeispielDocumentReferenceSonstigesDokument3-LE)
* output[+]
  * type.coding.display = "tokenpdf"
  * valueReference = Reference(BeispielRechnungsPDF3-FD)
* output[+]
  * type.coding.display = "metadaten"
  * valueReference = Reference(BeispielRechnungsPDF3-FD)
* output[+]
  * type.coding.display = "binaerdaten"
  * valueReference = Reference(BeispielRechnungsPDF3-FD)


Instance: BeispielBinaryRechnungsPDF3-FD
InstanceOf: ERGPKVRechnungsdokument
//PDF mit aufgedrucktem Token-Code
* data = "DIESISTNUREINBEISPIELDIESISTKEINVALIDESPDF00"

