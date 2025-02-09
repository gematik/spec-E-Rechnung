Extension: ERGRechnungspositionGOAngaben
Id: erg-rechnungsposition-go-angaben
Title: "ERG Angaben bei Gebührenordnungen bei einer Rechnungsposition"
Context: ChargeItem
* extension contains
  Einfachsatz ..1 and
  Punktzahl ..1 and
  Faktor ..1 and
  FaktorId ..1 and
  Minderung§6GOÄ ..1
* extension[Einfachsatz]
  * value[x] only Money
  * valueMoney.currency = #EUR
* extension[Punktzahl].value[x] only decimal
* extension[Faktor].value[x] only decimal
* extension[FaktorId]
  * extension contains
    Id ..1 and
    Ausprägung ..1
  * extension[Id].value[x] only string //TODO Klärung des Datentyp (Kommentar an Klaus)
  * extension[Ausprägung]
    * value[x] only Coding
    * valueCoding from ERGRechnungspositionFaktorIdAuspraegungenVS (required)
* extension[Minderung§6GOÄ]
  * value[x] only Quantity
  * valueQuantity
    * unit = "%"
    * code = #%
    * system = "http://unitsofmeasure.org"