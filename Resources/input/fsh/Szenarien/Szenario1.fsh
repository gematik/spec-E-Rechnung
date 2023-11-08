// **************************************************
// Szenario 1: 
// Rechnung für Patient(Kind) ohne eigenes Postfach 
// mit abweichendem Rechnungsempfänger (Vater)
// mit einfacher Rechnung (ohne separate Positionen)
// mit einem beigefügten Dokument
// **************************************************


// **************************************************
//  Vom Leistungeerbringer erzeugte Daten
// **************************************************
Instance: BeispielRechnungsBundle1-LE
InstanceOf: ERGPKVRechungscontainer
//* type = #collection
* entry[invoice].resource = BeispielRechnung1-LE
* entry[binary].resource = BeispielRechnungsPDF1-LE
* entry[chargeItem].resource = DummyChargeItem
* insert signatureDummy

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
* data = "JVBERi0xLjUNJeLjz9MNCjEwIDAgb2JqDTw8L0xpbmVhcml6ZWQgMS9MIDEzMDA2OC9PIDEyL0Ug
MTI1NzM1L04gMS9UIDEyOTc2NC9IIFsgNTQ2IDIwNF0+Pg1lbmRvYmoNICAgICAgICAgICAgICAg
DQo0MSAwIG9iag08PC9EZWNvZGVQYXJtczw8L0NvbHVtbnMgNS9QcmVkaWN0b3IgMTI+Pi9GaWx0
ZXIvRmxhdGVEZWNvZGUvSURbPDRDRDkwQkY3MkI2NjU5NkVCMEJDQzlBN0ZGNzIwMjE3PjwyOTkw
ODAzRkY2QTc0OTQ4OEEwNTdBREQzRDdFQTM0Nj5dL0luZGV4WzEwIDU4XS9JbmZvIDkgMCBSL0xl
bmd0aCAxMzcvUHJldiAxMjk3NjUvUm9vdCAxMSAwIFIvU2l6ZSA2OC9UeXBlL1hSZWYvV1sxIDMg
MV0+PnN0cmVhbQ0KaN5iYmRgEGBgYmBgugciGf1AJMNmEMn2H0RyxIJI9slg9k4wuQNMHgCLZ4DJ
NLBIJIjkagGbA2abeIDZmiAyvhFsMkic0fApWFwDRPoWgNmhIFIzHMyWBZFWWWD1YSCS/yhYXAFs
yxUQyXoQSP6XmsbABHT/TLBKBsZBRAKDTvQFQIABAIHlFZoNCmVuZHN0cmVhbQ1lbmRvYmoNc3Rh"


Instance: BeispielSonstigesDokument1-LE
InstanceOf: ERGPKVSonstigesDokument
* type = $kdl#PT130102 "Molekularpathologiebefund"
* description = "Molekularpathologiebefund vom 31.12.21"
* content.attachment.data = "JVBERi0xLjUNJeLjz9MNCjEwIDAgb2JqDTw8L0xpbmVhcml6ZWQgMS9MIDEzMDA2OC9PIDEyL0Ug"

// **************************************************
// Operations zwischen LE und FD
// **************************************************  

//Input für Aufruf der $canReceiveInvoice-Operation
Instance: BeispielParameterCanReceiveInvoiceInput1-LE
InstanceOf: ERGPKVRParametersCanReceiveInvoiceInput
* parameter[kvnr]
  * valueString = "A123456789"
* parameter[displayname]
  * valueString = "Manfred Mustervater"

//Output zur $canReceiveInvoice-Operation
Instance: BeispielParameterCanReceiveInvoiceOutput1-LE
InstanceOf: ERGPKVRParametersCanReceiveInvoiceOutput
Usage: #example
* parameter[rechnungsempfaenger]
  * resource = BeispielPatientManfredMustervater1-FD
* parameter[versichertePerson]
  * resource = BeispielPatientManfredMustervater1-FD

//Input für Aufruf der $submit-Operation
Instance: BeispielParameterSubmitInput1-LE
InstanceOf: ERGPKVRParametersSubmitInput
* parameter[rechnung]
  * resource = BeispielRechnungsBundle1-LE
* parameter[anhaenge]
  * resource = BeispielSonstigesDokument1-LE
// nicht erforderlich, da default
//* parameter[modus]
//  * valueCode = #normal
//* parameter[returnTokenPdf]
//  * valueBoolean = #true

//Output zur $submit-Operation
Instance: BeispielParameterSubmitOutput1-FD
InstanceOf: ERGPKVRParametersSubmitOutput
* parameter[token].valueIdentifier.value = "111-456-789"
* parameter[tokenPdf].valueReference = Reference(BeispielBinaryRechnungsPDF1-FD)


// **************************************************
// Vom Fachdienst erstellter Task & extrahierte Daten
// **************************************************  

Instance: BeispielPatientManfredMustervater1-FD
InstanceOf: ERGPKVersichertePerson
Usage: #example
* name
  * text = "Manfred Mustervater"
* gender = #male
* identifier
  * type = http://fhir.de/CodeSystem/identifier-type-de-basis#gkv
  * system = "http://fhir.de/sid/gkv/kvid-10"
  * value = "A123456789"
* address
  * text = "Musterweg 2, 3. Etage, 98764 Musterhausen, DE"

  
Instance: BeispielTaskRechnungsworkflow1-FD
InstanceOf: ERGPKVRechnungsworkflow
* extension[rechnungsempfaenger]
  * valueReference = Reference(BeispielPatientManfredMustervater1-FD)
  //macht keinen Sinn, dass man hier nochmal die KVNR angeben muss!!+
    * identifier
      * system = "http://fhir.de/sid/gkv/kvid-10"
      * value = "A123456789"
* status = #ready
* businessStatus = https://gematik.de/fhir/ergpkv/CodeSystem/ergpkv-rechnungsworkflow-businessStatus-cs#neu
* identifier[token].value = "111-456-789"
//TODO: Würde der Fachdienst hier nicht die Telematik-ID substituieren und auf einen Benutzer-Account vom Typ "Practitioner/-Role" verweisen???
* requester.identifier.value = "<telematik id>"
* input[originalRechnung].valueReference = Reference(BeispielRechnungsBundle1-LE)
* output[rechnung].valueReference = Reference(BeispielRechnung1-FD)
* output[tokenPdf].valueReference = Reference(BeispielRechnungsPDF1-FD)
* output[sonstigeDokumente].valueReference = Reference(BeispielSonstigesDokument1-FD)
* output[rechnungsposition].valueReference = Reference(DummyChargeItem)


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
InstanceOf: ERGPKVSonstigesDokument
* type = $kdl#PT130102 "Molekularpathologiebefund"
* description = "Molekularpathologiebefund vom 31.12.21"
//TODO: Der Vater/Rechnungsempfänger ist in diesem Szenario NICHT das Subject des Dokumentes!!!
* subject = Reference(BeispielPatientManfredMustervater1-FD)
* subject.display = "Max Musterkind"
* content.attachment.url = "Binary/BeispielBinarySonstigesDokument1-FD"

Instance: BeispielBinarySonstigesDokument1-FD
InstanceOf: ERGPKVRechnungsdokument
* data = "JVBERi0xLjUNJeLjz9MNCjEwIDAgb2JqDTw8L0xpbmVhcml6ZWQgMS9MIDEzMDA2OC9PIDEyL0Ug"
* securityContext = Reference(BeispielDocumentReferenceSonstigesDokument1-FD)

Instance: BeispielBinaryRechnungsPDF1-FD
InstanceOf: ERGPKVRechnungsdokument
//PDF mit aufgedrucktem Token-Code
* data = "JVBERi0xLjUNJeLjz9MNCjEwIDAgb2JqDTw8L0xpbmVhcml6ZWQgMS9MIDEzMDA2OC9PIDEyL0Ug
MTI1NzM1L04gMS9UIDEyOTc2NC9IIFsgNTQ2IDIwNF0+Pg1lbmRvYmoNICAgICAgICAgICAgICAg
DQo0MSAwIG9iag08PC9EZWNvZGVQYXJtczw8L0NvbHVtbnMgNS9QcmVkaWN0b3IgMTI+Pi9GaWx0
ZXIvRmxhdGVEZWNvZGUvSURbPDRDRDkwQkY3MkI2NjU5NkVCMEJDQzlBN0ZGNzIwMjE3PjwyOTkw
ODAzRkY2QTc0OTQ4OEEwNTdBREQzRDdFQTM0Nj5dL0luZGV4WzEwIDU4XS9JbmZvIDkgMCBSL0xl
bmd0aCAxMzcvUHJldiAxMjk3NjUvUm9vdCAxMSAwIFIvU2l6ZSA2OC9UeXBlL1hSZWYvV1sxIDMg
MV0+PnN0cmVhbQ0KaN5iYmRgEGBgYmBgugciGf1AJMNmEMn2H0RyxIJI9slg9k4wuQNMHgCLZ4DJ
NLBIJIjkagGbA2abeIDZmiAyvhFsMkic0fApWFwDRPoWgNmhIFIzHMyWBZFWWWD1YSCS/yhYXAFs
yxUQyXoQSP6XmsbABHT/TLBKBsZBRAKDTvQFQIABAIHlFZoNCmVuZHN0cmVhbQ1lbmRvYmoNc3Rh"

