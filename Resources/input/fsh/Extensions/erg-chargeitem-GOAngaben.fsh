Extension: ERGRechnungspositionGOAngaben
Id: erg-rechnungsposition-go-angaben
Title: "ERG Angaben bei Gebührenordnungen bei einer Rechnungsposition"
Context: ChargeItem
* extension contains
  Einfachsatz ..1 MS and
  Punktzahl ..1 MS and
  Faktor ..1 MS and
  FaktorId ..1 MS and
  Minderung§6GOÄ ..1 MS
* extension[Einfachsatz]
  * ^short = "Gebühr Einfachsatz in EUR"
  * ^comment = "Der Gebühr Einfachsatz in EUR SOLL vorhanden sein."
  * value[x] only Money
  * valueMoney MS
    * currency 1.. MS
    * value 1.. MS
    * currency = #EUR
* extension[Punktzahl]
  * ^short = "Punktzahl BEMA"
  * ^comment = "Die Punktzahl BEMA SOLL vorhanden sein."
  * value[x] only decimal
  * valueDecimal MS
* extension[Faktor]
  * ^short = "Faktor"
  * ^comment = "Der Faktor SOLL vorhanden sein."
  * value[x] only decimal
  * valueDecimal MS
* extension[FaktorId]
  * extension contains
    Id ..1 MS and
    Ausprägung ..1 MS
  * extension[Id]
    * ^short = "Faktor ID"
    * ^comment = "Die Faktor ID SOLL vorhanden sein."
    * value[x] only string //TODO Klärung des Datentyp
  * extension[Ausprägung]
    * ^short = "Faktor ID Ausprägung"
    * ^comment = "Die Faktor ID Ausprägung SOLL vorhanden sein."
    * value[x] only Coding
    * valueCoding MS
    * valueCoding from ERGRechnungspositionFaktorIdAuspraegungenVS (required)
* extension[Minderung§6GOÄ]
  * ^short = "Minderungen nach §6a GOÄ in Prozent"
  * ^comment = "Die Minderungen nach §6a GOÄ in Prozent SOLL vorhanden sein."
  * value[x] only Quantity
  * valueQuantity MS
    * unit 1.. MS
    * code 1.. MS
    * system 1.. MS
    * value 1.. MS
    * unit = "%"
    * code = #%
    * system = "http://unitsofmeasure.org"