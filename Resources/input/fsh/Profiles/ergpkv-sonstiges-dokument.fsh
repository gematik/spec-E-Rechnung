Alias: $kdl = http://dvmd.de/fhir/CodeSystem/kdl


Profile: ERGPKVSonstigesDokument
Title: "ERGPKV Sonstiges Dokument"
Parent: DocumentReference
Id: ergpkv-sonstiges-dokument
* status MS
* status = #current
  * ^short = "Dokumentenstatus"
  * ^comment = "Versionierung von sonstigen Dokument ist nicht unterstüzt. Nur jeweils die aktuelle Version des Dokumentes wird akzeptiert."
* type 1.. MS
  * ^short = "Dokumenttyp"
* type.coding 1.. 
  * ^slicing.discriminator.type = #pattern
  * ^slicing.discriminator.path = "$this"
  * ^slicing.rules = #open
* type.coding contains KDL 0..1 MS
* type.coding[KDL] from https://gematik.de/fhir/ergpkv/ValueSet/ergpkv-sonstigesdokument-type-vs (extensible)
  * ^short = "Dokumenttyp gemäß Klinischer Dokumentenliste (KDL)"
  * ^comment = "Top-Level Kodes der KDL sollten angboten werden um der Benutzer:in eine verständliche Auswahl zu präsentieren."
* description 1..1 MS
  * ^short = "Dokumententitel"
  * ^comment = "menschenlesbarer Titel des Dokumentes, der dem Versicherten in der UI angezeigt wird. Der Titel kann manuell erfasst oder vom Dateinamen/Metadaten abgeleitet werden. z.B. &quot;Laborbefund vom 28.9.2023&quot;."
* subject MS
  * reference 1..1 MS
  * ^comment = "Der Fachdienst verknüpft alle Dokumente mit der Rechnungsempfänger:in oder der Patient:in"
* content 1..1 MS
  * ^short = "Angehängtes Dokument"
  * attachment 1..1 MS
    * ^short = "Anhang"
    * contentType 1.. MS
    * contentType = #application/pdf
      * ^short = "MIME-Type des Dokumentes"
      * ^comment = "Zum Zeitpunkt der Veröffentlichung werden nur PDF-Dokumente als Anhang seitens der Leistungserbringer:in und der Patient:in unterstüzt."
    * url 0.. MS
      * ^short = "Dokumenten-Link"
      * ^comment = "Der Fachdienst extrahiert das base64-kodierte PDF und verlinkt eine Binary-Repräsentation nach Entgegennahme der Rechnung."
    * data 0.. MS
      * ^short = "eingebettetes Dokument"
      * ^comment = "Der Fachdienst extrahiert das base64-kodierte PDF und verlinkt eine Binary-Repräsentation nach Entgegennahme der Rechnung. Dieses Feld muss durch die Applikation der Leistungserbringer:in oder der Patient:in gefüllt werden."


Instance: BeispielSonstigesDokument1
InstanceOf: ERGPKVSonstigesDokument
* type = $kdl#PT130102 "Molekularpathologiebefund"
* description = "Molekularpathologiebefund vom 31.12.21"
* content.attachment.data = "JVBERi0xLjUNJeLjz9MNCjEwIDAgb2JqDTw8L0xpbmVhcml6ZWQgMS9MIDEzMDA2OC9PIDEyL0Ug"