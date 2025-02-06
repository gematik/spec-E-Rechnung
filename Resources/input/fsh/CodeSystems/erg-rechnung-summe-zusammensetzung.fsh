CodeSystem: ERGTotalPriceComponentTypeCS
Id: erg-total-price-component-type-cs
Title: "ERG Rechnungssumme Art der Komponente CS" //TODO Benamung....
Description:  "CodeSystem für die verschiedenen Rechnungsarten innerhalb einer E-Rechnnung"
* insert Meta
* #SummeRechnungspositionen "Summe aller Rechnungspositionen"
* #Minderung7GOZ "Minderungen nach §7 GOZ"
* #Abzug "Übergeordnete Abzug-Kategorie"
* #Abzug #FestzuschussKasse "Festzuschuss Kasse"
* #Abzug #VorleistungKst "Vorleistungen anderer Kostenträger"
* #Abzug #KostenBema13AtoD "Kosten gem. den BEMA-Pos. 13a - d"

ValueSet: ERGTotalPriceComponentTypeVS
Id: erg-total-price-component-type-vs
Title: ""
Description: ""
* ERGTotalPriceComponentTypeCS#FestzuschussKasse "Festzuschuss Kasse"
* ERGTotalPriceComponentTypeCS#VorleistungKst "Vorleistungen anderer Kostenträger"
* ERGTotalPriceComponentTypeCS#KostenBema13AtoD "Kosten gem. den BEMA-Pos. 13a - d"