RuleSet: BundleRequest(method, url)
* request
  * method = #{method}
  * url = {url}

RuleSet: Expectation (expectation)
* extension[+]
  * url = $capabilitystatement-expectation
  * valueCode = {expectation}

RuleSet: Meta
* ^status = #active
* ^version = "1.1.0-rc2"
* ^experimental = false
* ^date = "2025-04-07"
* ^publisher = "gematik GmbH"
* ^contact.telecom.system = #url
* ^contact.telecom.value = "http://gematik.de/"

RuleSet: MetaInstance
* version = "1.1.0-rc2"
* status = #active
* experimental = false
* publisher = "gematik GmbH"
* contact.telecom.system = #url
* contact.telecom.value = "http://gematik.de/"
* date = "2025-04-07"