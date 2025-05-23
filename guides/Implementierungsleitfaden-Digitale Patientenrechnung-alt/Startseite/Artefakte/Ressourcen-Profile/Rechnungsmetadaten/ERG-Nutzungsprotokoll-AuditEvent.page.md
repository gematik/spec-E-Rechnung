---
canonical: https://gematik.de/fhir/erg/StructureDefinition/erg-nutzungsprotokoll
expand: 1
---

## {{link}}

### Metadaten

@```
from
	StructureDefinition
where
	url = 'https://gematik.de/fhir/erg/StructureDefinition/erg-nutzungsprotokoll'
select
	Canonical: url, Status: status, Version: version, Basis: baseDefinition
```

### Inhalt

<tabs>
  <tab title="Darstellung">{{tree, buttons}}</tab>
  <tab title="Beschreibung"> 
        @```
        from
	        StructureDefinition
        where
	        url = 'https://gematik.de/fhir/erg/StructureDefinition/erg-nutzungsprotokoll'
        select
	        Beschreibung: description
        with
            no header
        ```
        @```
        from 
            StructureDefinition 
        where 
            url = 'https://gematik.de/fhir/erg/StructureDefinition/erg-nutzungsprotokoll' 
        for 
            differential.element 
            where 
                mustSupport = true 
            select Feldname: id, Kurzbeschreibung: short, Hinweise: comment
        ```
  </tab>
  <tab title="XML">{{xml}}</tab>
  <tab title="JSON">{{json}}</tab>
  <tab title="Link">{{link}}</tab>
</tabs>