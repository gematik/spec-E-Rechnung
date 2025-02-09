Extension: ERGTeilsumme
Id: ERGTeilsumme
Title: "ERG Teilsumme"
Context: Invoice.totalPriceComponent
* extension contains
  Type ..1 and
  Summe ..1
* extension[Type]
  * value[x] only Coding
  * valueCoding from ERGRechnungspositionTypeVS (required)
* extension[Summe]
  * value[x] only Money
  * valueMoney
    * currency = #EUR