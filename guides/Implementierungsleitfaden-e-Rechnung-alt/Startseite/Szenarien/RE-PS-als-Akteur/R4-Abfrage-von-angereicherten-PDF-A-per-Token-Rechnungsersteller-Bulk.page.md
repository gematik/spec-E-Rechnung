---
expand: 2
topic: AF_10271-Bulk
---

## {{page-title}}

Die nachfolgende Interaktion ist relevant für den FD als Server, sowie für das RE-PS als Client. Anwendungsfall AF_10271 MUSS durch den FD über die spezifizierte API umgesetzt werden. Die Vorgaben aus "Tabelle 17: Use Case Abfrage von angereicherten PDF/A per Token (Rechnungsersteller)" des Feature-Dokumentes MÜSSEN eingehalten werden durch den FD.

|||
|-|-|
|HTTP-Methode|POST|
|Endpunkt|/ (Root-Endpunkt)|

Für die Ausführung der Operation gelten die gleichen Vorgaben wie aus {{pagelink:AF_10136}}. Die Operation `$retrieve` kann für innerhalb eines Batch-Bundles mehrfach, auch für unterschiedliche Dokumente aufgerufen werden. Es gelten die entsprechenden Vorgaben aus der [FHIR-Kernspezifikation](https://www.hl7.org/fhir/r4/http.html#transaction).

### Beispiel

```
HTTP GET [fachdienst-endpunkt]/
```

<tabs>
    <tab title="Parameter-Input">      
        {{render:Resources/fsh-generated/resources/Bundle-BulkRetrieveExampleInput.json}}
    </tab>
    <tab title="XML">      
        {{xml:Resources/fsh-generated/resources/Bundle-BulkRetrieveExampleInput.json}}
    </tab>
    <tab title="JSON">
        {{json:Resources/fsh-generated/resources/Bundle-BulkRetrieveExampleInput.json}}
    </tab>
    <tab title="Link">
        {{link:Resources/fsh-generated/resources/Bundle-BulkRetrieveExampleInput.json}}
    </tab>
</tabs>

Antwort des Fachdienstes im Erfolgsfall:

```
HTTP 200 OK
```
mit Body:

<tabs>
    <tab title="Parameter-Input">      
        {{render:Resources/fsh-generated/resources/Bundle-BulkRetrieveExampleOutput.json}}
    </tab>
    <tab title="XML">      
        {{xml:Resources/fsh-generated/resources/Bundle-BulkRetrieveExampleOutput.json}}
    </tab>
    <tab title="JSON">
        {{json:Resources/fsh-generated/resources/Bundle-BulkRetrieveExampleOutput.json}}
    </tab>
    <tab title="Link">
        {{link:Resources/fsh-generated/resources/Bundle-BulkRetrieveExampleOutput.json}}
    </tab>
</tabs>