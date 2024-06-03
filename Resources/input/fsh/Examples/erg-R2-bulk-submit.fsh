Instance: BulkSubmitExample
InstanceOf: Bundle
Usage: #example
* type = #transaction
* entry[+]
  * insert BundleRequest(POST, "$submit")
  * resource = BeispielParameterSubmitInput3-LE
* entry[+]
  * insert BundleRequest(POST, "$submit")
  * resource = BeispielParameterSubmitInput3.1-LE

Instance: BeispielParameterSubmitInput3-LE
InstanceOf: Parameters
* parameter[+]
  * name = "rechnung"
  * resource = BeispielDocumentReferenceRechnung3-LE
* parameter[+]
  * name = "anhang"
  * resource = BeispielDocumentReferenceSonstigesDokument3-LE

Instance: BeispielDocumentReferenceRechnung3-LE
InstanceOf: DocumentReference
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

Instance: BeispielParameterSubmitInput3.1-LE
InstanceOf: Parameters
* parameter[+]
  * name = "rechnung"
  * resource = BeispielDocumentReferenceRechnung3.1-LE
* parameter[+]
  * name = "anhang"
  * resource = BeispielDocumentReferenceSonstigesDokument3.1-LE

Instance: BeispielDocumentReferenceRechnung3.1-LE
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
    * when = 2015-02-07T13:29:17.239+02:00
    * who.display = "Arzt"

Instance: BeispielDocumentReferenceSonstigesDokument3.1-LE
InstanceOf: DocumentReference
* status = #current
* type = $kdl#PT130102 "Molekularpathologiebefund"
* description = "Molekularpathologiebefund vom 30.12.21"
* subject = Reference(BeispielPatient3-FD)
//* subject.display = "Max Musterkind"
* content[+]
  * attachment
    * contentType = #application/pdf
    * data = "DIESISTNUREINBEISPIELDIESISTKEINVALIDESPDF00"

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