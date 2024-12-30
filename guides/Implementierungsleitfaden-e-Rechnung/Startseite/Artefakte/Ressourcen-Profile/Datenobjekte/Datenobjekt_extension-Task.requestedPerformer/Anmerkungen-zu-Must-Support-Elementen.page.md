---
topic: ERGTaskRequestedPerformer-MS
canonical: http://hl7.org/fhir/5.0/StructureDefinition/extension-Task.requestedPerformer
---

### Anmerkungen zu Must-Support-Feldern

<fql>
from
	StructureDefinition
where 
    url = %canonical
for differential.element
where mustSupport = true
select
	Feldname: id, Kurzbeschreibung: short, Hinweise: comment
</fql>

