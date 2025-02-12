
Instance: ExampleR5DocumentReference
InstanceOf: ERGDokumentenmetadaten
Title: "Example ERG Document Reference"
* extension[rechnungsdatum].url = "https://gematik.de/fhir/erg/StructureDefinition/erg-documentreference-rechnungsdatum"
* extension[rechnungsdatum].valueDateTime = "2023-09-28T13:00:00.123+02:00"
* extension[zahlungszieldatum].url = "https://gematik.de/fhir/erg/StructureDefinition/erg-documentreference-zahlungszieldatum"
* extension[zahlungszieldatum].valueDateTime = "2023-10-28T13:00:00.123+02:00"
* extension[gesamtbetrag].url = "https://gematik.de/fhir/erg/StructureDefinition/erg-documentreference-gesamtbetrag"
* extension[gesamtbetrag].valueMoney
  * value = 16.20
  * currency = #EUR
* meta.tag[0] = https://gematik.de/fhir/erg/CodeSystem/erg-rechnungsstatus-cs#offen
* meta.tag[0].display = "Offen"
* status = http://hl7.org/fhir/document-reference-status#current
* identifier.system = "http://example.com/fhir/identifiers"
* identifier.value = "123456789"
* type.coding[Rechnungstyp] = http://dvmd.de/fhir/CodeSystem/kdl#AM010106
* type.coding[Rechnungstyp].display = "Rechnung ambulante/stationäre Behandlung"
* description = "Laborbefund vom 28.9.2023"
* subject.display = "Max Mustermann"
* author.identifier.system = "https://gematik.de/fhir/sid/telematik-id"
* author.identifier.value = "987654321"
* author.display = "Dr. Hausarzt"
* content[rechnungspdf].format = https://gematik.de/fhir/erg/CodeSystem/erg-attachment-format-cs#erechnung
* content[rechnungspdf].attachment.contentType = #application/pdf
* content[rechnungspdf].attachment.data = "DIESISTNUREINBEISPIELDIESISTKEINVALIDESPDF00"
* content[rechnungspdf].attachment.url = "http://example.com/fhir/binary/123"
* content[angereicherteRechnung].format = https://gematik.de/fhir/erg/CodeSystem/erg-attachment-format-cs#angereichertesPDF
* content[angereicherteRechnung].attachment.contentType = #application/pdf
* content[angereicherteRechnung].attachment.url = "http://example.com/fhir/binary/456"
* content[strukturierterRechnungsinhalt].format = https://gematik.de/fhir/erg/CodeSystem/erg-attachment-format-cs#rechnungsinhalt
* content[strukturierterRechnungsinhalt].attachment.contentType = #application/json
* content[strukturierterRechnungsinhalt].attachment.data = "DIESISTNUREINBEISPIELDIESISTKEINVALIDESPDF00"
* content[strukturierterRechnungsinhalt].attachment.url = "http://example.com/fhir/binary/789"
* content[anhang].format = https://gematik.de/fhir/erg/CodeSystem/erg-attachment-format-cs#rechnungsanhang
* content[anhang].attachment.contentType = #application/pdf
* content[anhang].attachment.data = "DIESISTNUREINBEISPIELDIESISTKEINVALIDESPDF00"
* content[anhang].attachment.url = "http://example.com/fhir/binary/101112"

Instance: ExampleR5Bundle
InstanceOf: Bundle
* type = #searchset
* total = 1
* entry[+]
  * resource = ExampleR5DocumentReference
  * search.mode = #match