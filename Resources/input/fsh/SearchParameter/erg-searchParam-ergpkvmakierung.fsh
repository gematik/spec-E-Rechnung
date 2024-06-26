Instance: erg-makierung
InstanceOf: SearchParameter
Usage: #example
Title: "Suchparameter DocumentReference erg-makierung"
Description: "Ein SearchParameter auf der Ressource DocumentReference, der die Suche nach einer manuelle Markierung ermöglicht."
* url = Canonical(erg-makierung)
* name = "Suchparameter DocumentReference erg-makierung"
* status = #active
* publisher = "gematik GmbH"
* description = "Ein SearchParameter auf der Ressource DocumentReference, der die Suche nach einer manuelle Markierung ermöglicht."
* code = #erg-makierung
* base = #DocumentReference
* type = #token
* expression = "DocumentReference.extension('https://gematik.de/fhir/erg/StructureDefinition/erg-rechnungsstatus').value"