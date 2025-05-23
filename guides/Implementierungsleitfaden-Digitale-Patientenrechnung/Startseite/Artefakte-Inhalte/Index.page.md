---
canonical1: https://gematik.de/fhir/dipag/StructureDefinition/dipag-institution
canonical2: https://gematik.de/fhir/dipag/StructureDefinition/dipag-person
canonical3: https://gematik.de/fhir/dipag/StructureDefinition/dipag-patient
canonical4: https://gematik.de/fhir/dipag/StructureDefinition/dipag-rechnung
canonical5: https://gematik.de/fhir/dipag/StructureDefinition/dipag-rechnungsposition
canonical6: https://gematik.de/fhir/dipag/StructureDefinition/dipag-rechnungsdiagnose
canonical7: https://gematik.de/fhir/dipag/StructureDefinition/dipag-rechnungsprozedur
---
## {{page-title}}

{{index:current}}

## Zuordnung Rechnungsinhalte zum FHIR Element

<fql>
from
	StructureDefinition
where 
    url = %canonical1
or
    url = %canonical2
or
    url = %canonical3
or
    url = %canonical4
or
    url = %canonical5
or
    url = %canonical6
or
    url = %canonical7
for differential.element
where mustSupport = true
and short.exists()
select
	Kurzbeschreibung: short, Feldname: id, Hinweise: comment
</fql>