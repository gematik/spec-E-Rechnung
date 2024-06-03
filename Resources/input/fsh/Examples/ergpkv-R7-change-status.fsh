Instance: BeispielParameterChangeStatusInput
InstanceOf: Parameters
* parameter[+]
  * name = "tag"
  * valueCode = #erledigt

Instance: BeispielParameterChangeStatusOutput
InstanceOf: Parameters
* parameter[+]
  * name = "meta"
  * valueMeta = BeispielMetaChangeStatusOutput

Instance: BeispielMetaChangeStatusOutput
InstanceOf: Meta
Usage: #inline
* versionId = "1"
* lastUpdated = "2024-05-11T13:00:00.123+02:00"
* tag[+]
  * system = "https://gematik.de/fhir/erg/CodeSystem/erg-rechnungsstatus-cs"
  * code = #erledigt