---
expand: 2
topic: AF_10180
---

## {{page-title}}

Die nachfolgende Interaktion ist relevant für den FD als Server, sowie für das ITSys-KTR als Client. Anwendungsfall AF_10180 MUSS durch den FD über die spezifizierte API umgesetzt werden. Die Vorgaben aus "Tabelle 29: Use Case Abfrage von Daten zu Rechnungen und Dokumenten per Token (Kostenträger)" des Feature-Dokumentes MÜSSEN eingehalten werden durch den FD.

|||
|-|-|
|HTTP-Methode|POST oder GET|
|Endpunkt|/DocumentReference/$retrieve|

Die Input- und Output-Parameter werden durch die OperationDefinition `https://gematik.de/fhir/ergpkv/OperationDefinition/Retrieve` beschrieben.

{{render:https://gematik.de/fhir/erg/OperationDefinition/Retrieve}}

|API-Zustand|HTTP-Status-Code|
|-|-|
|Erfolgsfall|`200 - OK`|
|Weitere Parameter in HTTP-Anfrage enthalten|`400 - Bad Request`|
|Syntax für Parameter ist nicht korrekt oder Kardinalitäten werden nicht eingehalten|`400 - Bad Request`|
|Kein valides Access-Token wird mitgesendet|`401 - Unauthorized`|
|Autorisierter Benutzer verfügt über keine ausreichende Berechtigung die Interaktion auszuführen|`403 - Forbidden`|
|Fehlende Berechtigung für die Krankenkasse das Dokument abzurufen (z.B. falls ein invalides Rechnungstoken verwendet wird)|`404 - Not Found`|
|Dokumnent kann anhand des Rechnungstokens nicht gefunden werden|`404 - Not Found`|
|Andere HTTP-Methode wird verwendet|`405 - Method Not Allowed`|

Die DocumentReference-Ressource KANN direkt an den Client zurückgegeben werden ohne, dass diese in eine Parameter-Ressource eingebettet wird.

### Beispiele

```
HTTP GET [fachdienst-endpunkt]/DocumentReference/$retrieve
```

<tabs>
    <tab title="Parameter-Input">      
        {{render:Resources/fsh-generated/resources/Parameters-BeispielParameterRetrieveInput.json}}
    </tab>
    <tab title="XML">      
        {{xml:Resources/fsh-generated/resources/Parameters-BeispielParameterRetrieveInput.json}}
    </tab>
    <tab title="JSON">
        {{json:Resources/fsh-generated/resources/Parameters-BeispielParameterRetrieveInput.json}}
    </tab>
    <tab title="Link">
        {{link:Resources/fsh-generated/resources/Parameters-BeispielParameterRetrieveInput.json}}
    </tab>
</tabs>

Antwort des Fachdienstes im Erfolgsfall:

```
HTTP 200 OK
```
mit Body:

<tabs>
    <tab title="Parameter-Input">      
        {{render:Resources/fsh-generated/resources/DocumentReference-BeispielDocumentReferenceRechnungRetrieve.json}}
    </tab>
    <tab title="XML">      
        {{xml:Resources/fsh-generated/resources/DocumentReference-BeispielDocumentReferenceRechnungRetrieve.json}}
    </tab>
    <tab title="JSON">
        {{json:Resources/fsh-generated/resources/DocumentReference-BeispielDocumentReferenceRechnungRetrieve.json}}
    </tab>
    <tab title="Link">
        {{link:Resources/fsh-generated/resources/DocumentReference-BeispielDocumentReferenceRechnungRetrieve.json}}
    </tab>
</tabs>

### Verarbeitungsschritte im FD

* Es gelten die Festlegungen der [FHIR-Kernspezifikation zur Handhabung von Binary-Ressourcen](https://www.hl7.org/fhir/r4/binary.html#rest).

----

