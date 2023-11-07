// **************************************************
// Szenario 0: 
// Rechnung für Patient mit eigenem Postfach 
// mit einfacher Rechnung (ohne separate Positionen)
// ohne beigefügte Dokumente
// **************************************************


// **************************************************
//  Vom Leistungserbringer erzeugte Daten
// **************************************************
Instance: BeispielRechnungsBundle0-LE
InstanceOf: ERGPKVRechungscontainer
//* type = #collection
* entry[invoice].resource = BeispielRechnung0-LE
* entry[binary].resource = BeispielRechnungsPDF0-LE
* entry[chargeItem].resource = DummyChargeItem
* insert signatureDummy

Instance: BeispielRechnung0-LE
InstanceOf: ERGPKVRechnung
* extension[pdf-repraesentation-rechnung]
  * valueReference = Reference(BeispielRechnungsPDF0-LE)
* identifier[rechnungsnummer]
  * system = "http://irgendein-leistungserbinger.de/fhir/sid/rechnungen"
  * value = "2023-00"
* recipient 
  * reference = "Patient/irgendein-lokaler-link-der-vom-fachdienst-ignoriert-wird"
  * identifier.value = "A000000000"
  * display = "Mustermann, Manfred"
* subject
  * display = "Mustermann, Manfred"
* date = 2023-11-07
* issuer  
  * identifier.value = "123456789"
  * display = "Musterärztin, Dr. Mathilde"
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


Instance: BeispielRechnungsPDF0-LE
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


// **************************************************
// Operations zwischen LE und FD
// **************************************************  


//Input für Aufruf der $canReceiveInvoice-Operation
Instance: BeispielParameterCanReceiveInvoiceInput0-LE
InstanceOf: ERGPKVRParametersCanReceiveInvoiceInput
* parameter[kvnr]
  * valueString = "A000000000"
* parameter[displayname]
  * valueString = "Manfred Mustermann"

//Output zur $canReceiveInvoice-Operation
Instance: BeispielParameterCanReceiveInvoiceOutput0-LE
InstanceOf: ERGPKVRParametersCanReceiveInvoiceOutput
Usage: #example
* parameter[rechnungsempfaenger]
  * resource = BeispielPatientManfredMustermann0-FD
* parameter[versichertePerson]
  * resource = BeispielPatientManfredMustermann0-FD

//Input für Aufruf der $submit-Operation
Instance: BeispielParameterSubmitInput0-LE
InstanceOf: ERGPKVRParametersSubmitInput
* parameter[rechnung]
  * resource = BeispielRechnungsBundle0-LE
// nicht erforderlich, da default
//* parameter[modus]
//  * valueCode = #normal
//* parameter[returnTokenPdf]
//  * valueBoolean = #true

//Output zur $submit-Operation
Instance: BeispielParameterSubmitOutput0-FD
InstanceOf: ERGPKVRParametersSubmitOutput
* parameter[token].valueIdentifier.value = "123-456-789"
* parameter[tokenPdf].valueReference = Reference(BeispielBinaryRechnungsPDF0-FD) 


// **************************************************
// Vom Fachdienst erstellter Task & extrahierte Daten
// **************************************************  

Instance: BeispielPatientManfredMustermann0-FD
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

  
Instance: BeispielTaskRechnungsworkflow0-FD
InstanceOf: ERGPKVRechnungsworkflow
* extension[rechnungsempfaenger]
  * valueReference = Reference(BeispielPatientManfredMustermann0-FD)
    //macht keinen Sinn, dass man hier nochmal die KVNR angeben muss!!+
    * identifier
      * system = "http://fhir.de/sid/gkv/kvid-10"
      * value = "A000000000"
* status = #ready
* businessStatus = https://gematik.de/fhir/ergpkv/CodeSystem/ergpkv-rechnungsworkflow-businessStatus-cs#neu
* identifier[token].value = "123-456-789"
//TODO: Würde der Fachdienst hier nicht die Telematik-ID substituieren und auf einen Benutzer-Account vom Typ "Practitioner/-Role" verweisen???
* requester.identifier.value = "<telematik id>"
* input[originalRechnung].valueReference = Reference(BeispielRechnungsBundle0-LE)
* output[rechnung].valueReference = Reference(BeispielRechnung0-FD)
* output[tokenPdf].valueReference = Reference(BeispielRechnungsPDF0-FD)
* output[rechnungsposition].valueReference = Reference(DummyChargeItem)

Instance: BeispielRechnung0-FD
InstanceOf: ERGPKVRechnung
* extension[pdf-repraesentation-rechnung]
  * valueReference = Reference(BeispielBinaryRechnungsPDF0-FD)
* identifier[rechnungsnummer]
  * system = "http://irgendein-leistungserbinger.de/fhir/sid/rechnungen"
  * value = "2023-00"
* recipient = Reference(BeispielPatientManfredMustermann0-FD)
  * identifier.value = "A000000000"
  * display = "Mustermann, Manfred"
* subject
  * display = "Mustermann, Manfred"
* date = 2023-11-07
* issuer  
  * identifier.value = "123456789"
  * display = "Musterärztin, Dr. Mathilde"
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

Instance: BeispielBinaryRechnungsPDF0-FD
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

