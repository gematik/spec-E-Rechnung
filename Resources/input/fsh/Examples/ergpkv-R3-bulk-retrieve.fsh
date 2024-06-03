Instance: BulkRetrieveExampleInput
InstanceOf: Bundle
Usage: #example
* type = #transaction
* entry[+]
  * insert BundleRequest(POST, "$retrieve")
  * resource = BeispielParameterRetrieveInput
* entry[+]
  * insert BundleRequest(POST, "$retrieve")
  * resource = BeispielParameterRetrieveInput2

Instance: BulkRetrieveExampleOutput
InstanceOf: Bundle
Usage: #example
* type = #transaction-response
* entry[+]
  * fullUrl = "[FD-endpunkt]/DocumentReference/BeispielDocumentReferenceRechnungRetrieve"
  * resource = BeispielDocumentReferenceRechnungRetrieve
* entry[+]
  * fullUrl = "[FD-endpunkt]/DocumentReference/BeispielDocumentReferenceRechnungRetrieve2"
  * resource = BeispielDocumentReferenceRechnungRetrieve2

Instance: BeispielParameterRetrieveInput2
InstanceOf: Parameters
* parameter[+]
  * name = "token"
  * valueString = "123-456-123"

Instance: BeispielDocumentReferenceRechnungRetrieve2
InstanceOf: DocumentReference
* identifier
  * system = "https://gematik.de/fhir/sid/erg-token"
  * value = "123-456-123"
* status = #current
* type = $kdl#AM010106 "Rechnung ambulante/stationäre Behandlung"
* description = "Rechnung Reiseimpfung vom 11.01.2024"
* subject
  * identifier
    * system = "http://fhir.de/sid/gkv/kvid-10"
    * value = "A000000000"
* content[+]
  * format = #xrechnung
  * attachment
    * contentType = #application/xml
    * url = "[FD-endpunkt]/Binary/xrechnung"