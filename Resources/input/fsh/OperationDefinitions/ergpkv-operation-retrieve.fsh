// ------------- OperationDefinition -------------

Instance: ERGPKVOperationRetrieve
InstanceOf: OperationDefinition
Usage: #example
Title: "ERGPKV Operation Retrieve"
Description: "Abrufen von E-Rechnungen, strukturierten Rechnungsinhalten und Dokumenten"
* url = "https://gematik.de/fhir/ergpkv/OperationDefinition/Retrieve"
* status = #draft
* kind = #operation
* name = "ERechnung_Retrieve"
* code = #retrieve
* resource = #DocumentReference
* system = false
* type = true
* instance = false
* affectsState = false
* parameter[+]
  * name = #token
  * use = #in
  * min = 1
  * max = "1"
  * documentation = "Dokumentoken zur Identifikation des Dokuments, dass angerufen werden soll"
  * type = #string
* parameter[+]
  * name = #strukturierterRechnungsinhalt
  * use = #in
  * min = 0
  * max = "1"
  * documentation = "Angabe ob die strukturierten Rechnungsinhalte neben dem angereicherten Rechnungsdokument zurückgegeben werden sollen als 'content'-Element. Default: false"
  * type = #boolean
* parameter[+]
  * name = #originaleRechnung
  * use = #in
  * min = 0
  * max = "1"
  * documentation = "Angabe ob die originale Rechnung inkl. Signatur neben dem angereicherten Rechnungsdokument zurückgegeben werden soll als 'content'-Element. Default: false. Dieser Parameter darf nur durch das PSK als Client verwendet werden."
  * type = #boolean
* parameter[+]
  * name = #erechnung
  * use = #out
  * min = 1
  * max = "1"
  * documentation = "DocumentReference-Ressource die das angefragte Rechnungsdokument, sowie die strukturierten Rechnungsinhalte enthält (in Abhängigkeit vom strukturierterRechnungsinhalt- und originaleRechnung-Parameter)."
  * type = #DocumentReference