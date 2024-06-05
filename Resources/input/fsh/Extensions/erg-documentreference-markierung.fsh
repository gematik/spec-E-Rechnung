Extension: ERGDocumentReferenceMarkierung
Id: erg-documentreference-markierung
Title: "ERG DocumentReference Markierung"
* insert Meta
* extension contains markierung 1..1
* extension contains zeitpunkt 0..1
* extension contains details 0..1
* extension contains gelesen 0..1
* extension contains artDerArchivierung 0..1

* extension[markierung].value[x] only Coding
* extension[markierung].value[x] 1..1
* extension[markierung].value[x] from ERGRechnungMarkierungVS (required)

* extension[zeitpunkt].value[x] only dateTime
* extension[zeitpunkt].value[x] 1..1

* extension[details].value[x] only string
* extension[details].value[x] 1..1

* extension[gelesen] obeys gelesen
* extension[gelesen].value[x] only boolean
* extension[gelesen].value[x] 1..1

* extension[artDerArchivierung] obeys artDerArchivierung
* extension[artDerArchivierung].value[x] only Coding
* extension[details].value[x] 1..1


Invariant: artDerArchivierung
* key = "ERGDocumentReferenceMarkierung-1"
* severity = #error
* human = "Details zur Art der Archivierung können nur angegeben werden wenn die Markierung vom Typ 'Archiviert' ist"
* expression = "extension.where(url = 'artDerArchivierung').value.exists() implies extension.where(url = 'markierung').value.coding.where(code = 'archiviert').exists()"

Invariant: gelesen
* key = "ERGDocumentReferenceMarkierung-2"
* severity = #error
* human = "Details zum Gelesen-Status können nur angegeben werden wenn die Markierung vom Typ 'Gelesen' ist"
* expression = "extension.where(url = 'gelesen').value.exists() implies extension.where(url = 'markierung').value.coding.where(code = 'gelesen').exists()"