---
expand: 2
topic: AF_10203
---

## {{page-title}}

Die nachfolgende Interaktion ist relevant für den FD als Server, sowie für das DiPag FdV als Client. Anwendungsfall AF_10203 MUSS durch den FD über die spezifizierte API umgesetzt werden. Die Vorgaben aus "Tabelle 39: Use Case Nutzerprotokoll einsehen" des Feature-Dokumentes MÜSSEN eingehalten werden durch den FD.

|||
|-|-|
|HTTP-Methode|GET|
|Endpunkt|/AuditEvent|
|Suchparameter `agent:text`| Kardinalität: 0..1<br>Name Rechnungsersteller/Kostenträger/FachdienstVersicherte Person<br>Hinweis: Alle Akteure werden mit unterschiedlichen Rollen als `agent` erfasst<br>Type: string|
|Suchparameter `date`| Kardinalität: 0..1<br>Type: date|
|Suchresultatparameter `_sort`|Als Sortierkriterien können die oben genannten Suchparameter verwendet werden für die Inhalte die als Sortierkriterien in Tabelle 39: Use Case Nutzerprotokoll einsehen - Feature-Dokument Digitale Patientenrechnung genannt sind|
|Suchresultatparameter `_count`|Durch den Client gewünschte Page-Size, der FD KANN Vorgaben für die Maximale Page-Size definieren|
|User-Kontext `KVNR`| Kardinalität: 1..1<br>Hinweis: Die KVNR ist aus dem Claim `urn:telematik:claims:id` des mitzusendenen Access-Token zu extrahieren.|


|API-Zustand|HTTP-Status-Code|
|-|-|
|Erfolgsfall|`200 - OK`|
|Weitere Parameter in HTTP-Anfrage enthalten|`400 - Bad Request`|
|Syntax für Parameter ist nicht korrekt oder Kardinalitäten werden nicht eingehalten|`400 - Bad Request`|
|Kein valides Access-Token wird mitgesendet|`401 - Unauthorized`|
|Autorisierter Benutzer verfügt über keine ausreichende Berechtigung die Interaktion auszuführen|`403 - Forbidden`|
|Andere HTTP-Methode wird verwendet|`405 - Method Not Allowed`|

Als Antwort MUSS der FD ein [FHIR-SearchSet-Bundle](https://www.hl7.org/fhir/r4/bundle.html#searchset) zurückliefern welches eingegrenzt ist auf die durch den Client übermittelten Suchparameter.

### Beispiele

```
HTTP GET [fachdienst-endpunkt]/AuditEvent?agent:text=11223344
```

Antwort des Fachdienstes im Erfolgsfall:

```
HTTP 200 OK
```
mit Body:

<tabs>
    <tab title="Parameter-Input">      
        {{render:Resources/fsh-generated/resources/Bundle-BeispielNutzungsprotokollResultBundle.json}}
    </tab>
    <tab title="XML">      
        {{xml:Resources/fsh-generated/resources/Bundle-BeispielNutzungsprotokollResultBundle.json}}
    </tab>
    <tab title="JSON">
        {{json:Resources/fsh-generated/resources/Bundle-BeispielNutzungsprotokollResultBundle.json}}
    </tab>
    <tab title="Link">
        {{link:Resources/fsh-generated/resources/Bundle-BeispielNutzungsprotokollResultBundle.json}}
    </tab>
</tabs>

### Verarbeitungsschritte im FD

* Der FD MUSS die Suche auf AuditEvent-Ressourcen begrenzen die unter `AuditEvent.agent.who` auf einen Benutzer verweisen, welcher durch die KVNR aus dem Access-Token identifiziert wird, um sicherzustellen, dass nur persönliche AuditEvent-Ressourcen des angemeldeten Rechnungsempfänger zurückgegeben werden.