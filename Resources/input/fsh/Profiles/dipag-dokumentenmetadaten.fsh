// ------------- Profile -------------
Alias: $kdl = http://dvmd.de/fhir/CodeSystem/kdl

Profile: DiPagDokumentenmetadaten
Title: "Digitale Patientenrechnung Dokumentenmetadaten"
Parent: DocumentReference
Id: dipag-dokumentenmetadaten
* insert Meta
* obeys SignaturVerpflichtendRechnung
* obeys RechnungOderAnhang
* extension MS
* extension contains 
  DiPagDocRefSignature named docRef-signature 0..1 MS and
  DiPagDocumentReferenceRechnungsdatum named rechnungsdatum 0..1 MS and
  DiPagDocumentReferenceZahlungszieldatum named zahlungszieldatum 0..1 MS and
  DiPagDocumentReferenceGesamtbetrag named gesamtbetrag 0..1 MS and
  DiPagDocRefFachrichtung named fachrichtung 0..1 MS and
  DiPagDocRefLeistungsart named leistungsart 0..1 MS and
  DiPagBehandlungsart named behandlungsart 0..1 MS
* extension[rechnungsdatum]
  * ^comment = "Siehe Abschnitt '4.8.1.1 Rechnung' des Feature-Dokuments Digitale Patientenrechnung"
* extension[zahlungszieldatum]
  * ^comment = "Siehe Abschnitt '4.8.1.1 Rechnung' des Feature-Dokuments Digitale Patientenrechnung"
* extension[gesamtbetrag]
  * ^comment = "Siehe Abschnitt '4.8.1.1 Rechnung' des Feature-Dokuments Digitale Patientenrechnung"
* meta.extension MS
* meta.extension contains DiPagDocumentReferenceMarkierung named markierung 0..* MS
* meta.extension[markierung]
  * ^comment = "Vgl. Abschnitt '4.4.2 Markierungen' des Feature-Dokuments Digitale Patientenrechnung"
* meta.tag MS
  * ^slicing.discriminator.type = #pattern
  * ^slicing.discriminator.path = "$this"
  * ^slicing.rules = #open
* meta.tag contains dipag-rechnungsstatus 0..1 MS
  * ^comment = "Metaangaben zur Digitale Patientenrechnung die sich auf das Rechnungsdokument als Ganzes beziehen und nicht Teil des durch den RE-PS erstellten Dokuments sind."
* meta.tag[dipag-rechnungsstatus] from DiPagRechnungsstatusVS (required)
  * ^comment = "Vgl. Abschnitt 4.4.1 Workflow einer Rechnung des Feature-Dokuments Digitale Patientenrechnung"
  * system 1.. MS
  * code 1.. MS
* status MS
* status = #current
  * ^comment = "Versionierung von Dokumenten ist nicht unterstützt. Nur jeweils die aktuelle Version des Dokumentes wird akzeptiert."
* identifier 1.. MS
  * ^comment = "Eindeutiger Identifikator vergeben durch das RE-PS (z.B. Interne Dokumentennummer). Das System MUSS eindeutig pro Leistungserbringer:in vergeben werden."
  * system 1.. MS
  * value 1.. MS
* type 1.. MS
  * ^comment = "Kodierung des Dokumentes als 'Rechnung', sowie darüber hinausgehende Klassifizierung per KDL"
* type.coding 1.. 
  * ^slicing.discriminator.type = #pattern
  * ^slicing.discriminator.path = "$this"
  * ^slicing.rules = #open
* type.coding contains DokumentenKlassifizierung 0..1 MS and Rechnungstyp 0..1 MS
* type.coding[DokumentenKlassifizierung] from DiPagSonstigesDokumentTypeVS (required)
  * ^patternCoding.system = "http://dvmd.de/fhir/CodeSystem/kdl"
  * system 1.. MS
  * code 1.. MS
  * display 1.. MS
* type.coding[Rechnungstyp] 
  * ^patternCoding.system = "http://dvmd.de/fhir/CodeSystem/kdl"
  * ^patternCoding.code = #AM010106
* description 1..1 MS
  * ^comment = "Menschenlesbarer Titel des Dokumentes, der dem Versicherten in der UI angezeigt wird. Der Titel kann manuell erfasst oder vom Dateinamen/Metadaten abgeleitet werden. z.B. &quot;Laborbefund vom 28.9.2023&quot;."
* subject 1.. MS
  * ^comment = "Vollständiger Name der behandelten Person. Siehe Abschnitt '4.8.1.1 Rechnung' des Feature-Dokuments Digitale Patientenrechnung."
  * display 1..1 MS
* author MS
  * ^comment = "Der Fachdienst verknüpft alle Rechnungsdokumente mit der Telematik-ID des einreichenden Akteurs."
  * identifier 1.. MS
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
  * format = https://gematik.de/fhir/dipag/CodeSystem/dipag-attachment-format-cs#dipag
  * attachment 1..1 MS
    * contentType 1.. MS
    * contentType = #application/pdf
      * ^comment = "Zum Zeitpunkt der Veröffentlichung werden nur PDF-Dokumente als Rechnung seitens der Leistungserbringer:in unterstützt."
    * data 1.. MS
      * ^comment = "Base64-kodiertes PDF. Dieses Feld muss durch die Applikation der Leistungserbringer:in gefüllt werden."
    * url MS
* content[angereicherteRechnung]
  * format MS
  * format = https://gematik.de/fhir/dipag/CodeSystem/dipag-attachment-format-cs#angereichertesPDF
  * attachment 1..1 MS
    * contentType 1.. MS
    * contentType = #application/pdf
      * ^comment = "Zum Zeitpunkt der Veröffentlichung werden nur PDF-Dokumente als Rechnung seitens der Leistungserbringer:in unterstützt."
    * data 0..0
      * ^comment = "Die angereicherte Rechnung wird durch den FD direkt als Binary-Ressource unter attachment.url referenziert."
    * url MS
* content[strukturierterRechnungsinhalt]
  * format MS
  * format = https://gematik.de/fhir/dipag/CodeSystem/dipag-attachment-format-cs#rechnungsinhalt
  * attachment 1..1 MS
    * contentType from DiPagRestrictedMimeTypesVS (required)
    * contentType 1.. MS
      * ^comment = "Strukturierte Rechnungsinhalte können seitens der Leistungserbringer:in sowohl als JSON als auch XML übergeben werden."
    * data 1.. MS
      * ^comment = "Base64-kodierte Repräsentation der Rechnungsinhalte. Dieses Feld muss durch die Applikation der Leistungserbringer:in gefüllt werden."
    * url MS
* content[anhang]
  * format MS
  * format = https://gematik.de/fhir/dipag/CodeSystem/dipag-attachment-format-cs#rechnungsanhang
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
  * related contains patient 1..1 MS and anhaenge 0..* MS
  * related[patient] only Reference(Patient)
  * related[anhaenge] only Reference(DocumentReference)

// ------------- ValueSets -------------

ValueSet: DiPagRestrictedMimeTypesVS
Id: dipag-restricted-mime-types-vs
Title: "Digitale Patientenrechnung Restricted Mime Types"
* insert Meta

* include http://terminology.hl7.org/CodeSystem/mimetypes#application/fhir+json
* include http://terminology.hl7.org/CodeSystem/mimetypes#application/fhir+xml

ValueSet: DiPagRechnungsstatusVS
Id: dipag-rechnungsstatus-vs
Title: "Digitale Patientenrechnung Rechnungsstatus"
* insert Meta
* include codes from system https://gematik.de/fhir/dipag/CodeSystem/dipag-rechnungsstatus-cs

// ------------- CodeSystem -------------

CodeSystem:  DiPagAttachmentFormatCS
Id: dipag-attachment-format-cs
Title: "Digitale Patientenrechnung Attachment Format CS"
Description:  "CodeSystem für die Abbildung von verschieden Formatinhalten eines Dokuments"
* insert Meta
* #dipag "Digitale Patientenrechnungs Dokument"
* #angereichertesPDF "Digitale Patientenrechnungs Dokument mit eingebetteten strukturierten Rechnungsinhalt"
* #rechnungsinhalt "Strukturierter Rechnungsinhalt"
* #rechnungsanhang "Rechnungsanhang"

CodeSystem:  DiPagARechnungsstatusCS
Id: dipag-rechnungsstatus-cs
Title: "Digitale Patientenrechnung Rechnungsstatus CS"
Description:  "CodeSystem für die Abbildung von verschieden Status eines Rechnungungsdokuments"
* insert Meta
* #offen "Offen"
* #erledigt "Erledigt"
* #papierkorb "Papierkorb"

// ------------- Extensions -------------

Extension: DiPagDocRefSignature
Id: dipag-docref-signature
Title: "Digitale Patientenrechnung DocRef Signature"
Description: "Extension zur Abbildung einer Digitalen Signatur über die Rechnungsrepräsentation, sowie den strukturierten Rechnungsinhalten"
* insert Meta

* value[x] 1.. MS
* value[x] only Signature

Extension: DiPagDocRefFachrichtung
Id: dipag-docref-fachrichtung
Title: "Digitale Patientenrechnung DocRef Fachrichtung"
Description: "Extension zur Angabe der Fachrichtung zur Steuerung des Abrechungsworkflows"
* insert Meta

* value[x] 1.. MS
* value[x] only Coding
* value[x] from http://ihe-d.de/ValueSets/IHEXDSpracticeSettingCode (required)

Extension: DiPagDocRefLeistungsart
Id: dipag-docref-leistungsart
Title: "Digitale Patientenrechnung DocRef Leistungsart"
Description: "Extension zur Angabe einer Leistungsart"
* insert Meta

* value[x] 1.. MS
* value[x] only Coding

// ------------- Constraints -------------

Invariant: SignaturVerpflichtendRechnung
Description: "Eine Signature muss vorhanden sein, falls es sich bei der DocumentReference um eine Rechnung handelt."
Expression: "type.coding.where(system = 'http://dvmd.de/fhir/CodeSystem/kdl' and code = 'AM010106').exists() implies extension.where(url = 'https://gematik.de/fhir/dipag/StructureDefinition/dipag-docref-signature').exists()"
Severity: #error

Invariant: RechnungOderAnhang
Description: "Ein Dokument kann entweder ein Anhang enthalten oder ein Rechnungsdokument inkl. strukturierten Rechnungsinhalten."
Expression: "content.format.where(system = 'https://gematik.de/fhir/dipag/CodeSystem/dipag-attachment-format-cs' and code = 'rechnungsanhang').exists() xor (content.format.where(system = 'https://gematik.de/fhir/dipag/CodeSystem/dipag-attachment-format-cs' and code = 'dipag').exists() and  content.format.where(system = 'https://gematik.de/fhir/dipag/CodeSystem/dipag-attachment-format-cs' and code = 'rechnungsinhalt').exists())"
Severity: #error






