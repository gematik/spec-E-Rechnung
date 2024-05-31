Instance: BeispielParameterProcessFlagInput
InstanceOf: Parameters
* parameter[+]
  * name = "tag"
  * valueCoding
    * system = Canonical(ERGPKVRechnungMarkierungCS)
    * code = #bezahlt

Instance: BeispielParameterProcessFlagOutput
InstanceOf: Parameters
* parameter[+]
  * name = "meta"
  * valueMeta
    * versionId = "1"
    * lastUpdated = "2024-05-11T13:00:00.123+02:00"
    * tag[+]
      * system = "https://gematik.de/fhir/ergpkv/CodeSystem/ergpkv-rechnungsstatus-cs"
      * code = #erledigt
    * extension[+]
      * url = Canonical(ERGPKVDocumentReferenceMarkierung)
      * valueCoding
        * system = Canonical(ERGPKVRechnungMarkierungCS)
        * code = #bezahlt