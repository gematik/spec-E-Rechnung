Instance: BeispielParameterSubmitOutput3-FD
InstanceOf: Parameters
* parameter[+]
  * name = "rechnung"
  * resource = BeispielDocumentReferenceRechnung3-FD
* parameter[+]
  * name = "anhang"
  * resource = BeispielDocumentReferenceSonstigesDokument3-FD

Instance: BeispielDocumentReferenceRechnung3-FD
InstanceOf: DocumentReference
//FD fügt Token hinzu
* identifier
  * system = "https://gematik.de/fhir/sid/dipag-token"
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
  * format = #dipag
  * attachment
    * contentType = #application/fhir+xml
    * url = "[FD-endpunkt]/Binary/invoice"
//signatur wird entfernt, da nach Änderung des PDFs nicht mehr gültig
//Verknüpfung zum Original 
* relatesTo
  * code = #transforms
  * target = Reference (BeispielDocumentReferenceRechnung3-LE)

Instance: BeispielDocumentReferenceSonstigesDokument3-FD
InstanceOf: DocumentReference
//FD fügt Token hinzu
* identifier
  * system = "https://gematik.de/fhir/sid/dipag-token"
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