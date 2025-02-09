Extension: ERGWegegeldReiseentschaedigung
Id: erg-wegegeld-reiseentschaedigung
Title: "ERG Wegegeld/Reiseentschädigung Extension"
Context: ChargeItem
* extension contains
  Wegegeld ..1 and
  Reiseentschädigung ..1
* extension[Wegegeld]
  * extension contains
    Entfernung ..1 and
    Nacht ..1
  * extension[Entfernung]
    * value[x] only Quantity
    * valueQuantity
      * unit = "km"
      * code = #km
      * system = "http://unitsofmeasure.org"
  * extension[Nacht]
    * value[x] only boolean
    * valueBoolean MS
* extension[Reiseentschädigung]
  * extension contains
    Abwesenheit ..1 and
    Entfernung ..1 and
    Übernachtung ..1 and
    Verkehrsmittel ..1
  * extension[Abwesenheit]
    * value[x] only Quantity
    * valueQuantity
      * unit = "h"
      * code = #h
      * system = "http://unitsofmeasure.org"
  * extension[Entfernung]
    * value[x] only Quantity
    * valueQuantity
      * unit = "km"
      * code = #km
      * system = "http://unitsofmeasure.org"
  * extension[Übernachtung]
    * value[x] only Money
    * valueMoney.currency = #EUR
  * extension[Verkehrsmittel]
    * value[x] only string