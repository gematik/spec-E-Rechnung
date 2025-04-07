CodeSystem: ERGTotalPriceComponentTypeCS
Id: erg-total-price-component-type-cs
Title: "ERG Art der Rechnungssumme"
* insert Meta
* #SummeRechnungspositionen "Summe aller Rechnungspositionen"
* #Minderung7GOZ "Minderungen nach §7 GOZ"
* #Fremdlaborleistungen "Fremdlaborleistungen"
* #Abzug "Übergeordnete Abzug-Kategorie"
* #Abzug #FestzuschussKasse "Festzuschuss Kasse"
* #Abzug #VorleistungKst "Vorleistungen anderer Kostenträger"
* #Abzug #KostenBema13AtoD "Kosten gem. den BEMA-Pos. 13a - d"

ValueSet: ERGTotalPriceComponentDeductionTypeVS
Id: erg-total-price-component-deduction-type-vs
Title: "ERG Art des Abzugs von der Summe der gesamten Rechnungspositionen"
* ERGTotalPriceComponentTypeCS#FestzuschussKasse "Festzuschuss Kasse"
* ERGTotalPriceComponentTypeCS#VorleistungKst "Vorleistungen anderer Kostenträger"
* ERGTotalPriceComponentTypeCS#KostenBema13AtoD "Kosten gem. den BEMA-Pos. 13a - d"