mehr-schulferien.de
===================

Die Webseite [mehr-schulferien.de](http://mehr-schulferien.de) soll die Ferienplanung für Schüler, Lehrer und Eltern vereinfachen. Es werden nicht nur Ferien und Feiertage, sondern auch die [Beweglichen Ferientage](http://de.wikipedia.org/wiki/Bewegliche_Ferientage) der einzelnen Schulen beachtet. 

Die gleichen Daten lassen sich natürlich auch für die optimale Ferienplanung von Nicht-Eltern und Nicht-Schülern benutzen.

Entwickler
==========
Es handelt sich um ein Open-Source-Projekt das unter der MIT-Lizenz veröffentlicht wird. 

Wer mitmachen will, der ist herzlich dazu eingeladen! Patches bitte per Pull-Request einstellen. Die initiale Datenbank kann wie folgt eingespielt werden: 

```bash
rake db:migrate
rake db:seed
```

Damit hat man alle deutschen Bundesländer, viele Städte und Ferientermine.

Wer sich mit Ruby on Rails nicht auskennt, kann mal einen Blick in mein [Ruby on Rails 3.2 Buch](http://ruby-auf-schienen.de) werfen. Die 4.0er Version gibt es aktuell nur bei Amazon.

Bei Fragen, Lob, Kritik oder Anregungen freue ich mich über eine E-Mail an 
stefan.wintermeyer@amooma.de

[![Code Climate](https://codeclimate.com/github/wintermeyer/mehr-schulferien.de.png)](https://codeclimate.com/github/wintermeyer/mehr-schulferien.de)
