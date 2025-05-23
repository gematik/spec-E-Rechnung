Instance: BeispielNutzungsprotokoll
InstanceOf: ERGNutzungsprotokoll
* type = #rest
* subtype = #dipag-submit
* action = #C
* recorded = "2024-05-29T11:25:54.123456+00:02"
* outcome = #0
* agent.type = #humanuser
* agent.who.identifier
  * type = http://terminology.hl7.org/CodeSystem/v2-0203#PRN
  * system = "https://gematik.de/fhir/sid/telematik-id"
  * value = "11223344"
* agent.who.display = "Beispiel Leistungsempfänmger"
* agent.requestor = true
* source.observer.display = "FdV"
* entity.what = Reference(BeispielDocumentReferenceRechnungRetrieve)

Instance: BeispielNutzungsprotokollResultBundle
InstanceOf: Bundle
* type = #searchset
* total = 1
* entry[+].fullUrl = "[fachdienst-endpunkt]/AuditEvent/BeispielNutzungsprotokoll"
* entry[=].resource = BeispielNutzungsprotokoll
* entry[=].search.mode = #match