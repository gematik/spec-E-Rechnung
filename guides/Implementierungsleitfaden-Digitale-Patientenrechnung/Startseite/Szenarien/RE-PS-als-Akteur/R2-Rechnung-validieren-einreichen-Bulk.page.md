---
expand: 2
topic: AF_10136-Bulk
---

## {{page-title}}

Die nachfolgende Interaktion ist relevant für den FD als Server, sowie für das RE-PS als Client. Anwendungsfall AF_10136 MUSS durch den FD über die spezifizierte API umgesetzt werden. Die Vorgaben aus "Tabelle 15: Use Case Rechnung mit Dokumenten validieren und versenden" des Feature-Dokumentes MÜSSEN eingehalten werden durch den FD.

|||
|-|-|
|HTTP-Methode|POST|
|Endpunkt|/Patient/[id-des-ermittelten-Rechnungsempfängers]|

Die Input- und Output-Parameter werden durch die OperationDefinition `https://gematik.de/fhir/dipag/OperationDefinition/Submit` beschrieben. Die ID des Rechnungsempfängers ist zuvor per {{pagelink:AF_10132}} zu ermitteln.

{{render:https://gematik.de/fhir/dipag/OperationDefinition/Submit}}


|API-Zustand|HTTP-Status-Code|
|-|-|
|Erfolgsfall|`200 - OK`|
|Weitere Parameter in HTTP-Anfrage enthalten|`400 - Bad Request`|
|Syntax für Parameter ist nicht korrekt oder Kardinalitäten werden nicht eingehalten|`400 - Bad Request`|
|Gravierende Fehler treten während der Validierung auf - Mode = 'normal'|`400 - Bad Request`|
|Kein valides Access-Token wird mitgesendet|`401 - Unauthorized`|
|Autorisierter Benutzer verfügt über keine ausreichende Berechtigung die Interaktion auszuführen|`403 - Forbidden`|
|Fehlende Berechtigung für den Leistungserbringer das Postfach zu verwenden|`404 - Not Found` In diesem Fall: OperationOutcome mit Hinweis, dass Einwilligung nicht vorliegt oder Benutzer nicht vorhanden ist|
|Andere HTTP-Methode wird verwendet|`405 - Method Not Allowed`|

### Dokumentenvalidierung

Der FD muss die syntaktischen und semantischen Prüfungen der Rechnung durchführen welche in AF_10136 unter 'Ablauf' beschrieben sind. Bei der Verarbeitung einer Rechnungen mit einer bereits im FD bekannten Signatur MUSS eine Validierungswarnung durch den FD herausgegeben werden. Zudem MÜSSEN die übermittelten Dokumente ein valides PDF/A sein. Andernfalls ist der Request mit `400 - Bad Request` abzulehnen.

### Signatur

Die Signatur wird durch den FD über die Konkatenation aller Base64-kodierten Inhalte der Rechnung (d.h. Rechnungrepräsentation in PDF/A-Form und den strukturierten Rechnungsinhalten) gebildet werden, in der Reihenfolge:

1. Attachment mit contentType = application/pdf
1. Attachment mit contentType = application/fhir+xml
1. Attachment mit contentType = application/fhir+json  

Weitere Details zur Signatur, siehe TODO.

### Rechnungsrepräsentation

Die DocumentReference-Ressourcen welche über die Parameter `rechnung` und `anhang` übermittelt werden MÜSSEN dem Profil `https://gematik.de/fhir/StructureDefinition/dipag-dokumentenmetadaten` entsprechen.

<fql output="table" headers="true">
from
	StructureDefinition
where
	url = 'https://gematik.de/fhir/dipag/StructureDefinition/dipag-dokumentenmetadaten'
select
	Canonical: url, Status: status, Version: version, Basis: baseDefinition
</fql>

<br>

{{tree:https://gematik.de/fhir/dipag/StructureDefinition/dipag-dokumentenmetadaten, buttons}}

Folgende Implementierungshinweise sind zu beachten:

<fql output="table" headers="false">
from StructureDefinition where url = 'https://gematik.de/fhir/dipag/StructureDefinition/dipag-dokumentenmetadaten' for differential.element where comment.exists() select id, comment
</fql>

### Beispiele

<tabs>
    <tab title="DocumentReference">      
        {{render:Resources/fsh-generated/resources/DocumentReference-BeispielDocumentReferenceRechnung3-LE.json}}
    </tab>
    <tab title="XML">      
        {{xml:Resources/fsh-generated/resources/DocumentReference-BeispielDocumentReferenceRechnung3-LE.json}}
    </tab>
    <tab title="JSON">
        {{json:Resources/fsh-generated/resources/DocumentReference-BeispielDocumentReferenceRechnung3-LE.json}}
    </tab>
    <tab title="Link">
        {{link:Resources/fsh-generated/resources/DocumentReference-BeispielDocumentReferenceRechnung3-LE.json}}
    </tab>
</tabs>

```
HTTP POST [fachdienst-endpunkt]/Patient/[id-des-ermittelten-Rechnungsempfängers]/$submit
```

<tabs>
    <tab title="Parameters">      
        {{render:Resources/fsh-generated/resources/Parameters-BeispielParameterSubmitInput3-LE.json}}
    </tab>
    <tab title="XML">      
        {{xml:Resources/fsh-generated/resources/Parameters-BeispielParameterSubmitInput3-LE.json}}
    </tab>
    <tab title="JSON">
        {{json:Resources/fsh-generated/resources/Parameters-BeispielParameterSubmitInput3-LE.json}}
    </tab>
    <tab title="Link">
        {{link:Resources/fsh-generated/resources/Parameters-BeispielParameterSubmitInput3-LE.json}}
    </tab>
</tabs>

Antwort des Fachdienstes im Erfolgsfall:

Rückgabe von Rechnung und Anhang jeweils mit aufgebrachtem Token und separiertem Inhalt.
Bei Verwendung des Parameters "returnTokenPDF" werden die Binaries mit den PDF/A-Dokumenten (incl. Token-Barcode) als Parameter direkt mit ausgegeben.

```
HTTP 200 OK
```
mit Body:

<tabs>
    <tab title="Parameters">    
        {{render:Resources/fsh-generated/resources/Parameters-BeispielParameterSubmitOutput3-FD.json}}
    </tab>
    <tab title="XML">      
        {{xml:Resources/fsh-generated/resources/Parameters-BeispielParameterSubmitOutput3-FD.json}}
    </tab>
    <tab title="JSON">
        {{json:Resources/fsh-generated/resources/Parameters-BeispielParameterSubmitOutput3-FD.json}}
    </tab>
    <tab title="Link">
        {{link:Resources/fsh-generated/resources/Parameters-BeispielParameterSubmitOutput3-FD.json}}
    </tab>
</tabs>

### Verarbeitungsschritte im FD

Bei der Entgegennahme der Dokumente MÜSSEN durch den FD die nachfolgenden Schritte durchgeführt werden. Es ist zu beachten, dass dies asynchron durchgeführt werden kann durch den FD. Lediglich MUSS der FD sicherstellen, dass dieser Prozess vor dem Abruf der Dokumente durch das DiPag FdV oder dem RE-PS abgearbeitet wurde.

* `DocumentReference.attachment.data` muss aus der übermittelten DocumentReference herausgelöst werden. Der Inhalt MUSS in einer durch den FD neu angelegten Binary-Ressource gespeichert werden. Die Binary-Ressource MUSS unter `attachment.url` mit einer absoluten URL referenziert werden. `DocumentReference.attachment.data` ist anschließend zu löschen. Dies gilt für alle durch den Client übermittelte Dokumente.

* Die originale Rechnung (`DocumentReference.type = KDL#AM010106`) MUSS angereichert werden mit den strukturierten Rechnungsinhalten. Der FD MUSS die Inhalte strukturiert im FHIR-Format innerhalb eines PDF/A einbetten.

* Das neu erzeugte PDF/A muss als Binary nach den Vorgaben von `DocumentReference.content:angereicherteRechnung` aus dem oben aufgeführten Profil hinterlegt werden.

* Für jedes PDF/A-Dokument MUSS der FD ein Token unter Einhaltung einer ausreichenden Entropie erstellen. Der FD MUSS zusätzlich einen Barcode auf dem Rechnungs- oder Anhangdokument unterbringen welcher das Dokumententoken kodiert enthält. Die Lesbarkeit der Inhalte des Dokumtes darf hierdurch nicht eingeschränkt werden. Die Zugehörigkeit eines Tokens zu einem Dokument MUSS gespeichert werden, um den Abruf eines Dokumentes mit diesem Token zu ermöglichen.

* `DocumentReference.context.related` MUSS durch den FD auf die ID des ermittelten Rechnungsempfängers gesetzt werden.

* `DocumentReference.author.identifier` MUSS durch den FD auf die im Access-Token enthaltene Telematik-ID gesetzt werden. Durch den Client übermittelte Angaben in DocumentReference.author sind zu überschreiben.

* Hinweis: In der FHIR-Repräsentation erfolgt **keine** Differenzierung zwischen dem Datenobjekt für die Rechnungsdokumente und dem Rechnungsworkflow. Der Workflowstatus wird somit innerhalb der DocumentReference abgebildet. `DocumentReference.meta.tag:dipag-rechnungsstatus` MUSS durch den FD auf "Offen" gesetzt werden beim Empfang der Rechnung.

### Hinweise zur Abbildung des Workflow-Objektes (fachliches Datenmodell)

Im fachlichen Datenmodell des Feature-Dokuments Digitale Patientenrechnung ist dargestellt, dass jede Rechnung,sowie jedes ergänzende Dokument mit einem Rechnungsworkflow-Objekt verbunden ist. Dieses Workflow-Objekt bündelt das Rechnungsdokument sowie die Anhänge zusammen und gibt diesen Dokumenten einen gemeinsamen Status. Zur Vereinfachung der Implementierung seitens des FD und des DiPag FDV wird in der FHIR-Repräsentation **kein** weiteres Datenobjekt hierfür verwendet. Hingegen enthält das Profil 'DiPagDokumentenmetadaten' eine Extension 'dipag-rechnungsstatus' für diesen Zweck. Der Status zusammenhängender Dokumente MUSS stets synchron gehalten werden. Diese Extension gilt für das Rechnungsdokument sowie alle Anhänge, die innerhalb einer Submit-Operation im gleichen Kontext übermittelt worden sind wie die Rechnung. Der FD MUSS den Zusammenhang zwischen diesen Dokumenten in der Verarbeitungslogik vorhalten.

### Beispiele

Beispiel: Rechnungsdokument nach Verarbeitung auf Server

<tabs>
    <tab title="Parameters">    
        {{render:Resources/fsh-generated/resources/DocumentReference-BeispielDocumentReferenceRechnung3-FD.json}}
    </tab>
    <tab title="XML">      
        {{xml:Resources/fsh-generated/resources/DocumentReference-BeispielDocumentReferenceRechnung3-FD.json}}
    </tab>
    <tab title="JSON">
        {{json:Resources/fsh-generated/resources/DocumentReference-BeispielDocumentReferenceRechnung3-FD.json}}
    </tab>
    <tab title="Link">
        {{link:Resources/fsh-generated/resources/DocumentReference-BeispielDocumentReferenceRechnung3-FD.json}}
    </tab>
</tabs>

Beispiel: sonstiges Dokument nach Verarbeitung auf Server

<tabs>
    <tab title="Parameters">    
        {{render:Resources/fsh-generated/resources/DocumentReference-BeispielDocumentReferenceSonstigesDokument3-FD.json}}
    </tab>
    <tab title="XML">      
        {{xml:Resources/fsh-generated/resources/DocumentReference-BeispielDocumentReferenceSonstigesDokument3-FD.json}}
    </tab>
    <tab title="JSON">
        {{json:Resources/fsh-generated/resources/DocumentReference-BeispielDocumentReferenceSonstigesDokument3-FD.json}}
    </tab>
    <tab title="Link">
        {{link:Resources/fsh-generated/resources/DocumentReference-BeispielDocumentReferenceSonstigesDokument3-FD.json}}
    </tab>
</tabs>

----
