// ToDo: IG sollte beschreiben, dass das Profil keinen Constraint enthält zur Validierung ob was Bundle vollständig ist. Dies muss aufgrund der teilweise vorhandenen logischen Referenzen per Businesslogik im Fachdienst implementiert werden.
Profile: ERGPKVRechungscontainer
Title: "ERGPKV Rechnungscontainer"
Parent: Bundle
Description: "Signiertes Bundle, das die strukturierten Rechnungsdaten (Invoice + ChargeItems), sowie das Rechnungsdokument(Binary) enthält"
Id: ergpkv-rechnungscontainer
* type = #collection
* entry 3.. MS
  * ^slicing.discriminator.type = #type
  * ^slicing.discriminator.path = "resource"
  * ^slicing.rules = #closed
* entry contains invoice 1..1 MS and chargeItem 1.. MS and binary 1.. MS
* entry[invoice]
  * resource 1.. MS
  * resource only Invoice
* entry[chargeItem]
  * resource 1.. MS
  * resource only ChargeItem
* entry[binary]
  * resource 1.. MS
  * resource only Binary
//ToDo: Signature vorübergehend auf 0..1 gesetzt bis klar ist, wie diese aussehen soll, da sonst die Beispiele nicht validieren.
* signature 0.. MS
  * ^short = "elektronische Signatur des Leistungserbringers"
//  * ^comment = ""

//...für Beispieldaten, bis geklärt ist, wie die Signature aussehen soll.
RuleSet: signatureDummy
* signature 
  * type = urn:iso-astm:E1762-95:2013#1.2.840.10065.1.12.1.1 "Author's Signature"
  * when = 2015-02-07T13:28:17.239+02:00
  * who.display = "weiß nicht"