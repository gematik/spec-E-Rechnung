## {{page-title}}

Auf technischer Ebene stellt der Fachdienst "Digitale Patientenrechnung" einer Reihe von Endpunkten zur Verfügung, welche innerhalb des Implementierungsleitfandens als "FHIR Custom Operations" basierend auf ["Extended Operations on the RESTful API"](https://hl7.org/fhir/r4/operations.html#3.2.0) oder als Standard-REST-Interaktion basierend auf der [FHIR-Kernspezifikation](https://www.hl7.org/fhir/r4/http.html) beschrieben werden. Registrierte Clients können diese Operations nach erfolgreicher Autorisierung und Authentifizierung über das freie Internet oder die Telematik-Infrastruktur aufgerufen werden (je nach Client). Weitere Hinweise siehe Abschnitt "3 Einordnung in die Telematikinfrastruktur" des Feature-Dokuments "Digitale Patientenrechnung".

In Kombination können die APIs verwendet werden um die Use Cases, beschrieben in Abschnitt {{pagelink:UseCases}}, umzusetzen.

Es ist zu beachten, dass nicht jede User Story oder jedes Epic des Feature-Dokumentes "Digitale Patientenrechnung" durch eine entsprechende FHIR-basierte API umgesetzt wird. Teile des Prozesses, inbesondere Funktionalität rund um die Verwaltung von Berechtigungen, basieren auf anderen technischen Standards und sind somit nicht im Scope des Implementierungsleitfadens.

----

### Akteure

Folgende Abkürzungen werden für die Akteure innerhalb der Beschreibungen der API-Interaktionen verwendet:

* RE-PS = Primärsystem in der Versorgung oder des Abrechnungsdienstleisters, z.B. KIS, PVS

* DiPag FdV = Frontend des Versicherten, webbasiert oder App

* ITSys-KTR = IT-System des Kostenträgers

* FD = Fachdienst Digitale Patientenrechnung

* ePA = Elektronische Patientenakte des Versicherten

----

### Rollen im Kontext der DiPag-API

Im Kontext der APIs zur Verwaltung der Digitalen Patientenrechnungen können unterschiedliche Akteure die entsprechenden APIs aufrufen. Jeder Akteur, welche eine API aufrufen kann, wird nachfolgend vereinfachend als "Client" bezeichnet (gilt für LE-PS, FdV, ITSys-KTR).

Die Rolle des Servers übernimmt stets der Fachdienst "Digitale Patientenrechnung".

----

### Interaktionen zwischen RE-PS und FD

Nachfolgend sind alle Interaktionen aufgelistet für die eine FHIR-API durch den FD zur Vergügung gestellt werden MUSS.

#### Use Case AF_10138 - Abruf von Rechnungen (Rechnungsempfänger)

Siehe Abschnitt "6.2.3 Ermittlung des Rechnungsempfängers" des Feature-Dokumentes "Digitale Patientenrechnung". Die technische Spezifikation hierzu findet sich unter {{pagelink:AF_10138}}.

#### Use Case AF_10136 - Rechnung mit Dokumenten validieren und versenden

Siehe Abschnitt "6.2.4 Validierung und Versand von Rechnungen und Dokumenten" des Feature-Dokumentes "Digitale Patientenrechnung". Die technische Spezifikation hierzu findet sich unter {{pagelink:AF_10136}}.

#### Use Case AF_10136 - Rechnung mit Dokumenten validieren und versenden (Bulk)

Siehe Abschnitt "6.2.4 Validierung und Versand von Rechnungen und Dokumenten" des Feature-Dokumentes "Digitale Patientenrechnung". Die technische Spezifikation hierzu findet sich unter {{pagelink:AF_10136-Bulk}}.

#### Use Case AF_10271 - Abfrage von angereicherten PDF/A per Token (Rechnungsersteller)

Siehe Abschnitt "6.2.4 Validierung und Versand von Rechnungen und Dokumenten" des Feature-Dokumentes "Digitale Patientenrechnung". Die technische Spezifikation hierzu findet sich unter {{pagelink:AF_10271}}.

#### Use Case AF_10271 - Abfrage von angereicherten PDF/A per Token (Rechnungsersteller) (Bulk)

Siehe Abschnitt "6.2.4 Validierung und Versand von Rechnungen und Dokumenten" des Feature-Dokumentes "Digitale Patientenrechnung". Die technische Spezifikation hierzu findet sich unter {{pagelink:AF_10271-Bulk}}.

### Interaktionen zwischen DiPag FdV und FD

#### Use Case AF_10262 - Abfrage von Daten zu Rechnungen und Dokumenten per Token (Rechnungsempfänger)

Siehe Abschnitt "6.3.1 Abruf von Rechnungen und Dokumenten" des Feature-Dokumentes "Digitale Patientenrechnung". Die technische Spezifikation hierzu findet sich unter {{pagelink:AF_10262}}.

#### Use Case AF_10262 - Abfrage von Daten zu Rechnungen und Dokumenten per Token (Rechnungsempfänger)

Siehe Abschnitt "6.3.1 Abruf von Rechnungen und Dokumenten" des Feature-Dokumentes "Digitale Patientenrechnung". Die technische Spezifikation hierzu findet sich unter {{pagelink:AF_10262}}.

#### Use Case AF_10245 - Manuelles Ändern des Bearbeitungsstatus von Rechnungen

Siehe Abschnitt "6.4 Verwaltung von empfangenen Rechnungen" des Feature-Dokumentes "Digitale Patientenrechnung". Die technische Spezifikation hierzu findet sich unter {{pagelink:AF_10245}}.

#### Use Case AF_10160 - Manuelles Markieren von Rechnungen und Dokumenten

Siehe Abschnitt "6.4 Verwaltung von empfangenen Rechnungen" des Feature-Dokumentes "Digitale Patientenrechnung". Die technische Spezifikation hierzu findet sich unter {{pagelink:AF_10160}}.

#### Use Case AF_10245 - Löschen eines Rechnungsvorganges

Siehe Abschnitt "6.4 Verwaltung von empfangenen Rechnungen" des Feature-Dokumentes "Digitale Patientenrechnung". Die technische Spezifikation hierzu findet sich unter {{pagelink:AF_10245}}.

#### Use Case AF_10203 - Nutzerprotokoll einsehen

Siehe Abschnitt "6.7 Nutzerprotokolle" des Feature-Dokumentes "Digitale Patientenrechnung". Die technische Spezifikation hierzu findet sich unter {{pagelink:AF_10203}}.

### Interaktionen zwischen ITSys-KTR und FD

#### Use Case AF_10180 - Abfrage von Daten zu Rechnungen und Dokumenten per Token (Kostenträger)

Siehe Abschnitt "6.5.2 Anwendungsfälle des Kostenträgers" des Feature-Dokumentes "Digitale Patientenrechnung". Die technische Spezifikation hierzu findet sich unter {{pagelink:AF_10180}}.
