Profile: ERGNutzungsprotokoll
Parent: AuditEvent
Title: "ERG Nutzungsprotokoll"
Id: erg-nutzungsprotokoll
* insert Meta
* type MS
* type from ERGAuditEventTypeVS (required)
* subtype MS
* subtype from ERGAuditEventSubTypeVS (extensible)
* subtype ^comment = "Erweiterung des Core ValueSet um die Operations der Spec-E-Rechnung"
* action MS
* recorded MS
* outcome MS
* agent MS
* agent //TODO Agent type einschränken auf menschlich und system
  * type 1.. MS
  * type from ERGAuditEventAgentTypeVS (required)
  * who MS
  * who.identifier ..1 MS
  * who.identifier ^comment = "Der Identifier wird vom Server gesetzt und kann entweder eine KVNR oder Telematik-ID sein" //TODO KVNR oder TelematikId
  * who.display 1.. MS
  * requestor MS
* source.observer.display MS
* source.observer.display ^comment = "Freitext-Rolle des Servers, auf das Event ausgelöst wurde"
* entity MS
* entity.what MS
* entity.what ^comment = "Referenzierung aller betroffenen Ressourcen"
* entity.what.display MS
* entity.name MS
* entity.description MS

CodeSystem: ERGOperationenCS
Id: erg-operationen-cs
Title: "ERG Operationen"
* #erechnung-submit "ERechnung_Submit"
* #retrieve "ERechnung_Retrieve"
* #change-status "ERechnung_ChangeStatus"
* #process-flag "ERechnung_ProcessFlag"
* #erase "ERechnung_Erase"

CodeSystem: ERGPropRestInterationsCS
Id: erg-prop-rest-interactions-cs
Title: "ERG proprietäre RESTful Interaktionen"
* #create "Erstellen"
* #read "Lesen"
* #update "Aktualisieren"
* #delete "Löschen"

ValueSet: ERGAuditEventSubTypeVS
Id: erg-audit-event-sub-type-vs
Title: "ERG Audit Event Sub-Type"
* include codes from system $restful-interaction
* include codes from system ERGOperationenCS
* include codes from system ERGPropRestInterationsCS

ValueSet: ERGAuditEventTypeVS
Id: erg-audit-event-type-vs
Title: "ERG Audit Event Type"
* http://dicom.nema.org/resources/ontology/DCM#110100 "Application Activity"
* https://hl7.org/fhir/R4/codesystem-audit-event-type.html#rest "RESTful Operation"


ValueSet: ERGAuditEventAgentTypeVS
Id: erg-audit-event-agent-type-vs
Title: "ERG Audit Event Agent Type"
* http://terminology.hl7.org/CodeSystem/extra-security-role-type#humanuser "human user"
* http://terminology.hl7.org/CodeSystem/extra-security-role-type#dataprocessor "data processor"