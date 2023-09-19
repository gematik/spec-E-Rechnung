Profile: ERGPKVRechnungsdokument
Title: "ERGPKV Rechnungsdokument"
Parent: Binary
Id: ergpkv-rechnungsdokument
* contentType MS
* contentType = #application/pdf
  * ^comment = "Zum Zeitpunkt der Veröffentlichung werden nur PDF-Dokumente als Anhang seitens der Leistungserbringer:in und der Patient:in unterstüzt."
* data 1..1 MS
  * ^comment = "PDF als base64-kodierter String."
* securityContext 0.. MS
  * ^comment = "SecurityContext wird durch den Fachdienst ermittelt und in der Ressource ersetzt. Muss nicht duruch die Applikation der Leistungserbringer:in und der Patient:in eingefügt werden."
  * reference 1.. MS
    * ^comment = "Die Binary-Ressourcen sollten an das Patient-Compartment der Rechnungsempfänger:in oder der Patient:in gebunden werden. Im Falle, dass die Leistungserbringer:in das Dokument einstellt in den Fachdienst als Anhang zur Rechnung muss das Dokument mit der Rechnungsempfänger:in verknüpft werden. In allen weiteren Fällen wird das Dokument mit der Person verknüpft, die das Dokument hochlädt zum Fachdienst."
