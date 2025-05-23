---
expand: 2
topic: AF_10245
---

## {{page-title}}

Die nachfolgende Interaktion ist relevant für den FD als Server, sowie für das DiPag FdV als Client. Anwendungsfall AF_10245 MUSS durch den FD über die spezifizierte API umgesetzt werden. Die Vorgaben aus "Tabelle 27: Use Case Automatisches endgültiges Löschen von Rechnungen" des Feature-Dokumentes MÜSSEN eingehalten werden durch den FD.

|||
|-|-|
|HTTP-Methode|POST|
|Endpunkt|/DocumentReference/[id]/$erase|

|API-Zustand|HTTP-Status-Code|
|-|-|
|Erfolgsfall|`200 - OK`|
|Weitere Parameter in HTTP-Anfrage enthalten|`400 - Bad Request`|
|Syntax für Parameter ist nicht korrekt oder Kardinalitäten werden nicht eingehalten|`400 - Bad Request`|
|Kein valides Access-Token wird mitgesendet|`401 - Unauthorized`|
|Autorisierter Benutzer verfügt über keine ausreichende Berechtigung die Interaktion auszuführen|`403 - Forbidden`|
|Fehlende Berechtigung für den Rechnungsempfänger den Dokumentenstatus permanent zu löschen|`404 - Not Found`|
|Operation wird auf nicht existierender DocumentReference-Ressource aufgerufen|`404 - Not Found`|
|Andere HTTP-Methode wird verwendet|`405 - Method Not Allowed`|
|Operation wird auf einer DocumentReference-Ressource aufgerufen die sich nicht im Bearbeitungsstatus 'Papierkorb' befindet|`412 - Precondition Failed`|

Die Input- und Output-Parameter werden durch die OperationDefinition `https://gematik.de/fhir/dipag/OperationDefinition/Erase` beschrieben. In der derzeitgen Version der Operation exisieren jedoch keine Input- oder Output-Parameter.

{{render:https://gematik.de/fhir/dipag/OperationDefinition/Erase}}

### Beispiele

```
HTTP POST [fachdienst-endpunkt]/DocumentReference/123456/$erase
```

Antwort des Endpunktes im Erfolgsfall:

```
HTTP 200 OK
```

### Verarbeitungsschritte im FD

* Der FD MUSS die DocumentReference-Ressource und alle dazugehörigen Binary-Ressourcen permanent und unverzüglich löschen. Die entsprechenden Dokumententokens verlieren permanent ihre Gültigkeit.

----