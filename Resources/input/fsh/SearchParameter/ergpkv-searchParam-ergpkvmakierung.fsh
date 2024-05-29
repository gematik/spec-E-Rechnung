Instance: ergpkv-makierung
InstanceOf: SearchParameter
Usage: #example
Title: "Suchparameter DocumentReference ergpkv-makierung"
Description: "Ein SearchParameter auf der Ressource DocumentReference, der die Suche nach einer manuelle Markierung ermöglicht."
* url = Canonical(ergpkv-makierung)
* name = "Suchparameter DocumentReference ergpkv-makierung"
* status = #active
* publisher = "gematik GmbH"
* description = "Ein SearchParameter auf der Ressource DocumentReference, der die Suche nach einer manuelle Markierung ermöglicht."
* code = #ergpkv-makierung
* base = #DocumentReference
* type = #token
* expression = "DocumentReference.extension('https://gematik.de/fhir/ergpkv/StructureDefinition/ergpkv-rechnungsstatus').value"