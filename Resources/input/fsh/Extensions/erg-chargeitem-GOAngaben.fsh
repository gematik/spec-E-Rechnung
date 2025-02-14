Extension: ERGRechnungspositionGOAngaben
Id: erg-rechnungsposition-go-angaben
Title: "ERG Angaben bei Gebührenordnungen bei einer Rechnungsposition"
Context: ChargeItem
* extension contains
  Einfachsatz ..1 and
  Punktzahl ..1 and
  Faktor ..1 and
  FaktorId ..1 and
  MinderungP6GOÄ ..1
* extension[Einfachsatz]
  * value[x] only Money
  * valueMoney.currency = #EUR
* extension[Punktzahl].value[x] only decimal
* extension[Faktor]
  * extension contains 
    Value ..1 and
    FaktorID ..1
  * extension[Value].value[x] only decimal
  * extension[FaktorID]
    * value[x] only Coding
    * valueCoding from ERGRechnungspositionFaktorIdAuspraegungenVS (required)  
* extension[MinderungP6GOÄ]
  * value[x] only Quantity
  * valueQuantity
    * unit = "%"
    * code = #%
    * system = "http://unitsofmeasure.org"