Instance: BeispielParameterProcessFlagInput
InstanceOf: Parameters
* parameter[+]
  * name = "markierung"
  * valueCoding
    * system = Canonical(ERGRechnungMarkierungCS)
    * code = #bezahlt
* parameter[+]
  * name = "zeitpunkt"
  * valueDateTime = "2024-05-30T13:00:00.001+02:00"
* parameter[+]
  * name = "details"
  * valueString = "Bezahlt mit falschem Betreff"


Instance: BeispielParameterProcessFlagOutput
InstanceOf: Parameters
* parameter[+]
  * name = "meta"
  * valueMeta
    * versionId = "2"
    * lastUpdated = "2024-05-31T13:00:00.123+02:00"
    * tag[+]
      * system = "https://gematik.de/fhir/erg/CodeSystem/erg-rechnungsstatus-cs"
      * code = #erledigt
    * extension[+]
      * url = Canonical(ERGDocumentReferenceMarkierung)
      * extension[+]
        * url = "markierung"
        * valueCoding
          * system = Canonical(ERGRechnungMarkierungCS)
          * code = #bezahlt
      * extension[+]
        * url = "zeitpunkt"
        * valueDateTime = "2024-05-30T13:00:00.123+02:00"
      * extension[+]
        * url = "details"
        * valueString = "Bezahlt mit falschem Betreff"