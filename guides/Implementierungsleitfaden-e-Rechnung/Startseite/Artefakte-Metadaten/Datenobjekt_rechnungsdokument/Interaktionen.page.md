---
topic: ERGRechnungsdokument-Interaktionen
canonical: https://gematik.de/fhir/erg/StructureDefinition/erg-rechnungsdokument
---
### Interaktionen

<fql output="inline">
from
    CapabilityStatement
where
    url = %capability
for rest.resource.where(%canonical in supportedProfile)
select
    documentation
with
    no header
</fql>

<tabs>
    <tab title="Interaktionen"> 
        {{page:FQL-Capability-REST}}
    </tab>
    <tab title="Suchparameter">
        {{page:FQL-Capability-Search}}
    </tab>
    <tab title="Operationen">
        {{page:FQL-Capability-Operations}}
    </tab>
    <tab title="Link">
        {{pagelink:CapabilityStatement}}
    </tab>
</tabs>



