Instance: QuestionnaireInvoice
InstanceOf: Questionnaire

//Etablieren des Patientenkontextes aus SMART-Launch
* insert launchContext("patient", #Patient, "Patientenkontext")
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
    //ToDo: Codierung/ValueSet verwenden, Vorbelegen mit Encounter.type
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


//       Behandler       //
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
  * item[+]
    * insert addRItem("BT-41", #string, "Name")
  * item[+]
    * insert addRItem("BT-35", #string, "Straße und Hausnummer")
  * item[+]
    * insert addRItem("BT-38", #string, "PLZ")
  * item[+]
    * insert addRItem("BT-37", #string, "Ort")   

//        Behandelte Person       //
* item[+]
  * insert addRItem("behandelteperson", #group, "Behandelte Person")
  * item[+]
    * insert addItem("BT-71", #string, "Versicherten-Nummer")
    * insert initialExpression([["%patient.identifier.where(system = 'http://fhir.de/sid/gkv/kvid-10').value"]]) 
  * item[+]
    * insert addRItem("BT-70", #string, "Name") 
    * insert initialExpression([["%patient.name.where(use = 'official').select(given[0]+' '+family)"]])  
  * item[+]
    * insert addRItem("behandelteperson-geburtsdatum", #date, "Geburtsdatum")
    * insert initialExpression([["%patient.birthDate"]])

//       Rechnungsdaten          //
* item[+]
  * insert addRItem("rechnungsdaten", #group, "Rechnungsdaten")
  * item[+]
    * insert addRItem("BT-2", #date, "Rechnungsdatum")
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

  


