Extension: ERGRechnungspositionType
Id: erg-rechnungsposition-type
Title: "ERG Typ der Rechnungsposition Extension"
Description: "In dieser Extension wird der Typ einer Rechnungsposition im Kontext der eRechnung abgebildet."
* insert Meta
* ^context.type = #element
* ^context.expression = "ChargeItem"
* value[x] only Coding
* valueCoding from ERGRechnungspositionTypeVS (required)