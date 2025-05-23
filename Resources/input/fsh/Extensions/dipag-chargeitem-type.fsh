Extension: DiPagRechnungspositionType
Id: dipag-rechnungsposition-type
Title: "Digitale Patientenrechnung Typ der Rechnungsposition Extension"
Description: "In dieser Extension wird der Typ einer Rechnungsposition im Kontext der Digitale Patientenrechnung abgebildet."
* insert Meta
* ^context.type = #element
* ^context.expression = "ChargeItem"
* value[x] only Coding
* valueCoding from DiPagRechnungspositionTypeVS (required)