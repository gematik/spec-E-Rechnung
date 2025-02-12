Instance: QuestionnaireInvoice
InstanceOf: Questionnaire

//Etablieren des Patientenkontextes aus SMART-Launch
* insert launchContext("patient", #Patient, "BehandeltePerson")
//* insert launchContext("user", #Practitioner, "Leistungserbringer/Behandler")
//* insert launchContext("behandler", #Practitioner, "Leistungserbringer/Behandler")
//* extension[=].extension[0].valueCoding.system = "foo"
* status = #draft
* title = "eRechnung"
* url = "http://gefyra.de/fhir/sdc/Questionnaire/Invoice"

//        Behandlungsdaten           //
* item[+]
  * insert addRItem("behandlungsdaten", #group, "Behandlungsdaten")
  * item[+]
    * insert addRItem("behandlungsart", #choice, "Behandlungsart")
    * answerOption[+].valueString = "ambulante Behandlung"
    * answerOption[+].valueString = "stationäre Behandlung"
    * answerOption[+].valueString = "vorstationäre Behandlung"
    * answerOption[+].valueString = "stationäre Mitbehandlung"
    * answerOption[+].valueString = "nachstationäre Behandlung"
    * answerOption[+].valueString = "Konsil"
    //: Codierung/ValueSet verwenden, Vorbelegen mit Encounter.type
  * item[+] 
    * insert addItem("behandlungszeitraum", #group, "Behandlungszeitraum")
    * item[+]
      * insert addItem("BT-73", #date, "Startdatum")
    * item[+]
      * insert addItem("BT-74", #date, "Enddatum")  
  * item[+] 
    * insert addItem("diagnose", #group, "Diagnose")   
    * item[+]
      * insert addItem("diagnose-code", #choice, "ICD-10-Diagnose")
      * answerValueSet = "#TESTICD10GM"
      * insert itemControl(#autocomplete)
    * item[+]
      * insert addItem ("diagnose-text", #string, "Freitext-Diagnose")
      
* contained = TESTICD10GM




//    Rechnungsersteller    //
* item[+]
  * insert addRItem("rechnungsersteller", #group, "Rechnungsersteller")
  * item[+] 
    * insert addItem ("BT-29", #string, "Telematik-ID")

* insert variable("behandlersuchstring", [["%resource.repeat(item).where(linkId='suche-behandler').answer.value"]])
* insert query("behandlersuche",[["Practitioner?name={{%behandlersuchstring}}"]])
* insert variable("behandler", [["%behandlersuche.entry[0].resource"]])

//       Behandler       //
* item[+] insert addItem("behandler-kontext", #group, "Behandler-Kontext herstellen")
  * item[+] insert addItem("suche-behandler", #string, "Suche Behandler nach Name")
  //* insert debug("%behandlersuchstring")
  //* insert debug("%behandlersuche.total")
  //* insert debug("%behandler.name.given[0]")

* item[+]
  * insert addRItem("behandler", #group, "Behandler")
  * item[+]
    * insert addItem("behandler-iknummer", #string, "IK-Nummer")
  * item[+]
    * insert addItem("behandler-anrede", #choice, "Anrede")
    * answerOption[+].valueString = "Herr"
    * answerOption[+].valueString = "Frau"
  * item[+]
    * insert addItem("behandler-titel", #string, "Titel")
      * insert calculatedExpression("behandler-titel",[["%behandler.name[0].prefix"]])
  * item[+]
    * insert addRItem("BT-41", #string, "Name")
      * insert calculatedExpression("behandler-name",[["%behandler.name[0].select(given+' '+family)"]])
  * item[+] insert addRItem("BT-35", #string, "Straße und Hausnummer")
    * insert calculatedExpression("behandler-line",[["%behandler.address[0].line[0]"]])
  * item[+] insert addRItem("BT-38", #string, "PLZ")
    * insert calculatedExpression("behandler-line",[["%behandler.address[0].postalCode"]])
  * item[+] insert addRItem("BT-37", #string, "Ort")   
    * insert calculatedExpression("behandler-line",[["%behandler.address[0].city"]])

//        Behandelte Person       //
* item[+]
  * insert addRItem("behandelteperson", #group, "Behandelte Person")
  * item[+]
    * insert addItem("BT-71", #string, "Versicherten-Nummer")
    * insert initialExpression([["%patient.identifier.where(system='http://fhir.de/sid/gkv/kvid-10').value"]]) 
  * item[+]
    * insert addRItem("BT-70", #string, "Name") 
    * insert initialExpression([["(%patient.name.where(use = 'official').select(given[0]+' '+family) | %patient.name[0].select(given[0]+' '+family)).first()"]])  
  * item[+]
    * insert addRItem("behandelteperson-geburtsdatum", #date, "Geburtsdatum")
    * insert initialExpression([["%patient.birthDate"]])

//       Rechnungsdaten          //
* item[+]
  * insert addRItem("rechnungsdaten", #group, "Rechnungsdaten")
  * item[+]
    * insert addRItem("BT-2", #date, "Rechnungsdatum")
    * insert initialExpression([["today()"]])
  * item[+]
    * insert addRItem("BT-1", #string, "Rechnungsnummer") 
  * item[+]
    * insert addRItem("BT-106", #decimal, "Gesamtsumme") 
    * insert munit(EUR) 


//       Rechnungspositionen    //
  * item[+]
    * insert addRItem("rechnungsposition", #group, "Rechnungspositionen") 
    * repeats = true
    * item[+]
      * insert addRItem("rechnungsposition-datum", #date, "Datum")
    * item[+]
      * insert addRItem("gebuehrenordnung", #choice, "Gebührenordnung")
      * answerOption[+].valueString = "GOÄ"
      * answerOption[+].valueString = "GOZ"
    * item[+]
      * insert addRItem("BT-155", #string, "Ziffer") 
    * item[+]
      * insert addRItem("BT-153", #string, "Leistungsbezeichnung") 
    * item[+]
      * insert addRItem("rechnungsposition-begruendung", #string, "Begründung") 
    * item[+]
      * insert addRItem("rechnungsposition-mindestdauer", #string, "Mindestdauer") 
    * item[+]
      * insert addItem("rechnungsposition-zahnregion", #string, "Zahnregion") 
    //          Wegegeld            //
    * item[+]
      * insert addRItem("wegegeld", #group, "Wegegeld") 
      * item[+]
        * insert addRItem("BT-130", #decimal, "Entfernung") 
        * insert uunit(km)
      * item[+]
        * insert addRItem("gebuehrenordnung", #choice, "Gebührenordnung")
        * answerOption[+].valueString = "Tag"
        * answerOption[+].valueString = "Nacht"
      * item[+]
        * insert addRItem("BT-129", #decimal, "Anzahl")        
    * item[+]
      * insert addRItem("BT-131", #decimal, "Gesamtpreis") 
      * insert munit(EUR)


  * item[+]
    * insert addRItem("BT-144", #string, "Begründung für Überschreitung der Regelsätze")
  * item[+]
    * insert addRItem("BT-9", #date, "Zahlungsziel")

  //       Rechnungspositionen    //
  * item[+]
    * insert addRItem("zahlungsdaten", #group, "Zahlungsdaten")   
    * item[+]
      * insert addRItem("BT-85", #string, "Kontoinhaber")    
    * item[+]
      * insert addRItem("BT-84", #string, "IBAN")   
    * item[+]
      * insert addItem("BT-86", #string, "BIC") 
    * item[+]
      * insert addItem("zahlungsdaten-bank", #string, "Name der Bank")       
    * item[+]
      * insert addRItem("BT-83", #string, "Verwendungszweck")   

  


