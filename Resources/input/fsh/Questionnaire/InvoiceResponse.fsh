Alias: $icd-10-gm = http://fhir.de/CodeSystem/dimdi/icd-10-gm

RuleSet: addAnswerDecimal(decimal, linkId, text)
* insert addAnswer({linkId}, {text})
* answer.valueDecimal = {decimal}

RuleSet: addAnswerString(string, linkId, text)
* insert addAnswer({linkId}, {text})
* answer.valueString = {string}

RuleSet: addAnswerDate(date, linkId, text)
* insert addAnswer({linkId}, {text})
* answer.valueDate = {date}

RuleSet: addAnswerCoding(codingDisplay, linkId, text)
* insert addAnswer({linkId}, {text})
* answer.valueCoding.display = {codingDisplay}

RuleSet: addAnswer(linkId, text) 
* linkId = {linkId}
* text = {text}

Instance: undefined
InstanceOf: QuestionnaireResponse
Usage: #example
* meta.profile = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaireresponse|3.0"
* meta.tag.code = #"lformsVersion: 36.0.0"
* status = #completed
* authored = "2024-04-13T12:43:44.270Z"
* questionnaire = "http://gefyra.de/fhir/sdc/Questionnaire/Invoice"
* item[+] insert addAnswerCoding("ambulante Behandlung", "behandlungsart", "Behandlungsart")
* item[+] insert addAnswerDate("2024-03-20", "BT-73", "Startdatum")
* item[+] insert addAnswerDate("2024-03-20", "BT-74", "Enddatum")
* item[+] insert addAnswerCoding($icd-10-gm#F71 "Mittlere Intelligenzminderung", "diagnose-code", "ICD-10-Diagnose")
* item[+] insert addAnswerString("Kreuzschmerz", "diagnose-text", "Freitext-Diagnose")
* item[+] insert addAnswerString("11223344", "BT-29", "Telematik-ID")
* item[+] insert addAnswerCoding("Frau", "behandler-anrede", "Anrede")
* item[+] insert addAnswerString("Dr. med.", "behandler-titel", "Titel")
* item[+] insert addAnswerString("Olivia Orthoschmerz", "BT-41", "Name")
* item[+] insert addAnswerString("Marktplatz 2", "BT-35", "Straße und Hausnummer")
* item[+] insert addAnswerString("12345", "BT-38", "PLZ")
* item[+] insert addAnswerString("Musterstadt", "BT-37", "Ort")
* item[+] insert addAnswerString("A000111222000333444", "BT-71", "Versicherten-Nummer")
* item[+] insert addAnswerString("Emilia Schmitt", "BT-70", "Name")
* item[+] insert addAnswerDate("2005-02-01", "behandelteperson-geburtsdatum", "Geburtsdatum")
* item[+] insert addAnswerDate("2024-03-20", "BT-2", "Rechnungsdatum")
* item[+] insert addAnswerString("2-444", "BT-1", "Rechnungsnummer")
* item[+] insert addAnswerDecimal(16.32, "BT-106", "Gesamtsumme")
* item[+] insert addAnswerDate("2024-03-20", "rechnungsposition-datum", "Datum")
* item[+] insert addAnswerCoding("GOÄ", "gebuehrenordnung", "Gebührenordnung")
* item[+] insert addAnswerString("5", "BT-155", "Ziffer")
* item[+] insert addAnswerString("Symptombezogene Untersuchung", "BT-153", "Leistungsbezeichnung")
* item[+] insert addAnswerDecimal(16.32, "BT-131", "Gesamtpreis")
* item[+] insert addAnswerString("Dr. med. Olivia Orthoschmerz", "BT-85", "Kontoinhaber")
* item[+] insert addAnswerString("DE00 100 200 300 400 67", "BT-84", "IBAN")
* item[+] insert addAnswerString("MUSTERBIC11", "BT-86", "BIC")
* item[+] insert addAnswerString("Musterbank AG", "zahlungsdaten-bank", "Name der Bank")
* item[+] insert addAnswerString("2-444", "BT-83", "Verwendungszweck")
