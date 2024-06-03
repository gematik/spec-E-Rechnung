Profile: ERGRechnungsdokument
Title: "ERG Rechnungsdokument"
Parent: Binary
Id: erg-rechnungsdokument
* insert Meta
* contentType MS
* contentType = #application/pdf (exactly)
  * ^short = "MIME-Type des Dokumentes"
  * ^comment = "Zum Zeitpunkt der Veröffentlichung werden nur PDF-Dokumente als Anhang seitens der Leistungserbringer:in und der Patient:in unterstüzt."
* data 1..1 MS
  * ^short = "Binär-Daten"
  * ^comment = "PDF als base64-kodierter String."