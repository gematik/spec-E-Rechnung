Profile: ERGPKVNutzungsprotokoll
Parent: AuditEvent
Id: ergpkv-nutzungsprotokoll
Title: "ERGPKV Nutzungsprotokoll"
* insert Meta
* type MS
* type = #rest
* subtype MS
* subtype from ERGPKVAuditEventSubType
* subtype ^comment = "Erweiterung des Core ValueSet um die Operations der Spec-E-Rechnung"
* action MS
* recorded MS
* outcome MS
* agent MS
* agent
  * who 1.. MS
  * who.identifier 1.. MS
  * who.identifier ^comment = "Die KVNR ist aus dem Claim urn:telematik:claims:id des mitzusendenen Access-Token zu extrahieren."
  * requestor MS
* entity MS
* entity.what MS
* entity.what ^comment = "Referenzierung aller betroffenen Ressourcen"

//R10 Beispiel TODO

CodeSystem: ERGPKVOperationen
Id: ergpkv-operationen
Title: "ERGPKV Operationen"
* #erechnung-submit "ERechnung_Submit"
* #retrieve "ERechnung_Retrieve"
* #change-status "ERechnung_ChangeStatus"
* #process-flag "ERechnung_ProcessFlag"
* #erase "ERechnung_Erase"

ValueSet: ERGPKVAuditEventSubType
Id: ergpkv-audit-event-sub-type
Title: "ERGPKV Audit Event Sub-Type"
* DCM#110120
* DCM#110121
* DCM#110122
* DCM#110123
* DCM#110124
* DCM#110125
* DCM#110126
* DCM#110127
* DCM#110128
* DCM#110129
* DCM#110130
* DCM#110131
* DCM#110132
* DCM#110133
* DCM#110134
* DCM#110135
* DCM#110136
* DCM#110137
* DCM#110138
* DCM#110139
* DCM#110140
* DCM#110141
* DCM#110142
* include codes from system $restful-interaction
* include codes from system ERGPKVOperationen