// ------------- Profile -------------
Alias: $kdl = http://dvmd.de/fhir/CodeSystem/kdl

Profile: ERGPKVDokumentenmetadaten
Title: "ERGPKV Dokumentenmetadaten"
Parent: DocumentReference
Id: ergpkv-dokumentenmetadaten
* insert Meta
* obeys SignaturVerpflichtendRechnung
* obeys RechnungOderAnhang
* extension MS
* extension contains 
  ERGPKVDocRefSignature named docRef-signature 0..1 MS and 
  ERGPKVDocumentReferenceMarkierung named markierung 0..* MS and
  ERGPKVDocumentReferenceRechnungsdatum named rechnungsdatum 0..1 MS and
  ERGPKVDocumentReferenceZahlungszieldatum named zahlungszieldatum 0..1 MS and
  ERGPKVDocumentReferenceGesamtbetrag named gesamtbetrag 0..1 MS
* meta.tag MS
  * ^slicing.discriminator.type = #pattern
  * ^slicing.discriminator.path = "$this"
  * ^slicing.rules = #open
* meta.tag contains ergpkv-status 0..1 MS
* meta.tag[ergpkv-status] from https://gematik.de/fhir/ergpkv/CodeSystem/ergpkv-rechnungsstatus (required)
  * ^comment = "Vgl. Abschnitt 4.4.1 Workflow einer Rechnung des Feature-Dokuments E-Rechnung"
  * system 1.. MS
  * code 1.. MS
* status MS
* status = #current
  * ^short = "Dokumentenstatus"
  * ^comment = "Versionierung von Dokumenten ist nicht unterstützt. Nur jeweils die aktuelle Version des Dokumentes wird akzeptiert."
* identifier 1.. MS
  * ^comment = "Eindeutiger Identifikator vergeben durch das RE-PS (z.B. Interne Dokumentennummer). Das System MUSS eindeutig pro Leistungserbringer:in vergeben werden."
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
  * ^patternCoding.system = "http://dvmd.de/fhir/CodeSystem/kdl"
  * system 1.. MS
  * code 1.. MS
  * display 1.. MS
* description 1..1 MS
  * ^short = "Dokumententitel"
  * ^comment = "Menschenlesbarer Titel des Dokumentes, der dem Versicherten in der UI angezeigt wird. Der Titel kann manuell erfasst oder vom Dateinamen/Metadaten abgeleitet werden. z.B. &quot;Laborbefund vom 28.9.2023&quot;."
* subject 1.. MS
  * display 1..1 MS
* author MS
  * identifier 1.. MS
    * ^comment = "Der Fachdienst verknüpft alle Rechnungsdokumente mit der Telematik-ID des einreichenden Akteurs."
  * identifier only IdentifierTelematikId
  * display 1.. MS
* content 1.. MS
  * ^slicing.discriminator.type = #pattern
  * ^slicing.discriminator.path = "format"
  * ^slicing.rules = #open
* content contains rechnungspdf 0..1 MS and angereicherteRechnung 0..1 MS and strukturierterRechnungsinhalt 0..1 MS and anhang 0..1 MS
* content.attachment.url
  * ^comment = "Der FD muss die Base64-kodierten Daten aus attachment.data extrahieren und in eine Binary-Ressource auslagern."
* content[rechnungspdf]
  * format MS
  * format = https://gematik.de/fhir/ergpkv/CodeSystem/ergpkv-attachment-format-cs#erechnung
  * attachment 1..1 MS
    * contentType 1.. MS
    * contentType = #application/pdf
      * ^comment = "Zum Zeitpunkt der Veröffentlichung werden nur PDF-Dokumente als Rechnung seitens der Leistungserbringer:in unterstützt."
    * data 1.. MS
      * ^comment = "Base64-kodiertes PDF. Dieses Feld muss durch die Applikation der Leistungserbringer:in gefüllt werden."
    * url MS
* content[angereicherteRechnung]
  * format MS
  * format = https://gematik.de/fhir/ergpkv/CodeSystem/ergpkv-attachment-format-cs#angereichertesPDF
  * attachment 1..1 MS
    * contentType 1.. MS
    * contentType = #application/pdf
      * ^comment = "Zum Zeitpunkt der Veröffentlichung werden nur PDF-Dokumente als Rechnung seitens der Leistungserbringer:in unterstützt."
    * data 0..0
      * ^comment = "Die angereicherte Rechnung wird durch den FD direkt als Binary-Ressource unter attachment.url referenziert."
    * url MS
* content[strukturierterRechnungsinhalt]
  * format MS
  * format = https://gematik.de/fhir/ergpkv/CodeSystem/ergpkv-attachment-format-cs#rechnungsinhalt
  * attachment 1..1 MS
    * contentType from ERGPKVRestrictedMimeTypes (required)
    * contentType 1.. MS
      * ^comment = "Strukturierte Rechnungsinhalte können seitens der Leistungserbringer:in sowohl als JSON als auch XML übergeben werden."
    * data 1.. MS
      * ^comment = "Base64-kodierte Repräsentation der Rechnungsinhalte. Dieses Feld muss durch die Applikation der Leistungserbringer:in gefüllt werden."
    * url MS
* content[anhang]
  * format MS
  * format = https://gematik.de/fhir/ergpkv/CodeSystem/ergpkv-attachment-format-cs#rechnungsanhang
  * attachment 1..1 MS
    * contentType = #application/pdf
    * contentType 1.. MS
      * ^comment = "Zum Zeitpunkt der Veröffentlichung werden nur PDF-Dokumente als Rechnungsanhänge seitens der Leistungserbringer:in unterstützt."
    * data 1.. MS
      * ^comment = "Base64-kodiertes PDF. Dieses Feld muss durch die Applikation der Leistungserbringer:in gefüllt werden."
    * url MS
* context MS
  * related 1.. MS 
    * ^comment = "Der Fachdienst verknüpft alle Rechnungsdokumente mit der Rechnungsempfänger:in."
    * ^slicing.discriminator.type = #type
    * ^slicing.discriminator.path = "$this.resolve()"
    *  ^slicing.rules = #open
  * related contains patient 0..1 MS and anhaenge 0..* MS
  * related[patient] only Reference(Patient)
  * related[anhaenge] only Reference(DocumentReference)

// ------------- ValueSets -------------

ValueSet: ERGPKVRestrictedMimeTypes
Id: ergpkv-restricted-mime-types
Title: "ERGPKV Restricted Mime Types"

* include http://terminology.hl7.org/CodeSystem/mimetypes#application/fhir+json
* include http://terminology.hl7.org/CodeSystem/mimetypes#application/fhir+xml

ValueSet: ERGPKVRechnungsstatus
Id: ergpkv-rechnungsstatus
Title: "ERGPKV Rechnungsstatus"

* include codes from system https://gematik.de/fhir/ergpkv/CodeSystem/ergpkv-rechnungsstatus-cs

// ------------- CodeSystem -------------

CodeSystem:  ERGPKVAttachmentFormatCS
Id: ergpkv-attachment-format-cs
Title: "ERGPKV Attachment Format CS"
Description:  "CodeSystem für die Abbildung von verschieden Formatinhalten eines Dokuments"
* #erechnung "E-Rechnungsdokument"
* #angereichertesPDF "E-Rechnungsdokument mit eingebetteten strukturierten Rechnungsinhalt"
* #rechnungsinhalt "Strukturierter Rechnungsinhalt"
* #rechnungsanhang "Rechnungsanhang"

CodeSystem:  ERGPKVARechnungsstatus
Id: ergpkv-rechnungsstatus-cs
Title: "ERGPKV Rechnungsstatus CS"
Description:  "CodeSystem für die Abbildung von verschieden Status eines Rechnungungsdokuments"
* #offen "Offen"
* #erledigt "Erledigt"
* #papierkorb "Papierkorb"

// ------------- Extensions -------------

Extension: ERGPKVDocRefSignature
Id: ergpkv-docref-signature
Title: "ERGPKV DocRef Signature"
Description: "Extension zur Abbildung einer Digitalen Signatur über die Rechnungsrepräsentation, sowie den strukturierten Rechnungsinhalten"

* extension.url = "http://example.org/fhir/StructureDefinition/ergpkv-docref-signature"
* value[x] 1.. MS
* value[x] only Signature

// ------------- Constraints -------------

Invariant: SignaturVerpflichtendRechnung
Description: "Eine Signature muss vorhanden sein, falls es sich bei der DocumentReference um eine Rechnung handelt."
Expression: "type.coding.where(system = 'http://dvmd.de/fhir/CodeSystem/kdl' and code = 'AM010106').exists() implies extension.where(url = 'https://gematik.de/fhir/ergpkv/StructureDefinition/ergpkv-docref-signature').exists()"
Severity: #error

Invariant: RechnungOderAnhang
Description: "Ein Dokument kann entweder ein Anhang enthalten oder ein Rechnungsdokument inkl. strukturierten Rechnungsinhalten."
Expression: "content.format.where(system = 'https://gematik.de/fhir/ergpkv/CodeSystem/ergpkv-attachment-format-cs' and code = 'rechnungsanhang').exists() xor (content.format.where(system = 'https://gematik.de/fhir/ergpkv/CodeSystem/ergpkv-attachment-format-cs' and code = 'erechnung').exists() and  content.format.where(system = 'https://gematik.de/fhir/ergpkv/CodeSystem/ergpkv-attachment-format-cs' and code = 'rechnungsinhalt').exists())"
Severity: #error






