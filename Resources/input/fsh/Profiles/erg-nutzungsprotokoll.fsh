Profile: ERGNutzungsprotokoll
Parent: AuditEvent
Title: "ERG Nutzungsprotokoll"
Id: erg-nutzungsprotokoll
* insert Meta
* type MS
  * ^comment = "Angabe ob es sich um eine zu protokollierende Nutzerinteraktion nach Abschnittt '5.5.9 Nutzerprotokolle' des Feature-Dokuments 'E-Rechnung' handelt oder um eine durchgeführte REST-API-Interaktion durch den FD."
* type from ERGAuditEventTypeVS (required)
* subtype MS
  * ^comment = "Erlaubt die Kodierung aller REST-API Operationen der Spec-E-Rechnung"
* subtype from ERGAuditEventSubTypeVS (extensible)
* action MS
  * ^comment = "Angabe ob es sich um eine lesende/schreibende/ausführende Interaktion handelt."
* recorded MS
  * ^comment = "Der Zeitpunkt des Zugriffs ist zu protokollieren. Siehe Abschnittt '4.8.6 Protokolleintrag'des Feature-Dokuments 'E-Rechnung'."
* outcome MS
  * ^comment = "Angabe ob die zu protokollierende Interaktion erfolgreich ausgeführt werden konnte."
* agent MS
  * ^comment = "Angaben zum Akteur (Nutzer oder eRg FD), der den Zugriff durchgeführt hat. Siehe Abschnittt '4.8.6 Protokolleintrag'des Feature-Dokuments 'E-Rechnung'."
* agent
  * type 1.. MS
  * type from ERGAuditEventAgentTypeVS (required)
  * who MS
  * who.identifier ..1 MS
  * who.identifier ^comment = "Der Identifier wird vom Server gesetzt und kann entweder eine KVNR oder Telematik-ID sein"
  * who.display 1.. MS
  * requestor MS
* source.observer.display MS
* source.observer.display ^comment = "Freitext-Rolle des Servers, auf das Event ausgelöst wurde"
* entity MS
* entity.what MS
* entity.what ^comment = "Referenzierung aller durch die zu protokollierende Interaktion betroffenen Ressourcen"
* entity.what.display MS
* entity.name MS
* entity.description MS
* entity ^slicing.discriminator.type = #pattern
* entity ^slicing.discriminator.path = "what.type"
* entity ^slicing.rules = #open
* entity contains Versicherter ..1 MS
* entity[Versicherter].what.type = http://hl7.org/fhir/resource-types#Patient
* entity[Versicherter].what.identifier only IdentifierKvid10
  * ^patternIdentifier.type = http://fhir.de/CodeSystem/identifier-type-de-basis#KVZ10
  * type 1.. MS
  * system MS
  * value MS

CodeSystem: ERGOperationenCS
Id: erg-operationen-cs
Title: "ERG Operationen"
* insert Meta
* #erechnung-submit "ERechnung_Submit"
* #retrieve "ERechnung_Retrieve"
* #change-status "ERechnung_ChangeStatus"
* #process-flag "ERechnung_ProcessFlag"
* #erase "ERechnung_Erase"

CodeSystem: ERGPropRestInterationsCS
Id: erg-prop-rest-interactions-cs
Title: "ERG proprietäre RESTful Interaktionen"
* insert Meta
* #create "Erstellen"
* #read "Lesen"
* #update "Aktualisieren"
* #delete "Löschen"

ValueSet: ERGAuditEventSubTypeVS
Id: erg-audit-event-sub-type-vs
Title: "ERG Audit Event Sub-Type"
* insert Meta
* include codes from system $restful-interaction
* include codes from system ERGOperationenCS
* include codes from system ERGPropRestInterationsCS

ValueSet: ERGAuditEventTypeVS
Id: erg-audit-event-type-vs
Title: "ERG Audit Event Type"
* insert Meta
* http://dicom.nema.org/resources/ontology/DCM#110100 "Application Activity"
* https://hl7.org/fhir/R4/codesystem-audit-event-type.html#rest "RESTful Operation"


ValueSet: ERGAuditEventAgentTypeVS
Id: erg-audit-event-agent-type-vs
Title: "ERG Audit Event Agent Type"
* insert Meta
* http://terminology.hl7.org/CodeSystem/extra-security-role-type#humanuser "human user"
* http://terminology.hl7.org/CodeSystem/extra-security-role-type#dataprocessor "data processor"