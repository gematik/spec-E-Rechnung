Instance: R2444Rechnung
InstanceOf: Invoice
Usage: #example
* extension[+]
  * url = Canonical(ExtensionBehandlungsart)
  * valueCoding = BehandlungsartCS#AMB
* identifier[+]
  * type = http://fhir.de/CodeSystem/identifier-type-de-basis#invoice
  * system = "http://Orthoschmerz.de/fhir/patienten"
  * value = "2-444"
* type = https://gematik.de/fhir/ergpkv/CodeSystem/ergpkv-rechnung-type-cs#erechnung
* status = http://hl7.org/fhir/invoice-status#issued
* participant
  * role = http://snomed.info/sct#39607008
  * actor = Reference(R2444Practitioner)
* recipient = Reference(R2444PKVersichertePerson)
* recipient
  * identifier[+]
    * type = http://fhir.de/CodeSystem/identifier-type-de-basis#KVZ10
    * system = "http://fhir.de/sid/gkv/kvid-10"
    * value = "A000111222000333444"
  * display = "Emilia Schmitt"
* subject.display = "Emilia Schmitt"
* date = 2024-03-20
* issuer
  * identifier[+]
    * type = http://terminology.hl7.org/CodeSystem/v2-0203#PRN
    * system = "https://gematik.de/fhir/sid/telematik-id"
    * value = "11223344"
  * display = "Frau, Dr. med., Olivia, Orthoschmerz"
* lineItem.chargeItemReference = Reference(R2444ChargeItem)
* totalNet
  * value = 13.71
  * currency = #EUR
* totalGross
  * value = 16.32
  * currency = #EUR
* paymentTerms = "
**Bankinformationen:**

- **Kontoinhalberin:** `Dr. med. Olivia Orthoschmerz`
- **IBAN:** `DE00 100 200 300 400 67`
- **BIC:** `MUSTERBIC11`
- **Name der Bank:** Musterbank AG
- **Verwendungszweck:** z.B. Rechnungs-Nr. 2-444
"
* paymentTerms.extension
  * url = Canonical(ERGZahlungsziel)
  * valueDate = 2024-04-19

Instance: R2444ChargeItem
InstanceOf: ERGRechnungsposition
Usage: #example
* status = #billable
* code.coding
  * system = "http://fhir.de/CodeSystem/bäk/goä"
  * code = #5
* code.text = "Symptombezogene Untersuchung"
* subject = Reference(R2444PKVersichertePerson)
* subject.display = "Emilia Schmitt"
* occurrencePeriod.start = 2024-03-20
* quantity.value = 1
* factorOverride = 3.5
* priceOverride.value = 16.32
* extension[unitPriceComponent]
  * extension[type].valueCode = #tax

Instance: R2444PKVersichertePerson
InstanceOf: ERGersichertePerson
Usage: #example
* identifier
  * type = http://fhir.de/CodeSystem/identifier-type-de-basis#KVZ10
  * system = "http://fhir.de/sid/gkv/kvid-10"
  * value = "A000111222000333444"
* active = true 
* name
  * family = "Schmitt"
  * given = "Emilia"
  * text = "Emilia Schmitt"
* birthDate = 2005-02-01

Instance: R2444Diagnose
InstanceOf: Condition
Usage: #example
* code.coding
  * system = "http://fhir.de/CodeSystem/bfarm/icd-10-gm"
  * code = #M54.5
  * version = "2024"
  * display = "Verdacht auf Kreuzschmerz"
* subject = Reference(R2444PKVersichertePerson)
* recordedDate = 2024-03-20

Instance: R2444Practitioner
InstanceOf: Practitioner
Usage: #example
* identifier[+]
  * type = http://terminology.hl7.org/CodeSystem/v2-0203#PRN
  * system = "https://gematik.de/fhir/sid/telematik-id"
  * value = "11223344"
* address
  * use = #official
  * type = #physical
  * line[+] = "Marktplatz 2"
  * line.extension[+]
    * url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-streetName"
    * valueString = "Marktplatz"
  * line.extension[+]
    * url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-houseNumber"
    * valueString = "2"
  * postalCode = "12345"
  * city = "Musterstadt"
* name
  * text = "Frau, Dr. med., Olivia, Orthoschmerz"
  * family = "Orthoschmerz"
  * given = "Olivia"
  * prefix[+] = "Dr"
  * prefix[+] = "med"
* gender = #female
* qualification[+].code.coding[+]
  * system = "urn:oid:1.2.276.0.76.5.514"
  * code =  #71103
  * display = "FA Orthopädie und Unfallchirurgie"

Extension: ExtensionBehandlungsart
Id: ExtensionBehandlungsart
Title: "Extension Behandlungsart"
* value[x] only Coding
* valueCoding from BehandlungsartVS

CodeSystem: BehandlungsartCS
Id: BehandlungsartCS
Title: "Behandlungsart"
* #AMB "Ambulante Behandlung"

ValueSet: BehandlungsartVS
Id: BehandlungsartVS
Title: "Behandlungsart"
Description: "Diese Codes enthalten Behandlungsarten"
* include codes from system BehandlungsartCS

Instance: R2444Document
InstanceOf: Composition
Usage: #example
* status = #final
* type.coding = https://gematik.de/fhir/ergpkv/CodeSystem/ergpkv-rechnung-type-cs#erechnung
* date = 2024-03-20
* author = Reference(R2444Practitioner)
* title = "Zusammenfassung strukturierte Daten Rechnung 4-222"
* section[+]
  * title = "Rechnung"
  * entry = Reference(R2444Rechnung)
  * section[+]
    * title = "Position 1"
    * entry = Reference(R2444ChargeItem)
* section[+]
  * title = "Diagnose"
  * entry = Reference(R2444Diagnose)
* section[+]
  * title = "Versicherte Person"
  * entry = Reference(R2444PKVersichertePerson)
* section[+]
  * title = "Beteiligter Leistungserbringer"
  * entry = Reference(R2444Practitioner)

Instance: R2444Bundle
InstanceOf: Bundle
Usage: #example
* type = #document
* entry[+]
  * fullUrl = "Composition/R2444Document"
  * resource = R2444Document
* entry[+]
  * fullUrl = "Invoice/R2444Rechnung"
  * resource = R2444Rechnung
* entry[+]
  * fullUrl = "ChargeItem/R2444ChargeItem"
  * resource = R2444ChargeItem
* entry[+]
  * fullUrl = "Condition/R2444Diagnose"
  * resource = R2444Diagnose
* entry[+]
  * fullUrl = "Patient/R2444PKVersichertePerson"
  * resource = R2444PKVersichertePerson
* entry[+]
  * fullUrl = "Practitioner/R2444Practitioner"
  * resource = R2444Practitioner