Extension: DiPagTeilsumme
Id: DiPagTeilsumme
Title: "Digitale Patientenrechnung Teilsumme"
Context: Invoice.totalPriceComponent
* extension contains
  Type ..1 and
  Summe ..1 and
  UStProzent ..1 and
  UStBetrag ..1
* extension[Type]
  * value[x] only Coding
  * valueCoding from DiPagRechnungspositionTypeVS (required)
* extension[Summe]
  * value[x] only Money
  * valueMoney
    * currency = #EUR
* extension[UStProzent]
  * value[x] only decimal
* extension[UStBetrag]
  * value[x] only Money
  * valueMoney
    * currency = #EUR