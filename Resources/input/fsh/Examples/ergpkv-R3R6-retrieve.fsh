Instance: BeispielParameterRetrieveInput
InstanceOf: Parameters
* parameter[+]
  * name = "token"
  * valueString = "123-456-789"
* parameter[+]
  * name = "strukturierterRechnungsinhalt"
  * valueBoolean = false
* parameter[+]
  * name = "originaleRechnung"
  * valueBoolean = false
  
Instance: BeispielDocumentReferenceRechnungRetrieve
InstanceOf: DocumentReference
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
  * format = #xrechnung
  * attachment
    * contentType = #application/xml
    * url = "[FD-endpunkt]/Binary/xrechnung"

//TODO Kommentar im IG