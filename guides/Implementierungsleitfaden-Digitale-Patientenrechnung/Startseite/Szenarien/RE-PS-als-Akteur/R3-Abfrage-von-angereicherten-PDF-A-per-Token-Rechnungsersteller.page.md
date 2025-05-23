---
expand: 2
topic: AF_10271
---

## {{page-title}}

Die nachfolgende Interaktion ist relevant für den FD als Server, sowie für das RE-PS als Client. Anwendungsfall AF_10271 MUSS durch den FD über die spezifizierte API umgesetzt werden. Die Vorgaben aus "Tabelle 17: Use Case Abfrage von angereicherten PDF/A per Token (Rechnungsersteller)" des Feature-Dokumentes MÜSSEN eingehalten werden durch den FD.

|||
|-|-|
|HTTP-Methode|POST oder GET|
|Endpunkt|/DocumentReference/$retrieve|

Die Input- und Output-Parameter werden durch die OperationDefinition `https://gematik.de/fhir/dipag/OperationDefinition/Retrieve` beschrieben.

{{render:https://gematik.de/fhir/dipag/OperationDefinition/Retrieve}}

|API-Zustand|HTTP-Status-Code|
|-|-|
|Erfolgsfall|`200 - OK`|
|Weitere Parameter in HTTP-Anfrage enthalten|`400 - Bad Request`|
|Syntax für Parameter ist nicht korrekt oder Kardinalitäten werden nicht eingehalten|`400 - Bad Request`|
|Kein valides Access-Token wird mitgesendet|`401 - Unauthorized`|
|Autorisierter Benutzer verfügt über keine ausreichende Berechtigung die Interaktion auszuführen|`403 - Forbidden`|
|Fehlende Berechtigung für den Leistungserbringer das Dokument abzurufen (z.B. falls ein invalides Rechnungstoken verwendet wird)|`404 - Not Found`|
|Dokumnent kann anhand des Rechnungstokens nicht gefunden werden|`404 - Not Found`|
|Andere HTTP-Methode wird verwendet|`405 - Method Not Allowed`|

Anhand des übermittelten Dokumententokens MUSS der FD die entsprechende DocumentReference suchen. Das originale Rechnungsdokument MUSS durch den FD unter `DocumentReference.content:rechnungspdf` ausgeblendet werden. Dies gilt ebenfalls für die Signatur-Extension.

Die DocumentReference-Ressource KANN direkt an den Client zurückgegeben werden ohne, dass diese in eine Parameter-Ressource eingebettet wird.

Das Abrufen eines Rechnungsdokumentes durch ein RE-PS hat keine Auswirkungen auf den Rechnungsstatus (`DocumentReference.meta.tag:ergpkv-status`) des Dokumentes.

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

* Der FD MUSS aus dem Access-Token die Telematik-ID extrahieren falls es sich bei dem anfragenden System um ein RE-PS handelt. Der FD MUSS sicherstellen, dass nur DocumentReference-Ressourcen abgerufen werden können in denen `DocumentReference.author.identifier` auf die zugehörige Telematik-ID verweist.

* Der FD MUSS sicherstellen, dass bei einer Abfrage einer Binary-Ressource welche unter `DocumentReference.content.attachment.url` referenziert wird nur erfolgen kann, wenn ein valides Access-Token mitgeliefert wird und das Binary in einer DocumentReference referenziert wird in der `DocumentReference.author.identifier` identisch ist mit der Telematik-ID aus dem Access-Token.

* Es gelten die Festlegungen der [FHIR-Kernspezifikation zur Handhabung von Binary-Ressourcen](https://www.hl7.org/fhir/r4/binary.html#rest).

----