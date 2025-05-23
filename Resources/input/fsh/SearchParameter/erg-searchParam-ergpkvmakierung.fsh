Instance: dipag-makierung
InstanceOf: SearchParameter
Usage: #example
Title: "Suchparameter DocumentReference dipag-makierung"
Description: "Ein SearchParameter auf der Ressource DocumentReference, der die Suche nach einer manuelle Markierung ermöglicht."
* url = Canonical(dipag-makierung)
* name = "Suchparameter DocumentReference dipag-makierung"
* status = #active
* publisher = "gematik GmbH"
* description = "Ein SearchParameter auf der Ressource DocumentReference, der die Suche nach einer manuelle Markierung ermöglicht."
* code = #dipag-makierung
* base = #DocumentReference
* type = #token
* expression = "DocumentReference.extension('https://gematik.de/fhir/erg/StructureDefinition/dipag-rechnungsstatus').value"