CodeSystem: DiPagTotalPriceComponentTypeCS
Id: dipag-total-price-component-type-cs
Title: "Digitale Patientenrechnung Art der Rechnungssumme"
* insert Meta
* #SummeRechnungspositionen "Summe aller Rechnungspositionen"
* #Minderung7GOZ "Minderungen nach §7 GOZ"
* #Fremdlaborleistungen "Fremdlaborleistungen"
* #Abzug "Übergeordnete Abzug-Kategorie"
* #Abzug #FestzuschussKasse "Festzuschuss Kasse"
* #Abzug #VorleistungKst "Vorleistungen anderer Kostenträger"

ValueSet: DiPagTotalPriceComponentDeductionTypeVS
Id: dipag-total-price-component-deduction-type-vs
Title: "Digitale Patientenrechnung Art des Abzugs von der Summe der gesamten Rechnungspositionen"
* DiPagTotalPriceComponentTypeCS#FestzuschussKasse "Festzuschuss Kasse"
* DiPagTotalPriceComponentTypeCS#VorleistungKst "Vorleistungen anderer Kostenträger"