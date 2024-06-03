Profile: ERGNutzungsprotokoll
Parent: AuditEvent
Title: "ERG Nutzungsprotokoll"
Id: erg-nutzungsprotokoll
* insert Meta
* type MS
* type from ERGAuditEventType (required)
* subtype MS
* subtype from ERGAuditEventSubType (extensible)
* subtype ^comment = "Erweiterung des Core ValueSet um die Operations der Spec-E-Rechnung"
* action MS
* recorded MS
* outcome MS
* agent MS
* agent //TODO Agent type einschränken auf menschlich und system
  * type 1.. MS
  * type from ERGAuditEventAgentType (required)
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

CodeSystem: ERGOperationen
Id: erg-operationen
Title: "ERG Operationen"
* #erechnung-submit "ERechnung_Submit"
* #retrieve "ERechnung_Retrieve"
* #change-status "ERechnung_ChangeStatus"
* #process-flag "ERechnung_ProcessFlag"
* #erase "ERechnung_Erase"

CodeSystem: ERGPropRestInterations
Id: erg-prop-rest-interactions
Title: "ERG proprietäre RESTful Interaktionen"
* #create "Erstellen"
* #read "Lesen"
* #update "Aktualisieren"
* #delete "Löschen"

ValueSet: ERGAuditEventSubType
Id: erg-audit-event-sub-type
Title: "ERG Audit Event Sub-Type"
* include codes from system $restful-interaction
* include codes from system ERGOperationen
* include codes from system ERGPropRestInterations

ValueSet: ERGAuditEventType
Id: erg-audit-event-type
Title: "ERG Audit Event Type"
* http://dicom.nema.org/resources/ontology/DCM#110100 "Application Activity"
* https://hl7.org/fhir/R4/codesystem-audit-event-type.html#rest "RESTful Operation"


ValueSet: ERGAuditEventAgentType
Id: erg-audit-event-agent-type
Title: "ERG Audit Event Agent Type"
* http://terminology.hl7.org/CodeSystem/extra-security-role-type#humanuser "human user"
* http://terminology.hl7.org/CodeSystem/extra-security-role-type#dataprocessor "data processor"