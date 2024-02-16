Alias: $unitsofmeasure = http://unitsofmeasure.org
Alias: $currency = urn:iso:std:iso:4217

RuleSet: addItem(linkId, type, text)
* linkId = {linkId}
* type = {type}
* text = {text}

RuleSet: addRItem(linkId, type, text)
* insert addItem({linkId}, {type}, {text})
* required = true

RuleSet: debug(variable)
* item[+]
  * linkId = {variable}
  * type = #string
  * text = {variable}
  * readOnly = true
  * insert calculatedExpression("debug", {variable})

RuleSet: minMaxInteger(min, max)
* extension[+] 
  * url = "http://hl7.org/fhir/StructureDefinition/maxValue"
  * valueInteger = {max}
* extension[+] 
  * url = "http://hl7.org/fhir/StructureDefinition/minValue"
  * valueInteger = {min}

RuleSet: minMaxDecimal(min, max)
* extension[+] 
  * url = "http://hl7.org/fhir/StructureDefinition/maxValue"
  * valueDecimal = {max}
* extension[+] 
  * url = "http://hl7.org/fhir/StructureDefinition/minValue"
  * valueDecimal = {min}

//name = patient | encounter | location | user | study
RuleSet: launchContext(name, type, description)
* extension[+]
  * url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-launchContext"
  * extension[+]
    * url = "name"
    * valueCoding = http://hl7.org/fhir/uv/sdc/CodeSystem/launchContext#{name}
  * extension[+]
    * url = "type"
    * valueCode = {type}
  * extension[+]
    * url = "description"
    * valueString = {description}

RuleSet: initialExpression(expression)
* extension[+]
  * url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression"
  * valueExpression
    //* description = {description}
    * language = #text/fhirpath
    * expression = {expression}

RuleSet: observationLinkPeriod(duration)
* extension[+]
  * url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-observationLinkPeriod"
  * valueDuration = {duration}

RuleSet: observationExtract
* extension[+]
  * url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-observationExtract"
  * valueBoolean = true

//nicht supported in LHC Forms!
RuleSet: supportLink(link)
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/questionnaire-supportLink"
  * valueUri = {link}

RuleSet: variable(name, expression)
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = {name}
    * language = #text/fhirpath
    * expression = {expression}

RuleSet: query(name, query)
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/variable"
  * valueExpression
    * name = {name}
    * language = #application/x-fhir-query
    * expression = {query}

RuleSet: uunit(code)
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/questionnaire-unit"
  * valueCoding = $unitsofmeasure#{code}

RuleSet: munit(code)
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/questionnaire-unit"
  * valueCoding = $currency#{code}


RuleSet: calculatedExpression(name, expression)
* extension[+]
  * url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-calculatedExpression"
  * valueExpression
    * name = {name}
    * language = #text/fhirpath
    * expression = {expression}

RuleSet: calculatedQuery(name, query)
* extension[+]
  * url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-calculatedExpression"
  * valueExpression
    * name = {name}
    * language = #application/x-fhir-query
    * expression = {query}    

RuleSet: entryFormat(string)
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/entryFormat"
  * valueString = {string}

RuleSet: itemControl(code)
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/questionnaire-itemControl"
  * valueCodeableConcept = http://hl7.org/fhir/questionnaire-item-control{code}

RuleSet: ordinalValue(decimal)
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/ordinalValue"
  * valueDecimal = {decimal}

RuleSet: regEx(expression)
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/regex"
  * valueString = {expression}


RuleSet: prepopContext(name, query)
* extension[+]
  * url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-itemPopulationContext"
  * valueExpression
    * name = {name}
    * language = application/x-fhir-query
    * expression = {query}
