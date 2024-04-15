Alias: $kdl = http://dvmd.de/fhir/CodeSystem/kdl

Profile: ERGPKVDokumentenmetadaten
Title: "ERGPKV Dokumentenmetadaten"
Parent: DocumentReference
Id: ergpkv-dokumentenmetadaten
* status MS
* status = #current
  * ^short = "Dokumentenstatus"
  * ^comment = "Versionierung von sonstigen Dokument ist nicht unterstüzt. Nur jeweils die aktuelle Version des Dokumentes wird akzeptiert."
* identifier 1.. MS
  * ^comment = "Eindeutiger Identifikator vergeben durch das RE-PS (z.B. Interne Dokumentennummer), das System MUSS eindeutig pro Leistungserbringer:in vergeben werden."
  * system 1.. MS
  * value 1.. MS
* type 1.. MS
  * ^short = "Dokumenttyp"
* type.coding 1.. 
  * ^slicing.discriminator.type = #pattern
  * ^slicing.discriminator.path = "$this"
  * ^slicing.rules = #open
* type.coding contains KDL 0..1 MS
* type.coding[KDL] from https://gematik.de/fhir/ergpkv/ValueSet/ergpkv-sonstigesdokument-type-vs (extensible)
  * ^short = "Dokumenttyp gemäß Klinischer Dokumentenliste (KDL)"
  * ^comment = "Top-Level Kodes der KDL sollten angboten werden um der Benutzer:in eine verständliche Auswahl zu präsentieren. Hinweis: Zur Kodierung einer Rechnung, in Abgrenzung zu Anhängen, MUSS der KDL-Code 'AM010106' verwendet werden."
* description 1..1 MS
  * ^short = "Dokumententitel"
  * ^comment = "menschenlesbarer Titel des Dokumentes, der dem Versicherten in der UI angezeigt wird. Der Titel kann manuell erfasst oder vom Dateinamen/Metadaten abgeleitet werden. z.B. &quot;Laborbefund vom 28.9.2023&quot;."
* subject MS
  * reference 1..1 MS
  * display 1..1 MS
  * ^comment = "Der Fachdienst verknüpft alle Dokumente mit der Rechnungsempfänger:in"
* content 1.. MS
  * ^slicing.discriminator.type = #pattern
  * ^slicing.discriminator.path = "format"
  * ^slicing.rules = #open
* content contains rechnungspdf 0..1 MS and strukturierterRechnungsinhalt 0..1 MS and anhang 0..1 MS
* content[rechnungspdf]
  * format = https://gematik.de/fhir/ergpkv/CodeSystem/attachmentFormat#erechnung
  * attachment 1..1 MS
    * contentType 1.. MS
    * contentType = #application/pdf
      * ^comment = "Zum Zeitpunkt der Veröffentlichung werden nur PDF-Dokumente als Rechnung seitens der Leistungserbringer:in unterstützt."
    * data 1.. MS
      * ^comment = "Base64-kodiertes PDF. Dieses Feld muss durch die Applikation der Leistungserbringer:in gefüllt werden."
* content[strukturierterRechnungsinhalt]
  * format = https://gematik.de/fhir/ergpkv/CodeSystem/attachmentFormat#rechnungsinhalt
  * attachment 1..1 MS
    * contentType 1.. MS
      * ^comment = "Strukturierte Rechnungsinhalte können seitens der Leistungserbringer:in sowohl als JSON als auch XML übergeben werden."
    * data 1.. MS
      * ^comment = "Base64-kodierte Repräsentation der Rechnungsinhalte. Dieses Feld muss durch die Applikation der Leistungserbringer:in gefüllt werden."
* content[anhang]
  * format = https://gematik.de/fhir/ergpkv/CodeSystem/attachmentFormat#rechnungsanhang
  * attachment 1..1 MS
    * contentType = #application/pdf
      * ^comment = "Zum Zeitpunkt der Veröffentlichung werden nur PDF-Dokumente als Rechnungsanhänge seitens der Leistungserbringer:in unterstützt."
    * data 1.. MS
      * ^comment = "Base64-kodiertes PDF. Dieses Feld muss durch die Applikation der Leistungserbringer:in gefüllt werden."







