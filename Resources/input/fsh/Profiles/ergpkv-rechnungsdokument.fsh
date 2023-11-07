Profile: ERGPKVRechnungsdokument
Title: "ERGPKV Rechnungsdokument"
Parent: Binary
Id: ergpkv-rechnungsdokument
* contentType MS
* contentType = #application/pdf (exactly)
  * ^short = "MIME-Type des Dokumentes"
  * ^comment = "Zum Zeitpunkt der Veröffentlichung werden nur PDF-Dokumente als Anhang seitens der Leistungserbringer:in und der Patient:in unterstüzt."
* data 1..1 MS
  * ^short = "Binär-Daten"
  * ^comment = "PDF als base64-kodierter String."
//Security Context ist interne Angelegenheit des Fachdienstes und für die API nicht relevant
//* securityContext 0.. MS
//  * ^short = "Sicherheits-Kontext"
//  * ^comment = "SecurityContext wird durch den Fachdienst ermittelt und in der Ressource ersetzt. Muss nicht duruch die Applikation der Leistungserbringer:in und der Patient:in eingefügt werden."
//  * reference 1.. MS
//    * ^short = "Referenz auf FHIR-Ressource"
//    * ^comment = "Die Binary-Ressourcen sollten an das Patient-Compartment der Rechnungsempfänger:in oder der Patient:in gebunden werden. Im Falle, dass die Leistungserbringer:in das Dokument einstellt in den Fachdienst als Anhang zur Rechnung muss das Dokument mit der Rechnungsempfänger:in verknüpft werden. In allen weiteren Fällen wird das Dokument mit der Person verknüpft, die das Dokument hochlädt zum Fachdienst."


Instance: BeispielRechnungsPDF1
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
