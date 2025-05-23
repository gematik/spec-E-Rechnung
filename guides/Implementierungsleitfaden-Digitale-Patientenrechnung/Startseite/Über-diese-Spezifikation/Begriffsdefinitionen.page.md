## {{page-title}}

### Schlüsselworte

Anforderungen als Ausdruck normativer Festlegungen werden durch die dem [RFC2119](https://tools.ietf.org/html/rfc2119) entsprechenden, in Großbuchstaben geschriebenen deutschen Schlüsselworte MUSS, DARF NICHT, SOLL, SOLL NICHT, KANN sowie ihrer Pluralformen gekennzeichnet.

### Bedeutung von Must-Support-Flags

Für die unterschiedlichen Akteure gelten verschiedene Regeln zur Interpretation der "Must-Support"-Felder in den veröffentlichten FHIR-Profilen:

* Das RE-PS MUSS alle Elemente die als Must-Support gekennzeichnet sind befüllen soweit diese Informationen vorhanden sind und an den FD weitergeben könnnen. Das RE-PS MUSS die Möglichkeit zur Eingabe dieser Informationen vorsehen.

* Das DiPag FDV MUSS alle Elemente die als Must-Support gekennzeichnet sind im Frontend anzeigen und verarbeiten können.

* Der FD MUSS alle Elemente die als Must-Support gekennzeichnet sind entgegennehmen, validierenm, verarbeite und an das RE-PS, sowie ITSys-KTR weitergeben können.

### Begriffe und Abkürzungen

Siehe Abschnitt "1.7.2 Verwendete Begriffe" des Feature-Dokumentes "Digitale Patientenrechnung".