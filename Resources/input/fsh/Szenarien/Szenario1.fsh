// **************************************************
// Szenario 1: 
// Rechnung für Patient(Kind) ohne eigenes Postfach 
// mit abweichendem Rechnungsempfänger (Vater)
// mit einfacher Rechnung (ohne separate Positionen)
// mit einem beigefügten Dokument
// **************************************************

Instance: BeispielRechnung1-LE
InstanceOf: ERGPKVRechnung
* extension[pdf-repraesentation-rechnung]
  * valueReference = Reference(BeispielRechnungsPDF1-LE)
* identifier[rechnungsnummer]
  * system = "http://irgendein-leistungserbinger.de/fhir/sid/rechnungen"
  * value = "2023-01"
* recipient 
  * reference = "Patient/irgendein-lokaler-link-der-vom-fachdienst-ignoriert-wird"
  * identifier.value = "A123456789"
  * display = "Manfred Mustervater"
* subject
  * display = "Max Musterkind"
* date = 2023-11-07
* issuer  
  * identifier.value = "123456789"
  * display = "Dr. Mathilde Musterärztin"
* totalPriceComponent[tax]
  * factor = 0.19
  * amount
    * value = 19
    * currency = #EUR
* totalNet 
  * value = 100
  * currency = #EUR
* totalGross
  * value = 119
  * currency = #EUR

Instance: BeispielRechnungsPDF1-LE
InstanceOf: ERGPKVRechnungsdokument
* data = "DIESISTNUREINBEISPIELDIESISTKEINVALIDESPDF00"


Instance: BeispielSonstigesDokument1-LE
InstanceOf: ERGPKVDokumentenmetadaten
* identifier
  * system = "https://example.org/fhir/sid/dokumentennr"
  * value = "1234567890"
* subject.display = "Max Musterkind"
* author.identifier  
  * value = "123456789"
* type = $kdl#PT130102 "Molekularpathologiebefund"
* description = "Molekularpathologiebefund vom 31.12.21"
* content.attachment.data = "DIESISTNUREINBEISPIELDIESISTKEINVALIDESPDF00"

// **************************************************
// Operations zwischen LE und FD
// **************************************************  


//Input für Aufruf der $submit-Operation
Instance: BeispielParameterSubmitInput1-LE
InstanceOf: Parameters
//* parameter[rechnung]
//  * resource = BeispielRechnungsBundle1-LE
//* parameter[anhaenge]
//  * resource = BeispielSonstigesDokument1-LE
// nicht erforderlich, da default
//* parameter[modus]
//  * valueCode = #normal
//* parameter[returnTokenPdf]
//  * valueBoolean = #true

//Output zur $submit-Operation
//Instance: BeispielParameterSubmitOutput1-FD
//InstanceOf: Parameters
//* parameter[token].valueIdentifier.value = "111-456-789"
//* parameter[tokenPdf].resource = BeispielBinaryRechnungsPDF1-FD


// **************************************************
// Vom Fachdienst erstellter Task & extrahierte Daten
// **************************************************  

Instance: BeispielPatientManfredMustervater1-FD
InstanceOf: ERGPKVersichertePerson
Usage: #example
* active = true
* name
  * text = "Manfred Mustervater"
* gender = #male
* identifier
  * type = http://fhir.de/CodeSystem/identifier-type-de-basis#gkv
  * system = "http://fhir.de/sid/gkv/kvid-10"
  * value = "A123456789"
* address
  * text = "Musterweg 2, 3. Etage, 98764 Musterhausen, DE"

Instance: BeispielRechnung1-FD
InstanceOf: ERGPKVRechnung
* extension[pdf-repraesentation-rechnung]
  * valueReference = Reference(BeispielBinaryRechnungsPDF1-FD)
* identifier[rechnungsnummer]
  * system = "http://irgendein-leistungserbinger.de/fhir/sid/rechnungen"
  * value = "2023-01"
* recipient = Reference(BeispielPatientManfredMustervater1-FD)
  * identifier.value = "A123456789"
  * display = "Manfred Mustervater"
* subject
  * display = "Max Musterkind"
* date = 2023-11-07
* issuer  
  * identifier.value = "123456789"
  * display = "Dr. Mathilde Musterärztin"
  //wird hier der Link auf den  Practitioner substituiert??
* totalPriceComponent[tax]
  * factor = 0.19
  * amount
    * value = 19
    * currency = #EUR
* totalNet 
  * value = 100
  * currency = #EUR
* totalGross
  * value = 119
  * currency = #EUR

Instance: BeispielDocumentReferenceSonstigesDokument1-FD
InstanceOf: ERGPKVDokumentenmetadaten
* identifier
  * system = "https://example.org/fhir/sid/dokumentennr"
  * value = "1234567890"
* subject.display = "Max Musterkind"
* author.identifier  
  * value = "123456789"
* type = $kdl#PT130102 "Molekularpathologiebefund"
* description = "Molekularpathologiebefund vom 31.12.21"
//TODO: Der Vater/Rechnungsempfänger ist in diesem Szenario NICHT das Subject des Dokumentes!!!
* subject = Reference(BeispielPatientManfredMustervater1-FD)
* subject.display = "Max Musterkind"
* content.attachment.url = "Binary/BeispielBinarySonstigesDokument1-FD"

Instance: BeispielBinarySonstigesDokument1-FD
InstanceOf: ERGPKVRechnungsdokument
* data = "DIESISTNUREINBEISPIELDIESISTKEINVALIDESPDF00"
* securityContext = Reference(BeispielDocumentReferenceSonstigesDokument1-FD)

Instance: BeispielBinaryRechnungsPDF1-FD
InstanceOf: ERGPKVRechnungsdokument
//PDF mit aufgedrucktem Token-Code
* data = "DIESISTNUREINBEISPIELDIESISTKEINVALIDESPDF00"


