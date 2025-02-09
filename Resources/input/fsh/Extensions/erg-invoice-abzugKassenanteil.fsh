Extension: ERGAbzugKassenanteil
Id: erg-abzug-kassenanteil
Title: "ERG Extension Abzug Kassenanteil in Prozent"
* insert Meta
* ^context.type = #element
* ^context.expression = "Invoice.totalPriceComponent"
* value[x] only Quantity
* valueQuantity
  * unit 1..
  * unit = "%"
  * code 1..
  * code = #%
  * system 1..
  * system = "http://unitsofmeasure.org"