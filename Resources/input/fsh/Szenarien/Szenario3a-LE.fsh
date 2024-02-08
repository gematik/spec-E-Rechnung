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
//Referenz auf Patient hier nicht relevant (kann nicht auflösbarer Link auf Instanz des LE-PVS sein)
//Patientenkontext ergibt sich aus Task.for Referenz, die vom Fachdienst gesetzt wird
//Versichertennummer kann zum Abgleich verwendet werden
* subject
  * identifier
    * system = "http://fhir.de/sid/gkv/kvid-10"
    * value = "A000000000"
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
* extension
  * url = "http://example.org/StructureDefinition/signatur"
  * valueSignature
    * type = urn:iso-astm:E1762-95:2013#1.2.840.10065.1.12.1.1 "Author's Signature"
    * when = 2015-02-07T13:28:17.239+02:00
    * who.display = "Arzt"

Instance: BeispielDocumentReferenceRechnung3-FD
InstanceOf: DocumentReference
//FD fügt Token hinzu
* identifier
  * system = "https://gematik.de/fhir/sid/ergpkv-token"
  * value = "123-456-789"
* status = #current
* type = $kdl#AM010106 "Rechnung ambulante/stationäre Behandlung"
* description = "Rechnung Reiseimpfung vom 10.01.2024"
* subject
  * identifier
    * system = "http://fhir.de/sid/gkv/kvid-10"
    * value = "A000000000"
* content[+]
  * attachment
    * contentType = #application/pdf
    //data wird in Binary separiert
    * url = "[FD-endpunkt]/Binary/pdf-mit-token-barcode"
* content[+]
  * format = #xrechnung
  * attachment
    * contentType = #application/xml
    * url = "[FD-endpunkt]/Binary/xrechnung"
* content[+]
  * format = #gematik-erechnung
  * attachment
    * contentType = #application/fhir+xml
    * url = "[FD-endpunkt]/Binary/invoice"
//signatur wird entfernt, da nach Änderung des PDFs nicht mehr gültig
//Verknüpfung zum Original 
* relatesTo
  * code = #transforms
  * target = Reference (BeispielDocumentReferenceRechnung3-LE)

Instance: BeispielDocumentReferenceSonstigesDokument3-LE
InstanceOf: DocumentReference
* status = #current
* type = $kdl#PT130102 "Molekularpathologiebefund"
* description = "Molekularpathologiebefund vom 31.12.21"
* subject = Reference(BeispielPatient3-FD)
//* subject.display = "Max Musterkind"
* content[+]
  * attachment
    * contentType = #application/pdf
    * data = "DIESISTNUREINBEISPIELDIESISTKEINVALIDESPDF00"


Instance: BeispielDocumentReferenceSonstigesDokument3-FD
InstanceOf: DocumentReference
//FD fügt Token hinzu
* identifier
  * system = "https://gematik.de/fhir/sid/ergpkv-token"
  * value = "987-654-321"
* status = #current
* type = $kdl#PT130102 "Molekularpathologiebefund"
* description = "Molekularpathologiebefund vom 31.12.21"
* subject = Reference(BeispielPatient3-FD)
//* subject.display = "Max Musterkind"
* content[+]
  * attachment
    * contentType = #application/pdf
    //data wird in Binary separiert
    * url = "[FD-endpunkt]/Binary/patho-mit-token-barcode"
//Verknüpfung zum Original 
* relatesTo
  * code = #transforms
  * target = Reference (BeispielDocumentReferenceSonstigesDokument3-LE)

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
  * name = "anhang"
  * resource = BeispielDocumentReferenceSonstigesDokument3-LE
// nicht erforderlich, da default
//* parameter[modus]
//  * valueCode = #normal
//* parameter[returnTokenPdf]
//  * valueBoolean = #true

//Output zur $submit-Operation
Instance: BeispielParameterSubmitOutput3-FD
InstanceOf: Parameters
* parameter[+]
  * name = "rechnung"
  * resource = BeispielDocumentReferenceRechnung3-FD
* parameter[+]
  * name = "anhang"
  * resource = BeispielDocumentReferenceSonstigesDokument3-FD


// **************************************************
// Vom Fachdienst erstellter Task & extrahierte Daten
// **************************************************  

Instance: BeispielPatient3-FD
InstanceOf: Patient
Usage: #example
* name
  * text = "Manfred Mustermann"
* gender = #male
* identifier
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
//TODO: Würde der Fachdienst hier nicht die Telematik-ID substituieren und auf einen Benutzer-Account vom Typ "Practitioner/-Role" verweisen???
* requester.identifier.value = "<telematik id>"
* input[+]
  * type.coding.display = "rechnung-original"
  * valueReference = Reference(BeispielDocumentReferenceRechnung3-LE)
* input[+]
  * type.coding.display = "anhang-original"
  * valueReference = Reference(BeispielDocumentReferenceSonstigesDokument3-LE)
* output[+]
  * type.coding.display = "rechnung-meta"
  * valueReference = Reference(BeispielDocumentReferenceRechnung3-FD)
* output[+]
  * type.coding.display = "rechnung-pdf"
  * valueReference = Reference(BeispielBinaryRechnungsPDF3-FD) 
* output[+]
  * type.coding.display = "anhang-meta"
  * valueReference = Reference(BeispielDocumentReferenceSonstigesDokument3-FD)
* output[+]
  * type.coding.display = "anhang-pdf"
  * valueReference = Reference(BeispielBinaryRechnungsPDF3-FD) 


Instance: BeispielBinaryRechnungsPDF3-FD
InstanceOf: ERGPKVRechnungsdokument
//PDF mit aufgedrucktem Token-Code
* data = "DIESISTNUREINBEISPIELDIESISTKEINVALIDESPDF00"

