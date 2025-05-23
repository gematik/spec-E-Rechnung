Extension: DiPagAbrechnungsDiagnoseProzedur
Id: DiPagAbrechnungsDiagnoseProzedur
Title: "Abrechnungsrelevanz von Diagnosen und Prozeduren"
Description: """Diese Extension erlaubt es einer Invoice Diagnosen oder Prozeduren, incl. Qualifier wie bspw: "Primär-DRG" zuzuordnen. Dies ermöglicht unter anderem das Zuordnen von Haupt- und Nebendiagnosen zu einem Account zum Zweck der DRG Erstellung."""
* insert Meta
* ^context.type = #element
* ^context.expression = "Invoice"
* . ^short = "Abrechnungsrelevanz von Diagnosen und Prozeduren"
* extension contains
    Use 1..1 and
    Referenz 1..*
* extension[Use].value[x] only Coding
* extension[Use].valueCoding 0..1
* extension[Use].valueCoding from DiPagAbrechnungsDiagnoseUseVS (required)
* extension[Referenz].value[x] only Reference(Condition or Procedure)

Extension: DiPagAbrechnungsDiagnoseProzedurFreitext
Id: DiPagAbrechnungsDiagnoseProzedurFreitext
Title: "Abrechnungsrelevanz von Diagnosen und Prozeduren als Freitext"
* insert Meta
* ^context.type = #element
* ^context.expression = "Invoice"
* . ^short = "Abrechnungsrelevanz von Diagnosen und Prozeduren als Freitext"
* value[x] only string