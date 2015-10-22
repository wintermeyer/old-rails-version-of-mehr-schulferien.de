# Deutschland
#
country = Country.where(name: 'Deutschland', slug: 'deutschland').first_or_create

# federal_states
#
FederalState.where(name: 'Baden-Württemberg', slug: 'baden-wuerttemberg', country_id: country.id, url: 'http://www.kultusportal-bw.de/,Lde/Startseite/schulebw/Ferien').first_or_create
FederalState.where(name: 'Bayern', slug: 'bayern', country_id: country.id, url: 'http://www.km.bayern.de/ministerium/termine/ferientermine.html').first_or_create
FederalState.where(name: 'Berlin', slug: 'berlin', country_id: country.id, url: 'https://www.berlin.de/sen/bildung/schulkalender/ferientermine.html').first_or_create
FederalState.where(name: 'Brandenburg', slug: 'brandenburg', country_id: country.id, url: 'http://www.mbjs.brandenburg.de/cms/detail.php/90062').first_or_create
FederalState.where(name: 'Bremen', slug: 'bremen', country_id: country.id, url: 'https://www.bildung.bremen.de/sixcms/detail.php?gsid=bremen117.c.3404.de').first_or_create
FederalState.where(name: 'Hamburg', slug: 'hamburg', country_id: country.id, url: 'http://www.hamburg.de/contentblob/4408058/data/langfr-ferien-2017-2024.pdf').first_or_create
FederalState.where(name: 'Hessen', slug: 'hessen', country_id: country.id, url: 'https://kultusministerium.hessen.de/schule/ferien-hessen/ferientermine').first_or_create
FederalState.where(name: 'Mecklenburg-Vorpommern', slug: 'mecklenburg-vorpommern', country_id: country.id, url: 'http://www.regierung-mv.de/cms2/Regierungsportal_prod/Regierungsportal/de/bm/_Service/Ferientermine/index.jsp').first_or_create
FederalState.where(name: 'Niedersachsen', slug: 'niedersachsen', country_id: country.id, url: 'http://www.mk.niedersachsen.de/portal/live.php?navigation_id=24724&article_id=6491&_psmand=8').first_or_create
FederalState.where(name: 'Nordrhein-Westfalen', slug: 'nordrhein-westfalen', country_id: country.id, url: 'https://www.schulministerium.nrw.de/docs/bp/Schueler/Ferien-Pruefungen/Ferientermine/Ferienordnung-NRW/').first_or_create
FederalState.where(name: 'Rheinland-Pfalz', slug: 'rheinland-pfalz', country_id: country.id, url: 'http://mbwwk.rlp.de/service/ferientermine-in-rlp/').first_or_create
FederalState.where(name: 'Saarland', slug: 'saarland', country_id: country.id, url: 'http://www.saarland.de/72694.htm').first_or_create
FederalState.where(name: 'Sachsen', slug: 'sachsen', country_id: country.id, url: 'http://www.schule.sachsen.de/413.htm').first_or_create
FederalState.where(name: 'Sachsen-Anhalt', slug: 'sachsen-anhalt', country_id: country.id, url: 'http://www.mk.bildung-lsa.de/bildung/er-ferien.pdf').first_or_create
FederalState.where(name: 'Schleswig-Holstein', slug: 'schleswig-holstein', country_id: country.id, url: 'http://www.schleswig-holstein.de/DE/Themen/F/Ferien.html').first_or_create
FederalState.where(name: 'Thüringen', slug: 'thueringen', country_id: country.id, url: 'http://www.thueringen.de/th2/tmbjs/bildung/schulwesen/ferien/').first_or_create

# Event Typen
#
ferien = EventType.where(name: 'Ferien', css_class: 'success').first_or_create
feiertag = EventType.where(name: 'Feiertage', css_class: 'info').first_or_create
wochenende = EventType.where(name: 'Wochenende', css_class: 'active').first_or_create

# Years
#
(2015..2040).each do |year|
  Year.create(value: year)
end

# Religionen
#
katholisch = Religion.where(name: 'Katholisch', slug: 'katholisch').first_or_create
evangelisch = Religion.where(name: 'Evangelisch', slug: 'evangelisch').first_or_create
juedisch = Religion.where(name: 'Jüdisch', slug: 'juedisch').first_or_create
islamisch = Religion.where(name: 'Islam', slug: 'islam').first_or_create

# Baden-Württemberg
#
federal_state = FederalState.where(name: 'Baden-Württemberg', slug: 'baden-wuerttemberg', country_id: country.id, url: 'http://www.kultusportal-bw.de/,Lde/Startseite/schulebw/Ferien').first_or_create

# Ferientermine für Baden-Württemberg
#
[
  ['2014-12-22', '2015-01-05', 'Weihnachtsferien', 1],
  ['2015-03-30', '2015-04-10', 'Osterferien', 1],
  ['2015-05-26', '2015-06-06', 'Pfingstferien', 1],
  ['2015-07-30', '2015-09-12', 'Sommerferien', 1],
  ['2015-11-02', '2015-11-06', 'Herbstferien', 1],
  ['2015-12-23', '2016-01-09', 'Weihnachtsferien', 1],
  ['2016-03-29', '2016-04-02', 'Osterferien', 1],
  ['2016-05-17', '2016-05-28', 'Pfingstferien', 1],
  ['2016-07-28', '2016-09-10', 'Sommerferien', 1],
  ['2016-11-02', '2016-11-04', 'Herbstferien', 1],
  ['2016-12-23', '2017-01-07', 'Weihnachtsferien', 1],
  ['2017-04-10', '2017-04-21', 'Osterferien', 1],
  ['2017-06-06', '2017-06-16', 'Pfingstferien', 1],
  ['2017-07-27', '2017-09-09', 'Sommerferien', 1],
  ['2017-10-30', '2017-11-03', 'Herbstferien', 1],
  ['2017-12-22', '2018-01-05', 'Weihnachtsferien', 1],
  ['2018-03-26', '2018-04-06', 'Osterferien', 1],
  ['2018-05-22', '2018-06-02', 'Pfingstferien', 1],
  ['2018-07-26', '2018-09-08', 'Sommerferien', 1],
  ['2018-10-29', '2018-11-02', 'Herbstferien', 1],
  ['2018-12-24', '2019-01-05', 'Weihnachtsferien', 1],
  ['2019-04-15', '2019-04-27', 'Osterferien', 1],
  ['2019-06-11', '2019-06-21', 'Pfingstferien', 1],
  ['2019-07-29', '2019-09-10', 'Sommerferien', 1],
  ['2019-10-28', '2019-10-30', 'Herbstferien', 1],
  ['2019-12-23', '2020-01-04', 'Weihnachtsferien', 1],
  ['2020-04-06', '2020-04-18', 'Osterferien', 1],
  ['2020-06-02', '2020-06-13', 'Pfingstferien', 1]
].each do |new_event|
  federal_state.events.where(starts_on: new_event[0], ends_on: new_event[1], summary: new_event[2], event_type_id: new_event[3]).first_or_create
end

# Feiertage für Baden-Württemberg
#
[
  ['2015-01-01', '2015-01-01', 'Neujahr', 2],
  ['2015-01-06', '2015-01-06', 'Heilige Drei Könige', 2],
  ['2015-04-03', '2015-04-03', 'Karfreitag', 2],
  ['2015-04-06', '2015-04-06', 'Ostermontag', 2],
  ['2015-05-01', '2015-05-01', 'Tag der Arbeit', 2],
  ['2015-05-14', '2015-05-14', 'Christi Himmelfahrt', 2],
  ['2015-05-25', '2015-05-25', 'Pfingstmontag', 2],
  ['2015-06-04', '2015-06-04', 'Fronleichnam', 2],
  ['2015-10-03', '2015-10-03', 'Tag der Deutschen Einheit', 2],
  ['2015-10-31', '2015-10-31', 'Reformationstag', 2],
  ['2015-11-01', '2015-11-01', 'Allerheiligen', 2],
  ['2015-12-25', '2015-12-25', '1. Weihnachtstag', 2],
  ['2015-12-26', '2015-12-26', '2. Weihnachtstag', 2],
  ['2016-01-01', '2016-01-01', 'Neujahr', 2],
  ['2016-01-06', '2016-01-06', 'Heilige Drei Könige', 2],
  ['2016-03-24', '2016-03-24', 'Gründonnerstag', 2],
  ['2016-03-25', '2016-03-25', 'Karfreitag', 2],
  ['2016-03-28', '2016-03-28', 'Ostermontag', 2],
  ['2016-05-01', '2016-05-01', 'Tag der Arbeit', 2],
  ['2016-05-05', '2016-05-05', 'Christi Himmelfahrt', 2],
  ['2016-05-16', '2016-05-16', 'Pfingstmontag', 2],
  ['2016-05-26', '2016-05-26', 'Fronleichnam', 2],
  ['2016-10-03', '2016-10-03', 'Tag der Deutschen Einheit', 2],
  ['2016-10-31', '2016-10-31', 'Reformationstag', 2],
  ['2016-11-01', '2016-11-01', 'Allerheiligen', 2],
  ['2016-12-25', '2016-12-25', '1. Weihnachtstag', 2],
  ['2016-12-26', '2016-12-26', '2. Weihnachtstag', 2],
  ['2017-01-01', '2017-01-01', 'Neujahr', 2],
  ['2017-01-06', '2017-01-06', 'Heilige Drei Könige', 2],
  ['2017-04-14', '2017-04-14', 'Karfreitag', 2],
  ['2017-04-17', '2017-04-17', 'Ostermontag', 2],
  ['2017-05-01', '2017-05-01', 'Tag der Arbeit', 2],
  ['2017-05-25', '2017-05-25', 'Christi Himmelfahrt', 2],
  ['2017-06-05', '2017-06-05', 'Pfingstmontag', 2],
  ['2017-06-15', '2017-06-15', 'Fronleichnam', 2],
  ['2017-10-03', '2017-10-03', 'Tag der Deutschen Einheit', 2],
  ['2017-10-31', '2017-10-31', 'Reformationstag', 2],
  ['2017-11-01', '2017-11-01', 'Allerheiligen', 2],
  ['2017-12-25', '2017-12-25', '1. Weihnachtstag', 2],
  ['2017-12-26', '2017-12-26', '2. Weihnachtstag', 2],
].each do |new_event|
  federal_state.events.where(starts_on: new_event[0], ends_on: new_event[1], summary: new_event[2], event_type_id: new_event[3]).first_or_create
end

# Bayern
#
federal_state = FederalState.where(name: 'Bayern', slug: 'bayern', country_id: country.id, url: 'http://www.km.bayern.de/ministerium/termine/ferientermine.html').first_or_create

# Ferientermine für Bayern
#
[
  ['2014-12-24', '2015-01-05', 'Weihnachtsferien', 1],
  ['2015-02-16', '2015-02-20', 'Frühjahrsferien', 1],
  ['2015-03-30', '2015-04-11', 'Osterferien', 1],
  ['2015-05-26', '2015-06-05', 'Pfingstferien', 1],
  ['2015-08-01', '2015-09-14', 'Sommerferien', 1],
  ['2015-11-02', '2015-11-07', 'unterichtsfreie Tage um Allerheiligen', 1],
  ['2015-12-24', '2016-01-05', 'Weihnachtsferien', 1],
  ['2016-02-08', '2016-02-12', 'Frühjahrsferien', 1],
  ['2016-03-21', '2016-04-01', 'Osterferien', 1],
  ['2016-05-17', '2016-05-28', 'Pfingstferien', 1],
  ['2016-07-30', '2016-09-12', 'Sommerferien', 1],
  ['2016-10-31', '2016-11-04', 'unterichtsfreie Tage um Allerheiligen', 1],
  ['2016-12-24', '2017-01-05', 'Weihnachtsferien', 1],
  ['2017-02-27', '2017-03-03', 'Frühjahrsferien', 1],
  ['2017-04-10', '2017-04-22', 'Osterferien', 1],
  ['2017-06-06', '2017-06-16', 'Pfingstferien', 1],
  ['2017-07-29', '2017-09-11', 'Sommerferien', 1],
  ['2017-10-30', '2017-11-03', 'unterichtsfreie Tage um Allerheiligen', 1],
  ['2017-12-23', '2018-01-05', 'Weihnachtsferien', 1],
  ['2018-02-12', '2018-02-16', 'Frühjahrsferien', 1],
  ['2018-03-26', '2018-04-07', 'Osterferien', 1],
  ['2018-05-22', '2018-06-02', 'Pfingstferien', 1],

  ['2018-07-30', '2018-09-10', 'Sommerferien', 1],
  ['2018-10-29', '2018-11-02', 'unterichtsfreie Tage um Allerheiligen', 1],
  ['2018-12-22', '2019-01-05', 'Weihnachtsferien', 1],
  ['2019-03-04', '2019-03-08', 'Frühjahrsferien', 1],
  ['2019-03-15', '2019-04-27', 'Osterferien', 1],
  ['2019-06-11', '2019-06-21', 'Pfingstferien', 1],

  ['2019-07-29', '2019-09-09', 'Sommerferien', 1],
  ['2019-10-28', '2019-10-31', 'unterichtsfreie Tage um Allerheiligen', 1],
  ['2019-12-23', '2020-01-04', 'Weihnachtsferien', 1],
  ['2020-02-24', '2020-02-28', 'Frühjahrsferien', 1],
  ['2020-04-06', '2020-04-18', 'Osterferien', 1],
  ['2020-06-02', '2020-06-13', 'Pfingstferien', 1],

  ['2020-07-27', '2020-09-07', 'Sommerferien', 1],
  ['2020-10-31', '2020-11-06', 'unterichtsfreie Tage um Allerheiligen', 1],
  ['2020-12-23', '2021-01-09', 'Weihnachtsferien', 1],
  ['2021-02-15', '2021-02-19', 'Frühjahrsferien', 1],
  ['2021-03-29', '2021-04-10', 'Osterferien', 1],
  ['2021-05-25', '2021-06-04', 'Pfingstferien', 1],

  ['2021-07-30', '2021-09-13', 'Sommerferien', 1],
  ['2021-11-02', '2021-11-05', 'unterichtsfreie Tage um Allerheiligen', 1],
  ['2021-12-24', '2022-01-08', 'Weihnachtsferien', 1],
  ['2022-02-28', '2022-03-04', 'Frühjahrsferien', 1],
  ['2022-04-11', '2022-04-23', 'Osterferien', 1],
  ['2022-06-07', '2022-06-18', 'Pfingstferien', 1],

  ['2022-08-01', '2022-09-12', 'Sommerferien', 1],
  ['2022-10-31', '2022-11-04', 'unterichtsfreie Tage um Allerheiligen', 1],
  ['2022-12-24', '2023-01-07', 'Weihnachtsferien', 1],
  ['2023-02-20', '2023-02-24', 'Frühjahrsferien', 1],
  ['2023-04-03', '2023-04-15', 'Osterferien', 1],
  ['2023-05-30', '2023-06-09', 'Pfingstferien', 1],

  ['2023-07-31', '2023-09-11', 'Sommerferien', 1],
  ['2023-10-30', '2023-11-03', 'unterichtsfreie Tage um Allerheiligen', 1],
  ['2023-12-23', '2024-01-05', 'Weihnachtsferien', 1],
  ['2024-02-12', '2024-02-16', 'Frühjahrsferien', 1],
  ['2024-03-25', '2024-04-06', 'Osterferien', 1],
  ['2024-05-21', '2024-06-01', 'Pfingstferien', 1],

].each do |new_event|
  federal_state.events.where(starts_on: new_event[0], ends_on: new_event[1], summary: new_event[2], event_type_id: new_event[3]).first_or_create
end

# Feiertage für Bayern
#
[
  ['2015-01-01', '2015-01-01', 'Neujahr', 2],
  ['2015-01-06', '2015-01-06', 'Heilige Drei Könige', 2],
  ['2015-04-03', '2015-04-03', 'Karfreitag', 2],
  ['2015-04-06', '2015-04-06', 'Ostermontag', 2],
  ['2015-05-01', '2015-05-01', 'Tag der Arbeit', 2],
  ['2015-05-14', '2015-05-14', 'Christi Himmelfahrt', 2],
  ['2015-05-25', '2015-05-25', 'Pfingstmontag', 2],
  ['2015-06-04', '2015-06-04', 'Fronleichnam', 2],
  ['2015-08-15', '2015-08-15', 'Mariä Himmelfahrt', 2],
  ['2015-10-03', '2015-10-03', 'Tag der Deutschen Einheit', 2],
  ['2015-11-01', '2015-11-01', 'Allerheiligen', 2],
  ['2015-12-25', '2015-12-25', '1. Weihnachtstag', 2],
  ['2015-12-26', '2015-12-26', '2. Weihnachtstag', 2],
  ['2016-01-01', '2016-01-01', 'Neujahr', 2],
  ['2016-01-06', '2016-01-06', 'Heilige Drei Könige', 2],
  ['2016-03-25', '2016-03-25', 'Karfreitag', 2],
  ['2016-03-28', '2016-03-28', 'Ostermontag', 2],
  ['2016-05-01', '2016-05-01', 'Tag der Arbeit', 2],
  ['2016-05-05', '2016-05-05', 'Christi Himmelfahrt', 2],
  ['2016-05-16', '2016-05-16', 'Pfingstmontag', 2],
  ['2016-05-26', '2016-05-26', 'Fronleichnam', 2],
  ['2016-08-15', '2016-08-15', 'Mariä Himmelfahrt', 2],
  ['2016-10-03', '2016-10-03', 'Tag der Deutschen Einheit', 2],
  ['2016-11-01', '2016-11-01', 'Allerheiligen', 2],
  ['2016-12-25', '2016-12-25', '1. Weihnachtstag', 2],
  ['2016-12-26', '2016-12-26', '2. Weihnachtstag', 2],
  ['2017-01-01', '2017-01-01', 'Neujahr', 2],
  ['2017-01-06', '2017-01-06', 'Heilige Drei Könige', 2],
  ['2017-04-14', '2017-04-14', 'Karfreitag', 2],
  ['2017-04-17', '2017-04-17', 'Ostermontag', 2],
  ['2017-05-01', '2017-05-01', 'Tag der Arbeit', 2],
  ['2017-05-25', '2017-05-25', 'Christi Himmelfahrt', 2],
  ['2017-06-05', '2017-06-05', 'Pfingstmontag', 2],
  ['2017-06-15', '2017-06-15', 'Fronleichnam', 2],
  ['2017-08-15', '2017-08-15', 'Mariä Himmelfahrt', 2],
  ['2017-10-03', '2017-10-03', 'Tag der Deutschen Einheit', 2],
  ['2017-10-31', '2017-10-31', 'Reformationstag', 2],
  ['2017-11-01', '2017-11-01', 'Allerheiligen', 2],
  ['2017-12-25', '2017-12-25', '1. Weihnachtstag', 2],
  ['2017-12-26', '2017-12-26', '2. Weihnachtstag', 2],
  ['2015-11-18', '2015-11-18', 'Buß- und Bettag', 1],
  ['2016-11-16', '2016-11-16', 'Buß- und Bettag', 1],
  ['2017-11-22', '2017-11-22', 'Buß- und Bettag', 1],
].each do |new_event|
  # TODO: Feiertage 2018 - 2024 für Bayern

  federal_state.events.where(starts_on: new_event[0], ends_on: new_event[1], summary: new_event[2], event_type_id: new_event[3]).first_or_create
end


# Berlin
#
federal_state = FederalState.where(name: 'Berlin', slug: 'berlin', country_id: country.id, url: 'https://www.berlin.de/sen/bildung/schulkalender/ferientermine.html').first_or_create

# Ferientermine für Berlin
#
[
  ['2014-12-22', '2015-01-02', 'Weihnachtsferien', 1],
  ['2015-02-02', '2015-02-07', 'Winterferien', 1],
  ['2015-03-30', '2015-04-11', 'Osterferien', 1],
  ['2015-05-15', '2015-05-15', 'Unterrichtsfreie Tage', 1],
  ['2015-05-26', '2015-05-26', 'Pfingstferien', 1],
  ['2015-07-16', '2015-08-28', 'Sommerferien', 1],

  ['2015-10-19', '2015-10-31', 'Herbstferien', 1],
  ['2015-12-23', '2016-01-02', 'Weihnachtsferien', 1],
  ['2016-02-01', '2016-02-06', 'Winterferien', 1],
  ['2016-03-21', '2016-04-02', 'Osterferien', 1],
  ['2016-05-06', '2016-05-06', 'Unterrichtsfreie Tage', 1],
  ['2016-05-17', '2016-05-18', 'Pfingstferien', 1],
  ['2016-07-21', '2016-09-02', 'Sommerferien', 1],

  ['2016-10-17', '2016-10-28', 'Herbstferien', 1],
  ['2016-12-23', '2017-01-03', 'Weihnachtsferien', 1],
  ['2017-01-30', '2017-02-04', 'Winterferien', 1],
  ['2017-04-10', '2017-04-18', 'Osterferien', 1],
  ['2017-05-24', '2017-05-24', 'Unterrichtsfreie Tage', 1],
  ['2017-05-26', '2017-05-26', 'Unterrichtsfreie Tage', 1],
  ['2017-06-06', '2017-06-09', 'Pfingstferien', 1],
  ['2017-07-20', '2017-09-01', 'Sommerferien', 1],
].each do |new_event|
  federal_state.events.where(starts_on: new_event[0], ends_on: new_event[1], summary: new_event[2], event_type_id: new_event[3]).first_or_create
end

# Feiertage für Berlin
#
[
  ['2015-01-01', '2015-01-01', 'Neujahr', 2],
  ['2015-04-03', '2015-04-03', 'Karfreitag', 2],
  ['2015-04-06', '2015-04-06', 'Ostermontag', 2],
  ['2015-05-01', '2015-05-01', 'Tag der Arbeit', 2],
  ['2015-05-14', '2015-05-14', 'Christi Himmelfahrt', 2],
  ['2015-05-25', '2015-05-25', 'Pfingstmontag', 2],
  ['2015-10-03', '2015-10-03', 'Tag der Deutschen Einheit', 2],
  ['2015-12-25', '2015-12-25', '1. Weihnachtstag', 2],
  ['2015-12-26', '2015-12-26', '2. Weihnachtstag', 2],
  ['2016-01-01', '2016-01-01', 'Neujahr', 2],
  ['2016-03-25', '2016-03-25', 'Karfreitag', 2],
  ['2016-03-28', '2016-03-28', 'Ostermontag', 2],
  ['2016-05-01', '2016-05-01', 'Tag der Arbeit', 2],
  ['2016-05-05', '2016-05-05', 'Christi Himmelfahrt', 2],
  ['2016-05-16', '2016-05-16', 'Pfingstmontag', 2],
  ['2016-10-03', '2016-10-03', 'Tag der Deutschen Einheit', 2],
  ['2016-12-25', '2016-12-25', '1. Weihnachtstag', 2],
  ['2016-12-26', '2016-12-26', '2. Weihnachtstag', 2],
  ['2017-01-01', '2017-01-01', 'Neujahr', 2],
  ['2017-04-14', '2017-04-14', 'Karfreitag', 2],
  ['2017-04-17', '2017-04-17', 'Ostermontag', 2],
  ['2017-05-01', '2017-05-01', 'Tag der Arbeit', 2],
  ['2017-05-25', '2017-05-25', 'Christi Himmelfahrt', 2],
  ['2017-06-05', '2017-06-05', 'Pfingstmontag', 2],
  ['2017-10-03', '2017-10-03', 'Tag der Deutschen Einheit', 2],
  ['2017-10-31', '2017-10-31', 'Reformationstag', 2],
  ['2017-12-25', '2017-12-25', '1. Weihnachtstag', 2],
  ['2017-12-26', '2017-12-26', '2. Weihnachtstag', 2],

  ['2015-01-06', '2015-01-06', 'Fest der Erscheinung des Herrn', 2, katholisch.id],
  ['2016-01-06', '2016-01-06', 'Fest der Erscheinung des Herrn', 2, katholisch.id],
  ['2017-01-06', '2017-01-06', 'Fest der Erscheinung des Herrn', 2, katholisch.id],
  ['2018-01-06', '2018-01-06', 'Fest der Erscheinung des Herrn', 2, katholisch.id],
  ['2019-01-06', '2019-01-06', 'Fest der Erscheinung des Herrn', 2, katholisch.id],
  ['2020-01-06', '2020-01-06', 'Fest der Erscheinung des Herrn', 2, katholisch.id],
  ['2021-01-06', '2021-01-06', 'Fest der Erscheinung des Herrn', 2, katholisch.id],
  ['2015-06-04', '2015-06-04', 'Fronleichnam', 2, katholisch.id],
  ['2016-05-26', '2016-05-26', 'Fronleichnam', 2, katholisch.id],
  ['2017-06-15', '2017-06-15', 'Fronleichnam', 2, katholisch.id],
  ['2018-05-31', '2018-05-31', 'Fronleichnam', 2, katholisch.id],
  ['2019-06-20', '2019-06-20', 'Fronleichnam', 2, katholisch.id],
  ['2015-11-01', '2015-11-01', 'Allerheiligen', 2, katholisch.id],
  ['2016-11-01', '2016-11-01', 'Allerheiligen', 2, katholisch.id],
  ['2017-11-01', '2017-11-01', 'Allerheiligen', 2, katholisch.id],
  ['2018-11-01', '2018-11-01', 'Allerheiligen', 2, katholisch.id],
  ['2019-11-01', '2019-11-01', 'Allerheiligen', 2, katholisch.id],
  ['2020-11-01', '2020-11-01', 'Allerheiligen', 2, katholisch.id],
  ['2021-11-01', '2021-11-01', 'Allerheiligen', 2, katholisch.id],

  ['2015-10-31', '2015-10-31', 'Reformationstag', 2, evangelisch.id],
  ['2016-10-31', '2016-10-31', 'Reformationstag', 2, evangelisch.id],
  ['2017-10-31', '2017-10-31', 'Reformationstag', 2, evangelisch.id],
  ['2018-10-31', '2018-10-31', 'Reformationstag', 2, evangelisch.id],
  ['2019-10-31', '2019-10-31', 'Reformationstag', 2, evangelisch.id],
  ['2020-10-31', '2020-10-31', 'Reformationstag', 2, evangelisch.id],
  ['2021-10-31', '2021-10-31', 'Reformationstag', 2, evangelisch.id],
  ['2015-11-18', '2015-11-18', 'Buß- und Bettag', 2, evangelisch.id],
  ['2016-11-16', '2016-11-16', 'Buß- und Bettag', 2, evangelisch.id],
  ['2017-11-22', '2017-11-22', 'Buß- und Bettag', 2, evangelisch.id],
  ['2018-11-21', '2018-11-21', 'Buß- und Bettag', 2, evangelisch.id],
  ['2019-11-20', '2019-11-20', 'Buß- und Bettag', 2, evangelisch.id],
  ['2020-11-18', '2020-11-18', 'Buß- und Bettag', 2, evangelisch.id],
  ['2021-11-17', '2021-11-17', 'Buß- und Bettag', 2, evangelisch.id],

  ['2015-04-04', '2015-04-04', 'Pessach (Fest des ungesäuerten Brotes)', 2, juedisch.id],
  ['2015-04-05', '2015-04-05', 'Pessach (Fest des ungesäuerten Brotes)', 2, juedisch.id],
  ['2015-04-10', '2015-04-10', 'Pessach (Fest des ungesäuerten Brotes)', 2, juedisch.id],
  ['2015-04-11', '2015-04-11', 'Pessach (Fest des ungesäuerten Brotes)', 2, juedisch.id],
  ['2016-04-23', '2016-04-23', 'Pessach (Fest des ungesäuerten Brotes)', 2, juedisch.id],
  ['2016-04-24', '2016-04-24', 'Pessach (Fest des ungesäuerten Brotes)', 2, juedisch.id],
  ['2016-04-29', '2016-04-29', 'Pessach (Fest des ungesäuerten Brotes)', 2, juedisch.id],
  ['2016-04-30', '2016-04-30', 'Pessach (Fest des ungesäuerten Brotes)', 2, juedisch.id],
  ['2017-04-11', '2017-04-11', 'Pessach (Fest des ungesäuerten Brotes)', 2, juedisch.id],
  ['2017-04-12', '2017-04-12', 'Pessach (Fest des ungesäuerten Brotes)', 2, juedisch.id],
  ['2017-04-17', '2017-04-17', 'Pessach (Fest des ungesäuerten Brotes)', 2, juedisch.id],
  ['2017-04-18', '2017-04-18', 'Pessach (Fest des ungesäuerten Brotes)', 2, juedisch.id],
  ['2018-03-31', '2018-03-31', 'Pessach (Fest des ungesäuerten Brotes)', 2, juedisch.id],
  ['2018-04-01', '2018-04-01', 'Pessach (Fest des ungesäuerten Brotes)', 2, juedisch.id],
  ['2018-04-06', '2018-04-06', 'Pessach (Fest des ungesäuerten Brotes)', 2, juedisch.id],
  ['2018-04-07', '2018-04-07', 'Pessach (Fest des ungesäuerten Brotes)', 2, juedisch.id],
  ['2019-04-20', '2019-04-20', 'Pessach (Fest des ungesäuerten Brotes)', 2, juedisch.id],
  ['2019-04-21', '2019-04-21', 'Pessach (Fest des ungesäuerten Brotes)', 2, juedisch.id],
  ['2019-04-26', '2019-04-26', 'Pessach (Fest des ungesäuerten Brotes)', 2, juedisch.id],
  ['2019-04-27', '2019-04-27', 'Pessach (Fest des ungesäuerten Brotes)', 2, juedisch.id],
  ['2020-04-09', '2020-04-09', 'Pessach (Fest des ungesäuerten Brotes)', 2, juedisch.id],
  ['2020-04-10', '2020-04-10', 'Pessach (Fest des ungesäuerten Brotes)', 2, juedisch.id],
  ['2020-04-15', '2020-04-15', 'Pessach (Fest des ungesäuerten Brotes)', 2, juedisch.id],
  ['2020-04-16', '2020-04-16', 'Pessach (Fest des ungesäuerten Brotes)', 2, juedisch.id],
  ['2021-03-28', '2021-03-28', 'Pessach (Fest des ungesäuerten Brotes)', 2, juedisch.id],
  ['2021-03-29', '2021-03-29', 'Pessach (Fest des ungesäuerten Brotes)', 2, juedisch.id],
  ['2021-04-03', '2021-04-03', 'Pessach (Fest des ungesäuerten Brotes)', 2, juedisch.id],
  ['2021-04-04', '2021-04-04', 'Pessach (Fest des ungesäuerten Brotes)', 2, juedisch.id],
  ['2015-05-24', '2015-05-24', 'Schawuot (Wochenfest)', 2, juedisch.id],
  ['2015-05-25', '2015-05-25', 'Schawuot (Wochenfest)', 2, juedisch.id],
  ['2016-06-12', '2016-06-12', 'Schawuot (Wochenfest)', 2, juedisch.id],
  ['2016-06-13', '2016-06-13', 'Schawuot (Wochenfest)', 2, juedisch.id],
  ['2017-05-31', '2017-05-31', 'Schawuot (Wochenfest)', 2, juedisch.id],
  ['2017-06-01', '2017-06-01', 'Schawuot (Wochenfest)', 2, juedisch.id],
  ['2018-05-20', '2018-05-20', 'Schawuot (Wochenfest)', 2, juedisch.id],
  ['2018-05-21', '2018-05-21', 'Schawuot (Wochenfest)', 2, juedisch.id],
  ['2019-06-09', '2019-06-09', 'Schawuot (Wochenfest)', 2, juedisch.id],
  ['2019-06-10', '2019-06-10', 'Schawuot (Wochenfest)', 2, juedisch.id],
  ['2020-05-29', '2020-05-29', 'Schawuot (Wochenfest)', 2, juedisch.id],
  ['2020-05-30', '2020-05-30', 'Schawuot (Wochenfest)', 2, juedisch.id],
  ['2021-05-17', '2021-05-17', 'Schawuot (Wochenfest)', 2, juedisch.id],
  ['2021-05-18', '2021-05-18', 'Schawuot (Wochenfest)', 2, juedisch.id],
  ['2015-09-14', '2015-09-14', 'Rosch Haschana (Neujahrsfest)', 2, juedisch.id],
  ['2015-09-15', '2015-09-15', 'Rosch Haschana (Neujahrsfest)', 2, juedisch.id],
  ['2016-10-03', '2016-10-03', 'Rosch Haschana (Neujahrsfest)', 2, juedisch.id],
  ['2016-10-04', '2016-10-04', 'Rosch Haschana (Neujahrsfest)', 2, juedisch.id],
  ['2017-09-21', '2017-09-21', 'Rosch Haschana (Neujahrsfest)', 2, juedisch.id],
  ['2017-09-22', '2017-09-22', 'Rosch Haschana (Neujahrsfest)', 2, juedisch.id],
  ['2018-09-10', '2018-09-10', 'Rosch Haschana (Neujahrsfest)', 2, juedisch.id],
  ['2018-09-11', '2018-09-11', 'Rosch Haschana (Neujahrsfest)', 2, juedisch.id],
  ['2019-09-30', '2019-09-30', 'Rosch Haschana (Neujahrsfest)', 2, juedisch.id],
  ['2019-10-01', '2019-10-01', 'Rosch Haschana (Neujahrsfest)', 2, juedisch.id],
  ['2020-09-19', '2020-09-19', 'Rosch Haschana (Neujahrsfest)', 2, juedisch.id],
  ['2020-09-20', '2020-09-20', 'Rosch Haschana (Neujahrsfest)', 2, juedisch.id],
  ['2021-09-07', '2021-09-07', 'Rosch Haschana (Neujahrsfest)', 2, juedisch.id],
  ['2021-09-08', '2021-09-08', 'Rosch Haschana (Neujahrsfest)', 2, juedisch.id],
  ['2015-09-23', '2015-09-23', 'Jom Kippur (Versöhnungsfest)', 2, juedisch.id],
  ['2016-10-12', '2016-10-12', 'Jom Kippur (Versöhnungsfest)', 2, juedisch.id],
  ['2017-09-30', '2017-09-30', 'Jom Kippur (Versöhnungsfest)', 2, juedisch.id],
  ['2018-09-19', '2018-09-19', 'Jom Kippur (Versöhnungsfest)', 2, juedisch.id],
  ['2019-10-09', '2019-10-09', 'Jom Kippur (Versöhnungsfest)', 2, juedisch.id],
  ['2020-09-28', '2020-09-28', 'Jom Kippur (Versöhnungsfest)', 2, juedisch.id],
  ['2021-09-16', '2021-09-16', 'Jom Kippur (Versöhnungsfest)', 2, juedisch.id],
  ['2015-09-28', '2015-09-28', 'Sukkot (Laubhüttenfest)', 2, juedisch.id],
  ['2015-09-29', '2015-09-29', 'Sukkot (Laubhüttenfest)', 2, juedisch.id],
  ['2016-10-17', '2016-10-17', 'Sukkot (Laubhüttenfest)', 2, juedisch.id],
  ['2016-10-18', '2016-10-18', 'Sukkot (Laubhüttenfest)', 2, juedisch.id],
  ['2017-10-05', '2017-10-05', 'Sukkot (Laubhüttenfest)', 2, juedisch.id],
  ['2017-10-06', '2017-10-06', 'Sukkot (Laubhüttenfest)', 2, juedisch.id],
  ['2018-09-24', '2018-09-24', 'Sukkot (Laubhüttenfest)', 2, juedisch.id],
  ['2018-09-25', '2018-09-25', 'Sukkot (Laubhüttenfest)', 2, juedisch.id],
  ['2019-10-14', '2019-10-14', 'Sukkot (Laubhüttenfest)', 2, juedisch.id],
  ['2019-10-15', '2019-10-15', 'Sukkot (Laubhüttenfest)', 2, juedisch.id],
  ['2020-10-03', '2020-10-03', 'Sukkot (Laubhüttenfest)', 2, juedisch.id],
  ['2020-10-04', '2020-10-04', 'Sukkot (Laubhüttenfest)', 2, juedisch.id],
  ['2021-09-21', '2021-09-21', 'Sukkot (Laubhüttenfest)', 2, juedisch.id],
  ['2021-09-22', '2021-09-22', 'Sukkot (Laubhüttenfest)', 2, juedisch.id],
  ['2015-10-05', '2015-10-05', 'Schemini Azeret (Schlussfest)', 2, juedisch.id],
  ['2016-10-24', '2016-10-24', 'Schemini Azeret (Schlussfest)', 2, juedisch.id],
  ['2017-10-12', '2017-10-12', 'Schemini Azeret (Schlussfest)', 2, juedisch.id],
  ['2018-10-01', '2018-10-01', 'Schemini Azeret (Schlussfest)', 2, juedisch.id],
  ['2019-10-21', '2019-10-21', 'Schemini Azeret (Schlussfest)', 2, juedisch.id],
  ['2020-10-10', '2020-10-10', 'Schemini Azeret (Schlussfest)', 2, juedisch.id],
  ['2021-09-28', '2021-09-28', 'Schemini Azeret (Schlussfest)', 2, juedisch.id],
  ['2015-10-06', '2015-10-06', 'Simchat Thora (Gesetzesfreude)', 2, juedisch.id],
  ['2016-10-25', '2016-10-25', 'Simchat Thora (Gesetzesfreude)', 2, juedisch.id],
  ['2017-10-13', '2017-10-13', 'Simchat Thora (Gesetzesfreude)', 2, juedisch.id],
  ['2018-10-02', '2018-10-02', 'Simchat Thora (Gesetzesfreude)', 2, juedisch.id],
  ['2019-10-22', '2019-10-22', 'Simchat Thora (Gesetzesfreude)', 2, juedisch.id],
  ['2020-10-11', '2020-10-11', 'Simchat Thora (Gesetzesfreude)', 2, juedisch.id],
  ['2021-09-29', '2021-09-29', 'Simchat Thora (Gesetzesfreude)', 2, juedisch.id],

  ['2015-07-17', '2015-07-17', 'Ramadanfest (Fastenbrechenfest)', 2, islamisch.id],
  ['2016-07-05', '2016-07-05', 'Ramadanfest (Fastenbrechenfest)', 2, islamisch.id],
  ['2017-06-25', '2017-06-25', 'Ramadanfest (Fastenbrechenfest)', 2, islamisch.id],
  ['2018-06-15', '2018-06-15', 'Ramadanfest (Fastenbrechenfest)', 2, islamisch.id],
  ['2019-06-05', '2019-06-05', 'Ramadanfest (Fastenbrechenfest)', 2, islamisch.id],
  ['2020-05-24', '2020-05-24', 'Ramadanfest (Fastenbrechenfest)', 2, islamisch.id],
  ['2021-05-13', '2021-05-13', 'Ramadanfest (Fastenbrechenfest)', 2, islamisch.id],
  ['2015-09-23', '2015-09-23', 'Opferfest', 2, islamisch.id],
  ['2016-09-12', '2016-09-12', 'Opferfest', 2, islamisch.id],
  ['2017-09-01', '2017-09-01', 'Opferfest', 2, islamisch.id],
  ['2018-08-21', '2018-08-21', 'Opferfest', 2, islamisch.id],
  ['2019-08-11', '2019-08-11', 'Opferfest', 2, islamisch.id],
  ['2020-07-31', '2020-07-31', 'Opferfest', 2, islamisch.id],
  ['2021-07-20', '2021-07-20', 'Opferfest', 2, islamisch.id],
].each do |new_event|
  if new_event.size == 4
    federal_state.events.where(starts_on: new_event[0], ends_on: new_event[1], summary: new_event[2], event_type_id: new_event[3]).first_or_create
  else
    federal_state.events.where(starts_on: new_event[0], ends_on: new_event[1], summary: new_event[2], event_type_id: new_event[3], religion_id: new_event[4]).first_or_create
  end
end

# Brandenburg
#
federal_state = FederalState.where(name: 'Brandenburg', slug: 'brandenburg', country_id: country.id, url: 'http://www.mbjs.brandenburg.de/cms/detail.php/90062').first_or_create

# Ferientermine für Brandenburg
#
[
  ['2014-12-22', '2015-01-02', 'Weihnachtsferien', 1],
  ['2015-02-02', '2015-02-07', 'Winterferien', 1],
  ['2015-04-01', '2015-04-11', 'Osterferien', 1],
  ['2015-05-15', '2015-05-15', 'Pfingstferien', 1],
  ['2015-07-16', '2015-08-28', 'Sommerferien', 1],

  ['2015-10-19', '2015-10-30', 'Herbstferien', 1],
  ['2015-12-23', '2016-01-02', 'Weihnachtsferien', 1],
  ['2016-02-01', '2016-02-06', 'Winterferien', 1],
  ['2016-03-23', '2016-04-02', 'Osterferien', 1],
  ['2016-05-17', '2016-05-17', 'Pfingstferien', 1],
  ['2016-07-21', '2016-09-03', 'Sommerferien', 1],
  ['2016-05-06', '2016-05-06', 'Variable Ferientage', 1],
  ['2016-03-21', '2016-03-22', 'Variable Ferientage', 1],

  ['2016-10-17', '2016-10-28', 'Herbstferien', 1],
  ['2016-12-23', '2017-01-03', 'Weihnachtsferien', 1],
  ['2017-01-30', '2017-02-04', 'Winterferien', 1],
  ['2017-04-12', '2017-04-22', 'Osterferien', 1],
  ['2017-07-20', '2017-09-01', 'Sommerferien', 1],
  ['2017-05-26', '2017-05-26', 'Variable Ferientage', 1],
  ['2017-04-10', '2017-04-11', 'Variable Ferientage', 1],

  ['2017-10-23', '2017-11-04', 'Herbstferien', 1],
  ['2017-12-21', '2018-01-02', 'Weihnachtsferien', 1],
  ['2018-02-05', '2018-02-10', 'Winterferien', 1],
  ['2018-03-26', '2018-04-06', 'Osterferien', 1],
  ['2018-07-05', '2018-08-18', 'Sommerferien', 1],
  ['2017-10-02', '2017-10-02', 'Variable Ferientage', 1],
  ['2018-04-30', '2018-04-30', 'Variable Ferientage', 1],
  ['2018-05-11', '2018-05-11', 'Variable Ferientage', 1],

  ['2018-10-22', '2018-11-02', 'Herbstferien', 1],
  ['2018-12-22', '2019-01-05', 'Weihnachtsferien', 1],
  ['2019-02-04', '2019-02-09', 'Winterferien', 1],
  ['2019-04-15', '2019-04-26', 'Osterferien', 1],
  ['2019-06-20', '2019-08-03', 'Sommerferien', 1],
  ['2018-12-21', '2018-12-21', 'Variable Ferientage', 1],
  ['2019-05-31', '2019-05-31', 'Variable Ferientage', 1],

  ['2019-10-04', '2019-10-18', 'Herbstferien', 1],
  ['2019-12-23', '2020-01-03', 'Weihnachtsferien', 1],
  ['2020-02-03', '2020-02-08', 'Winterferien', 1],
  ['2020-04-06', '2020-04-17', 'Osterferien', 1],
  ['2020-06-25', '2020-08-08', 'Sommerferien', 1],
  ['2019-11-01', '2019-11-01', 'Variable Ferientage', 1],
  ['2020-05-22', '2020-05-22', 'Variable Ferientage', 1],

  ['2020-10-12', '2020-10-24', 'Herbstferien', 1],
  ['2020-12-21', '2021-01-02', 'Weihnachtsferien', 1],
  ['2021-02-01', '2021-02-06', 'Winterferien', 1],
  ['2021-03-29', '2021-04-09', 'Osterferien', 1],
  ['2021-06-24', '2021-08-07', 'Sommerferien', 1],
  ['2021-05-14', '2021-05-14', 'Variable Ferientage', 1],

  ['2021-10-11', '2021-10-23', 'Herbstferien', 1],
  ['2021-12-23', '2021-12-31', 'Weihnachtsferien', 1],
  ['2022-01-31', '2022-02-05', 'Winterferien', 1],
  ['2022-04-11', '2022-04-23', 'Osterferien', 1],
  ['2022-07-07', '2022-08-20', 'Sommerferien', 1],
  ['2022-05-27', '2022-05-27', 'Variable Ferientage', 1],

  ['2022-10-24', '2022-11-05', 'Herbstferien', 1],
  ['2022-12-22', '2023-01-03', 'Weihnachtsferien', 1],
  ['2023-01-30', '2023-02-03', 'Winterferien', 1],
  ['2023-04-03', '2023-04-14', 'Osterferien', 1],
  ['2023-07-13', '2023-08-26', 'Sommerferien', 1],
  ['2023-05-19', '2023-05-19', 'Variable Ferientage', 1],

  ['2023-10-23', '2023-11-04', 'Herbstferien', 1],
  ['2023-12-23', '2024-01-05', 'Weihnachtsferien', 1],
  ['2024-02-05', '2024-02-09', 'Winterferien', 1],
  ['2024-03-25', '2024-04-05', 'Osterferien', 1],
  ['2024-07-18', '2024-08-31', 'Sommerferien', 1],
  ['2023-10-02', '2023-10-02', 'Variable Ferientage', 1],
  ['2024-05-10', '2024-05-10', 'Variable Ferientage', 1],

  # ['', '', 'Herbstferien', 1],
  # ['', '', 'Weihnachtsferien', 1],
  # ['', '', 'Winterferien', 1],
  # ['', '', 'Osterferien', 1],
  # ['', '', 'Sommerferien', 1],
  # ['', '', 'Variable Ferientage', 1],

].each do |new_event|
  federal_state.events.where(starts_on: new_event[0], ends_on: new_event[1], summary: new_event[2], event_type_id: new_event[3]).first_or_create
end

# Feiertage für Brandenburg
#
[
  ['2015-01-01', '2015-01-01', 'Neujahr', 2],
  ['2015-04-03', '2015-04-03', 'Karfreitag', 2],
  ['2015-04-05', '2015-04-05', 'Ostersonntag', 2],
  ['2015-04-06', '2015-04-06', 'Ostermontag', 2],
  ['2015-05-01', '2015-05-01', 'Tag der Arbeit', 2],
  ['2015-05-14', '2015-05-14', 'Christi Himmelfahrt', 2],
  ['2015-05-24', '2015-05-24', 'Pfingstsonntag', 2],
  ['2015-05-25', '2015-05-25', 'Pfingstmontag', 2],
  ['2015-10-03', '2015-10-03', 'Tag der Deutschen Einheit', 2],
  ['2015-10-31', '2015-10-31', 'Reformationstag', 2],
  ['2015-12-25', '2015-12-25', '1. Weihnachtstag', 2],
  ['2015-12-26', '2015-12-26', '2. Weihnachtstag', 2],
  ['2016-01-01', '2016-01-01', 'Neujahr', 2],
  ['2016-03-25', '2016-03-25', 'Karfreitag', 2],
  ['2016-03-27', '2016-03-27', 'Ostersonntag', 2],
  ['2016-03-28', '2016-03-28', 'Ostermontag', 2],
  ['2016-05-01', '2016-05-01', 'Tag der Arbeit', 2],
  ['2016-05-05', '2016-05-05', 'Christi Himmelfahrt', 2],
  ['2016-05-15', '2016-05-15', 'Pfingstsonntag', 2],
  ['2016-05-16', '2016-05-16', 'Pfingstmontag', 2],
  ['2016-10-03', '2016-10-03', 'Tag der Deutschen Einheit', 2],
  ['2016-10-31', '2016-10-31', 'Reformationstag', 2],
  ['2016-12-25', '2016-12-25', '1. Weihnachtstag', 2],
  ['2016-12-26', '2016-12-26', '2. Weihnachtstag', 2],
  ['2017-01-01', '2017-01-01', 'Neujahr', 2],
  ['2017-04-14', '2017-04-14', 'Karfreitag', 2],
  ['2017-04-16', '2017-04-16', 'Ostersonntag', 2],
  ['2017-04-17', '2017-04-17', 'Ostermontag', 2],
  ['2017-05-01', '2017-05-01', 'Tag der Arbeit', 2],
  ['2017-05-25', '2017-05-25', 'Christi Himmelfahrt', 2],
  ['2017-06-04', '2017-06-04', 'Pfingstsonntag', 2],
  ['2017-06-05', '2017-06-05', 'Pfingstmontag', 2],
  ['2017-10-03', '2017-10-03', 'Tag der Deutschen Einheit', 2],
  ['2017-10-31', '2017-10-31', 'Reformationstag', 2],
  ['2017-12-25', '2017-12-25', '1. Weihnachtstag', 2],
  ['2017-12-26', '2017-12-26', '2. Weihnachtstag', 2],
].each do |new_event|
  federal_state.events.where(starts_on: new_event[0], ends_on: new_event[1], summary: new_event[2], event_type_id: new_event[3]).first_or_create
end

# Bremen
#
federal_state = FederalState.where(name: 'Bremen', slug: 'bremen', country_id: country.id, url: 'https://www.bildung.bremen.de/sixcms/detail.php?gsid=bremen117.c.3404.de').first_or_create

# Ferientermine für Bremen
#
[
  ['2014-12-22', '2015-01-05', 'Weihnachtsferien', 1],
  ['2015-02-02', '2015-02-03', 'Halbjahresferien', 1],
  ['2015-03-25', '2015-04-10', 'Osterferien', 1],
  ['2015-05-26', '2015-05-26', 'Pfingstferien', 1],

  ['2015-07-23', '2015-09-02', 'Sommerferien', 1],
  ['2015-10-19', '2015-10-31', 'Herbstferien', 1],
  ['2015-12-23', '2016-01-06', 'Weihnachtsferien', 1],
  ['2016-01-28', '2016-01-29', 'Halbjahresferien', 1],
  ['2016-03-18', '2016-04-02', 'Osterferien', 1],
  ['2016-05-17', '2016-05-17', 'Pfingstferien', 1],

  ['2016-06-23', '2016-08-03', 'Sommerferien', 1],
  ['2016-10-04', '2016-10-15', 'Herbstferien', 1],
  ['2016-12-21', '2017-01-06', 'Weihnachtsferien', 1],
  ['2017-01-30', '2017-01-31', 'Halbjahresferien', 1],
  ['2017-04-10', '2017-04-22', 'Osterferien', 1],
  ['2017-06-06', '2017-06-06', 'Pfingstferien', 1],

  ['2017-06-22', '2017-08-02', 'Sommerferien', 1],
  ['2017-10-02', '2017-10-14', 'Herbstferien', 1],
  ['2017-12-23', '2018-01-06', 'Weihnachtsferien', 1],

  ['2015-05-15', '2015-05-15', 'Bewegliche Ferientage', 1],
  ['2016-05-06', '2016-05-06', 'Bewegliche Ferientage', 1],
  ['2017-05-26', '2017-05-26', 'Bewegliche Ferientage', 1],

].each do |new_event|
  federal_state.events.where(starts_on: new_event[0], ends_on: new_event[1], summary: new_event[2], event_type_id: new_event[3]).first_or_create
end

# Feiertage für Bremen
#
[
  ['2015-01-01', '2015-01-01', 'Neujahr', 2],
  ['2015-04-03', '2015-04-03', 'Karfreitag', 2],
  ['2015-04-06', '2015-04-06', 'Ostermontag', 2],
  ['2015-05-01', '2015-05-01', 'Tag der Arbeit', 2],
  ['2015-05-14', '2015-05-14', 'Christi Himmelfahrt', 2],
  ['2015-05-25', '2015-05-25', 'Pfingstmontag', 2],
  ['2015-10-03', '2015-10-03', 'Tag der Deutschen Einheit', 2],
  ['2015-12-25', '2015-12-25', '1. Weihnachtstag', 2],
  ['2015-12-26', '2015-12-26', '2. Weihnachtstag', 2],
  ['2016-01-01', '2016-01-01', 'Neujahr', 2],
  ['2016-03-25', '2016-03-25', 'Karfreitag', 2],
  ['2016-03-28', '2016-03-28', 'Ostermontag', 2],
  ['2016-05-01', '2016-05-01', 'Tag der Arbeit', 2],
  ['2016-05-05', '2016-05-05', 'Christi Himmelfahrt', 2],
  ['2016-05-16', '2016-05-16', 'Pfingstmontag', 2],
  ['2016-10-03', '2016-10-03', 'Tag der Deutschen Einheit', 2],
  ['2016-12-25', '2016-12-25', '1. Weihnachtstag', 2],
  ['2016-12-26', '2016-12-26', '2. Weihnachtstag', 2],
  ['2017-01-01', '2017-01-01', 'Neujahr', 2],
  ['2017-04-14', '2017-04-14', 'Karfreitag', 2],
  ['2017-04-17', '2017-04-17', 'Ostermontag', 2],
  ['2017-05-01', '2017-05-01', 'Tag der Arbeit', 2],
  ['2017-05-25', '2017-05-25', 'Christi Himmelfahrt', 2],
  ['2017-06-05', '2017-06-05', 'Pfingstmontag', 2],
  ['2017-10-03', '2017-10-03', 'Tag der Deutschen Einheit', 2],
  ['2017-10-31', '2017-10-31', 'Reformationstag', 2],
  ['2017-12-25', '2017-12-25', '1. Weihnachtstag', 2],
  ['2017-12-26', '2017-12-26', '2. Weihnachtstag', 2],
].each do |new_event|
  federal_state.events.where(starts_on: new_event[0], ends_on: new_event[1], summary: new_event[2], event_type_id: new_event[3]).first_or_create
end

# Hamburg
#
federal_state = FederalState.where(name: 'Hamburg', slug: 'hamburg', country_id: country.id, url: 'http://www.hamburg.de/contentblob/4408058/data/langfr-ferien-2017-2024.pdf').first_or_create

# Ferientermine für Hamburg
#
[
  ['2014-12-22', '2015-01-06', 'Weihnachtsferien', 1],
  ['2015-01-30', '2015-01-30', 'Halbjahrespause', 1],
  ['2015-03-02', '2015-03-13', 'Frühjahrsferien', 1],
  ['2015-05-11', '2015-05-15', 'Himmelfahrt/Pfingsten', 1],
  ['2015-07-16', '2015-08-26', 'Sommerferien', 1],

  ['2015-10-19', '2015-10-30', 'Herbstferien', 1],
  ['2015-12-21', '2016-01-01', 'Weihnachtsferien', 1],
  ['2016-01-29', '2016-01-29', 'Halbjahrespause', 1],
  ['2016-03-07', '2016-03-18', 'Frühjahrsferien', 1],
  ['2016-05-06', '2016-05-06', 'Brückentag', 1],
  ['2016-05-17', '2016-05-20', 'Himmelfahrt/Pfingsten', 1],
  ['2016-07-21', '2016-08-31', 'Sommerferien', 1],

  ['2016-10-17', '2016-10-28', 'Herbstferien', 1],
  ['2016-12-27', '2017-01-06', 'Weihnachtsferien', 1],
  ['2017-01-30', '2017-01-30', 'Halbjahrespause', 1],
  ['2017-03-06', '2017-03-17', 'Frühjahrsferien', 1],
  ['2017-05-22', '2017-05-26', 'Himmelfahrt/Pfingsten', 1],
  ['2017-07-20', '2017-08-30', 'Sommerferien', 1],

  ['2017-10-02', '2017-10-02', 'Brückentag', 1],
  ['2017-10-16', '2017-10-27', 'Herbstferien', 1],
  ['2017-12-22', '2018-01-05', 'Weihnachtsferien', 1],
  ['2018-02-02', '2018-02-02', 'Halbjahrespause', 1],
  ['2018-03-05', '2018-03-16', 'Frühjahrsferien', 1],
  ['2018-04-30', '2018-04-30', 'Brückentag', 1],
  ['2018-05-07', '2018-05-11', 'Himmelfahrt/Pfingsten', 1],
  ['2018-07-05', '2018-08-15', 'Sommerferien', 1],

  ['2018-10-01', '2018-10-12', 'Herbstferien', 1],
  ['2018-12-20', '2019-01-04', 'Weihnachtsferien', 1],
  ['2019-02-01', '2019-02-01', 'Halbjahrespause', 1],
  ['2019-03-04', '2019-03-15', 'Frühjahrsferien', 1],
  ['2019-04-29', '2019-05-03', 'Himmelfahrt/Pfingsten', 1],
  ['2019-05-31', '2019-05-31', 'Brückentag', 1],
  ['2019-06-27', '2019-08-07', 'Sommerferien', 1],

  ['2019-10-04', '2019-10-18', 'Herbstferien', 1],
  ['2019-12-23', '2020-01-03', 'Weihnachtsferien', 1],
  ['2020-01-31', '2020-01-31', 'Halbjahrespause', 1],
  ['2020-03-02', '2020-03-13', 'Frühjahrsferien', 1],
  ['2020-05-04', '2020-05-08', 'Himmelfahrt/Pfingsten', 1],
  ['2020-05-22', '2020-05-22', 'Brückentag', 1],
  ['2020-06-25', '2020-08-05', 'Sommerferien', 1],

  ['2020-10-05', '2020-10-16', 'Herbstferien', 1],
  ['2020-12-21', '2021-01-04', 'Weihnachtsferien', 1],
  ['2021-01-29', '2021-01-29', 'Halbjahrespause', 1],
  ['2021-03-01', '2021-03-12', 'Frühjahrsferien', 1],
  ['2021-05-10', '2021-05-14', 'Himmelfahrt/Pfingsten', 1],
  ['2021-06-24', '2021-08-04', 'Sommerferien', 1],

  ['2021-10-04', '2021-10-15', 'Herbstferien', 1],
  ['2021-12-23', '2022-01-04', 'Weihnachtsferien', 1],
  ['2022-01-28', '2022-01-28', 'Halbjahrespause', 1],
  ['2022-03-07', '2022-03-18', 'Frühjahrsferien', 1],
  ['2022-05-23', '2022-05-27', 'Himmelfahrt/Pfingsten', 1],
  ['2022-07-07', '2022-08-17', 'Sommerferien', 1],

  ['2022-10-10', '2022-10-21', 'Herbstferien', 1],
  ['2022-12-23', '2023-01-06', 'Weihnachtsferien', 1],
  ['2023-01-27', '2023-01-27', 'Halbjahrespause', 1],
  ['2023-03-06', '2023-03-17', 'Frühjahrsferien', 1],
  ['2023-05-15', '2023-05-19', 'Himmelfahrt/Pfingsten', 1],
  ['2023-07-13', '2023-08-23', 'Sommerferien', 1],


  ['2023-10-02', '2023-10-02', 'Brückentag', 1],
  ['2023-10-16', '2023-10-27', 'Herbstferien', 1],
  ['2023-12-22', '2024-01-05', 'Weihnachtsferien', 1],
  ['2024-02-02', '2024-02-02', 'Halbjahrespause', 1],
  ['2024-03-18', '2024-03-28', 'Frühjahrsferien', 1],
  ['2024-05-10', '2024-05-10', 'Brückentag', 1],
  ['2024-05-21', '2024-05-24', 'Himmelfahrt/Pfingsten', 1],
  ['2024-07-18', '2024-08-28', 'Sommerferien', 1],

].each do |new_event|
  federal_state.events.where(starts_on: new_event[0], ends_on: new_event[1], summary: new_event[2], event_type_id: new_event[3]).first_or_create
end

# Feiertage für Hamburg
#
[
  ['2015-01-01', '2015-01-01', 'Neujahr', 2],
  ['2015-04-03', '2015-04-03', 'Karfreitag', 2],
  ['2015-04-06', '2015-04-06', 'Ostermontag', 2],
  ['2015-05-01', '2015-05-01', 'Tag der Arbeit', 2],
  ['2015-05-14', '2015-05-14', 'Christi Himmelfahrt', 2],
  ['2015-05-25', '2015-05-25', 'Pfingstmontag', 2],
  ['2015-10-03', '2015-10-03', 'Tag der Deutschen Einheit', 2],
  ['2015-12-25', '2015-12-25', '1. Weihnachtstag', 2],
  ['2015-12-26', '2015-12-26', '2. Weihnachtstag', 2],
  ['2016-01-01', '2016-01-01', 'Neujahr', 2],
  ['2016-03-25', '2016-03-25', 'Karfreitag', 2],
  ['2016-03-28', '2016-03-28', 'Ostermontag', 2],
  ['2016-05-01', '2016-05-01', 'Tag der Arbeit', 2],
  ['2016-05-05', '2016-05-05', 'Christi Himmelfahrt', 2],
  ['2016-05-16', '2016-05-16', 'Pfingstmontag', 2],
  ['2016-10-03', '2016-10-03', 'Tag der Deutschen Einheit', 2],
  ['2016-12-25', '2016-12-25', '1. Weihnachtstag', 2],
  ['2016-12-26', '2016-12-26', '2. Weihnachtstag', 2],
  ['2017-01-01', '2017-01-01', 'Neujahr', 2],
  ['2017-04-14', '2017-04-14', 'Karfreitag', 2],
  ['2017-04-17', '2017-04-17', 'Ostermontag', 2],
  ['2017-05-01', '2017-05-01', 'Tag der Arbeit', 2],
  ['2017-05-25', '2017-05-25', 'Christi Himmelfahrt', 2],
  ['2017-06-05', '2017-06-05', 'Pfingstmontag', 2],
  ['2017-10-03', '2017-10-03', 'Tag der Deutschen Einheit', 2],
  ['2017-10-31', '2017-10-31', 'Reformationstag', 2],
  ['2017-12-25', '2017-12-25', '1. Weihnachtstag', 2],
  ['2017-12-26', '2017-12-26', '2. Weihnachtstag', 2],
].each do |new_event|
  federal_state.events.where(starts_on: new_event[0], ends_on: new_event[1], summary: new_event[2], event_type_id: new_event[3]).first_or_create
end

# Hessen
#
federal_state = FederalState.where(name: 'Hessen', slug: 'hessen', country_id: country.id, url: 'https://kultusministerium.hessen.de/schule/ferien-hessen/ferientermine').first_or_create

# Ferientermine für Hessen
#
[
  ['2014-12-22', '2015-01-10', 'Weihnachtsferien', 1],
  ['2015-03-30', '2015-04-11', 'Osterferien', 1],
  ['2015-07-27', '2015-09-04', 'Sommerferien', 1],

  ['2015-10-19', '2015-10-31', 'Herbstferien', 1],
  ['2015-12-23', '2016-01-09', 'Weihnachtsferien', 1],
  ['2016-03-29', '2016-04-09', 'Osterferien', 1],
  ['2016-07-18', '2016-08-26', 'Sommerferien', 1],

  ['2016-10-17', '2016-10-29', 'Herbstferien', 1],
  ['2016-12-22', '2017-01-07', 'Weihnachtsferien', 1],
  ['2017-04-03', '2017-04-15', 'Osterferien', 1],
  ['2017-07-03', '2017-08-11', 'Sommerferien', 1],

  ['2017-10-09', '2017-10-21', 'Herbstferien', 1],
  ['2017-12-24', '2018-01-13', 'Weihnachtsferien', 1],
  ['2018-03-26', '2018-04-07', 'Osterferien', 1],
  ['2018-06-25', '2018-08-03', 'Sommerferien', 1],
].each do |new_event|
  federal_state.events.where(starts_on: new_event[0], ends_on: new_event[1], summary: new_event[2], event_type_id: new_event[3]).first_or_create
end

# Feiertage für Hessen
#
[
  ['2015-01-01', '2015-01-01', 'Neujahr', 2],
  ['2015-04-03', '2015-04-03', 'Karfreitag', 2],
  ['2015-04-06', '2015-04-06', 'Ostermontag', 2],
  ['2015-05-01', '2015-05-01', 'Tag der Arbeit', 2],
  ['2015-05-14', '2015-05-14', 'Christi Himmelfahrt', 2],
  ['2015-05-25', '2015-05-25', 'Pfingstmontag', 2],
  ['2015-06-04', '2015-06-04', 'Fronleichnam', 2],
  ['2015-10-03', '2015-10-03', 'Tag der Deutschen Einheit', 2],
  ['2015-12-25', '2015-12-25', '1. Weihnachtstag', 2],
  ['2015-12-26', '2015-12-26', '2. Weihnachtstag', 2],
  ['2016-01-01', '2016-01-01', 'Neujahr', 2],
  ['2016-03-25', '2016-03-25', 'Karfreitag', 2],
  ['2016-03-28', '2016-03-28', 'Ostermontag', 2],
  ['2016-05-01', '2016-05-01', 'Tag der Arbeit', 2],
  ['2016-05-05', '2016-05-05', 'Christi Himmelfahrt', 2],
  ['2016-05-16', '2016-05-16', 'Pfingstmontag', 2],
  ['2016-05-26', '2016-05-26', 'Fronleichnam', 2],
  ['2016-10-03', '2016-10-03', 'Tag der Deutschen Einheit', 2],
  ['2016-12-25', '2016-12-25', '1. Weihnachtstag', 2],
  ['2016-12-26', '2016-12-26', '2. Weihnachtstag', 2],
  ['2017-01-01', '2017-01-01', 'Neujahr', 2],
  ['2017-04-14', '2017-04-14', 'Karfreitag', 2],
  ['2017-04-17', '2017-04-17', 'Ostermontag', 2],
  ['2017-05-01', '2017-05-01', 'Tag der Arbeit', 2],
  ['2017-05-25', '2017-05-25', 'Christi Himmelfahrt', 2],
  ['2017-06-05', '2017-06-05', 'Pfingstmontag', 2],
  ['2017-06-15', '2017-06-15', 'Fronleichnam', 2],
  ['2017-10-03', '2017-10-03', 'Tag der Deutschen Einheit', 2],
  ['2017-10-31', '2017-10-31', 'Reformationstag', 2],
  ['2017-12-25', '2017-12-25', '1. Weihnachtstag', 2],
  ['2017-12-26', '2017-12-26', '2. Weihnachtstag', 2],
].each do |new_event|
  federal_state.events.where(starts_on: new_event[0], ends_on: new_event[1], summary: new_event[2], event_type_id: new_event[3]).first_or_create
end

# Mecklenburg-Vorpommern
#
federal_state = FederalState.where(name: 'Mecklenburg-Vorpommern', slug: 'mecklenburg-vorpommern', country_id: country.id, url: 'http://www.regierung-mv.de/cms2/Regierungsportal_prod/Regierungsportal/de/bm/_Service/Ferientermine/index.jsp').first_or_create

# Ferientermine für Mecklenburg-Vorpommern
#
[
  ['2014-12-22', '2015-01-02', 'Weihnachtsferien', 1],
  ['2015-02-02', '2015-02-14', 'Winterferien', 1],
  ['2015-03-30', '2015-04-08', 'Osterferien', 1],
  ['2015-05-22', '2015-05-26', 'Pfingstferien', 1],
  ['2015-07-20', '2015-08-29', 'Sommerferien', 1],

  ['2015-10-24', '2015-10-30', 'Herbstferien', 1],
  ['2015-12-21', '2016-01-02', 'Weihnachtsferien', 1],
  ['2016-02-01', '2016-02-13', 'Winterferien', 1],
  ['2016-03-21', '2016-03-30', 'Osterferien', 1],
  ['2016-05-14', '2016-05-17', 'Pfingstferien', 1],
  ['2016-07-25', '2016-09-03', 'Sommerferien', 1],

  ['2016-10-24', '2016-10-28', 'Herbstferien', 1],
  ['2016-12-22', '2017-01-02', 'Weihnachtsferien', 1],
  ['2017-02-06', '2017-02-18', 'Winterferien', 1],
  ['2017-04-10', '2017-04-19', 'Osterferien', 1],
  ['2017-06-02', '2017-06-06', 'Pfingstferien', 1],
  ['2017-07-24', '2017-09-02', 'Sommerferien', 1],

  # TODO Ferientermine Mecklenburg-Vorpommern eintragen
].each do |new_event|
  federal_state.events.where(starts_on: new_event[0], ends_on: new_event[1], summary: new_event[2], event_type_id: new_event[3]).first_or_create
end

# Feiertage für Mecklenburg-Vorpommern
#
[
  ['2015-01-01', '2015-01-01', 'Neujahr', 2],
  ['2015-04-03', '2015-04-03', 'Karfreitag', 2],
  ['2015-04-06', '2015-04-06', 'Ostermontag', 2],
  ['2015-05-01', '2015-05-01', 'Tag der Arbeit', 2],
  ['2015-05-14', '2015-05-14', 'Christi Himmelfahrt', 2],
  ['2015-05-25', '2015-05-25', 'Pfingstmontag', 2],
  ['2015-10-03', '2015-10-03', 'Tag der Deutschen Einheit', 2],
  ['2015-10-31', '2015-10-31', 'Reformationstag', 2],
  ['2015-12-25', '2015-12-25', '1. Weihnachtstag', 2],
  ['2015-12-26', '2015-12-26', '2. Weihnachtstag', 2],
  ['2016-01-01', '2016-01-01', 'Neujahr', 2],
  ['2016-03-25', '2016-03-25', 'Karfreitag', 2],
  ['2016-03-28', '2016-03-28', 'Ostermontag', 2],
  ['2016-05-01', '2016-05-01', 'Tag der Arbeit', 2],
  ['2016-05-05', '2016-05-05', 'Christi Himmelfahrt', 2],
  ['2016-05-16', '2016-05-16', 'Pfingstmontag', 2],
  ['2016-10-03', '2016-10-03', 'Tag der Deutschen Einheit', 2],
  ['2016-10-31', '2016-10-31', 'Reformationstag', 2],
  ['2016-12-25', '2016-12-25', '1. Weihnachtstag', 2],
  ['2016-12-26', '2016-12-26', '2. Weihnachtstag', 2],
  ['2017-01-01', '2017-01-01', 'Neujahr', 2],
  ['2017-04-14', '2017-04-14', 'Karfreitag', 2],
  ['2017-04-17', '2017-04-17', 'Ostermontag', 2],
  ['2017-05-01', '2017-05-01', 'Tag der Arbeit', 2],
  ['2017-05-25', '2017-05-25', 'Christi Himmelfahrt', 2],
  ['2017-06-05', '2017-06-05', 'Pfingstmontag', 2],
  ['2017-10-03', '2017-10-03', 'Tag der Deutschen Einheit', 2],
  ['2017-10-31', '2017-10-31', 'Reformationstag', 2],
  ['2017-12-25', '2017-12-25', '1. Weihnachtstag', 2],
  ['2017-12-26', '2017-12-26', '2. Weihnachtstag', 2],
].each do |new_event|
  federal_state.events.where(starts_on: new_event[0], ends_on: new_event[1], summary: new_event[2], event_type_id: new_event[3]).first_or_create
end

# Niedersachsen
#
federal_state = FederalState.where(name: 'Niedersachsen', slug: 'niedersachsen', country_id: country.id, url: 'http://www.mk.niedersachsen.de/portal/live.php?navigation_id=24724&article_id=6491&_psmand=8').first_or_create

# Ferientermine für Niedersachsen
#
[
  ['2014-12-22', '2015-01-05', 'Weihnachtsferien', 1],
  ['2015-02-02', '2015-02-03', 'Halbjahresferien', 1],
  ['2015-03-25', '2015-04-10', 'Osterferien', 1],
  ['2015-05-15', '2015-05-15', 'Himmelfahrt', 1],
  ['2015-05-26', '2015-05-26', 'Pfingstferien', 1],
  ['2015-07-23', '2015-09-02', 'Sommerferien', 1],

  ['2015-10-19', '2015-10-31', 'Herbstferien', 1],
  ['2015-12-23', '2016-01-06', 'Weihnachtsferien', 1],
  ['2016-01-28', '2016-01-29', 'Halbjahresferien', 1],
  ['2016-03-18', '2016-04-02', 'Osterferien', 1],
  ['2016-05-06', '2016-05-06', 'Himmelfahrt', 1],
  ['2016-05-17', '2016-05-17', 'Pfingstferien', 1],
  ['2016-06-23', '2016-08-03', 'Sommerferien', 1],

  ['2016-10-04', '2016-10-15', 'Herbstferien', 1],
  ['2016-12-21', '2017-01-06', 'Weihnachtsferien', 1],
  ['2017-01-30', '2017-01-31', 'Halbjahresferien', 1],
  ['2017-04-10', '2017-04-22', 'Osterferien', 1],
  ['2017-05-26', '2017-05-26', 'Himmelfahrt', 1],
  ['2017-06-06', '2017-06-06', 'Pfingstferien', 1],
  ['2017-06-22', '2017-08-02', 'Sommerferien', 1],

  ['2017-10-02', '2017-10-13', 'Herbstferien', 1],
  ['2017-10-30', '2017-10-30', 'Herbstferien', 1],
  ['2017-12-22', '2018-01-05', 'Weihnachtsferien', 1],
  ['2018-02-01', '2018-02-02', 'Halbjahresferien', 1],
  ['2018-03-19', '2018-04-03', 'Osterferien', 1],
  ['2018-04-30', '2018-04-30', 'Ferien in Verbindung mit 1. Mai', 1],
  ['2018-05-11', '2018-05-11', 'Himmelfahrt', 1],
  ['2018-05-22', '2018-05-22', 'Pfingstferien', 1],
  ['2018-06-28', '2018-08-08', 'Sommerferien', 1],

  ['2018-10-01', '2018-10-12', 'Herbstferien', 1],
  ['2018-12-24', '2019-01-04', 'Weihnachtsferien', 1],
  ['2019-01-31', '2019-02-01', 'Halbjahresferien', 1],
  ['2019-04-08', '2019-04-23', 'Osterferien', 1],
  ['2019-05-31', '2019-05-31', 'Himmelfahrt', 1],
  ['2019-06-11', '2019-06-11', 'Pfingstferien', 1],
  ['2019-07-04', '2019-08-14', 'Sommerferien', 1],

  ['2019-10-04', '2019-10-18', 'Herbstferien', 1],
  ['2019-12-23', '2020-01-06', 'Weihnachtsferien', 1],
  ['2020-02-03', '2020-02-04', 'Halbjahresferien', 1],
  ['2020-03-30', '2020-04-14', 'Osterferien', 1],
  ['2020-05-22', '2020-05-22', 'Himmelfahrt', 1],
  ['2020-06-02', '2020-06-02', 'Pfingstferien', 1],
  ['2020-07-16', '2020-08-26', 'Sommerferien', 1],

  ['2020-10-12', '2020-10-23', 'Herbstferien', 1],
  ['2020-12-23', '2021-01-08', 'Weihnachtsferien', 1],
  ['2021-01-02', '2021-02-02', 'Halbjahresferien', 1],
  ['2021-03-29', '2021-04-09', 'Osterferien', 1],
  ['2021-05-14', '2021-05-14', 'Himmelfahrt', 1],
  ['2021-05-25', '2021-05-25', 'Pfingstferien', 1],
  ['2021-07-22', '2021-09-01', 'Sommerferien', 1],

  ['2021-10-18', '2021-10-29', 'Herbstferien', 1],
  ['2021-12-23', '2022-01-07', 'Weihnachtsferien', 1],
  ['2022-01-31', '2022-02-01', 'Halbjahresferien', 1],
  ['2022-04-04', '2022-04-19', 'Osterferien', 1],
  ['2022-05-27', '2022-05-27', 'Himmelfahrt', 1],
  ['2022-06-07', '2022-06-07', 'Pfingstferien', 1],
  ['2022-07-14', '2022-08-24', 'Sommerferien', 1],

  ['2022-10-17', '2022-10-28', 'Herbstferien', 1],
  ['2022-12-23', '2023-01-06', 'Weihnachtsferien', 1],
  ['2023-01-30', '2023-01-31', 'Halbjahresferien', 1],
  ['2023-03-27', '2023-04-11', 'Osterferien', 1],
  ['2023-05-19', '2023-05-19', 'Himmelfahrt', 1],
  ['2023-05-30', '2023-05-30', 'Pfingstferien', 1],
  ['2023-07-06', '2023-08-16', 'Sommerferien', 1],

  ['2023-10-02', '2023-10-02', 'Tag vor dem 3. Oktober', 1],
  ['2023-10-16', '2023-10-27', 'Herbstferien', 1],
  ['2023-12-27', '2024-01-05', 'Weihnachtsferien', 1],
  ['2024-02-01', '2024-02-02', 'Halbjahresferien', 1],
  ['2024-03-18', '2024-04-02', 'Osterferien', 1],
  ['2024-05-10', '2024-05-10', 'Himmelfahrt', 1],
  ['2024-05-21', '2024-05-21', 'Pfingstferien', 1],
  ['2024-06-24', '2024-08-02', 'Sommerferien', 1],

].each do |new_event|
  federal_state.events.where(starts_on: new_event[0], ends_on: new_event[1], summary: new_event[2], event_type_id: new_event[3]).first_or_create
end

# Feiertage für Niedersachsen
#
[
  ['2015-01-01', '2015-01-01', 'Neujahr', 2],
  ['2015-04-03', '2015-04-03', 'Karfreitag', 2],
  ['2015-04-06', '2015-04-06', 'Ostermontag', 2],
  ['2015-05-01', '2015-05-01', 'Tag der Arbeit', 2],
  ['2015-05-14', '2015-05-14', 'Christi Himmelfahrt', 2],
  ['2015-05-25', '2015-05-25', 'Pfingstmontag', 2],
  ['2015-10-03', '2015-10-03', 'Tag der Deutschen Einheit', 2],
  ['2015-12-25', '2015-12-25', '1. Weihnachtstag', 2],
  ['2015-12-26', '2015-12-26', '2. Weihnachtstag', 2],
  ['2016-01-01', '2016-01-01', 'Neujahr', 2],
  ['2016-03-25', '2016-03-25', 'Karfreitag', 2],
  ['2016-03-28', '2016-03-28', 'Ostermontag', 2],
  ['2016-05-01', '2016-05-01', 'Tag der Arbeit', 2],
  ['2016-05-05', '2016-05-05', 'Christi Himmelfahrt', 2],
  ['2016-05-16', '2016-05-16', 'Pfingstmontag', 2],
  ['2016-10-03', '2016-10-03', 'Tag der Deutschen Einheit', 2],
  ['2016-12-25', '2016-12-25', '1. Weihnachtstag', 2],
  ['2016-12-26', '2016-12-26', '2. Weihnachtstag', 2],
  ['2017-01-01', '2017-01-01', 'Neujahr', 2],
  ['2017-04-14', '2017-04-14', 'Karfreitag', 2],
  ['2017-04-17', '2017-04-17', 'Ostermontag', 2],
  ['2017-05-01', '2017-05-01', 'Tag der Arbeit', 2],
  ['2017-05-25', '2017-05-25', 'Christi Himmelfahrt', 2],
  ['2017-06-05', '2017-06-05', 'Pfingstmontag', 2],
  ['2017-10-03', '2017-10-03', 'Tag der Deutschen Einheit', 2],
  ['2017-10-31', '2017-10-31', 'Reformationstag', 2],
  ['2017-12-25', '2017-12-25', '1. Weihnachtstag', 2],
  ['2017-12-26', '2017-12-26', '2. Weihnachtstag', 2],
].each do |new_event|
  federal_state.events.where(starts_on: new_event[0], ends_on: new_event[1], summary: new_event[2], event_type_id: new_event[3]).first_or_create
end

# Nordrhein-Westfalen
#
federal_state = FederalState.where(name: 'Nordrhein-Westfalen', slug: 'nordrhein-westfalen', country_id: country.id, url: 'https://www.schulministerium.nrw.de/docs/bp/Schueler/Ferien-Pruefungen/Ferientermine/Ferienordnung-NRW/').first_or_create

# Ferientermine für Nordrhein-Westfalen
#
[
  ['2014-12-22', '2015-01-06', 'Weihnachtsferien', 1],
  ['2015-03-30', '2015-04-11', 'Osterferien', 1],
  ['2015-05-26', '2015-05-26', 'Pfingstferien', 1],

  ['2015-06-29', '2015-08-11', 'Sommerferien', 1],
  ['2015-10-05', '2015-10-17', 'Herbstferien', 1],
  ['2015-12-23', '2016-01-06', 'Weihnachtsferien', 1],
  ['2016-03-21', '2016-04-02', 'Osterferien', 1],
  ['2016-05-17', '2016-05-17', 'Pfingstferien', 1],

  ['2016-07-11', '2016-08-23', 'Sommerferien', 1],
  ['2016-10-10', '2016-10-21', 'Herbstferien', 1],
  ['2016-12-23', '2017-01-06', 'Weihnachtsferien', 1],
  ['2017-04-10', '2017-04-22', 'Osterferien', 1],
  ['2017-06-06', '2017-06-06', 'Pfingstferien', 1],

  ['2017-07-17', '2017-08-29', 'Sommerferien', 1],
  ['2017-10-23', '2017-11-04', 'Herbstferien', 1],
  ['2017-12-27', '2018-01-06', 'Weihnachtsferien', 1],
  ['2018-03-26', '2018-04-07', 'Osterferien', 1],
  ['2018-05-22', '2018-05-25', 'Pfingstferien', 1],

  ['2018-07-16', '2018-08-28', 'Sommerferien', 1],
  ['2018-10-15', '2018-10-27', 'Herbstferien', 1],
  ['2018-12-21', '2019-01-04', 'Weihnachtsferien', 1],
  ['2019-04-15', '2019-04-27', 'Osterferien', 1],
  ['2019-06-11', '2019-06-11', 'Pfingstferien', 1],

  ['2019-07-15', '2019-08-27', 'Sommerferien', 1],
  ['2019-10-14', '2019-10-26', 'Herbstferien', 1],
  ['2019-12-23', '2020-01-06', 'Weihnachtsferien', 1],
  ['2020-04-06', '2020-04-18', 'Osterferien', 1],
  ['2020-06-02', '2020-06-02', 'Pfingstferien', 1],

  ['2020-06-29', '2020-08-11', 'Sommerferien', 1],
  ['2020-10-12', '2020-10-24', 'Herbstferien', 1],
  ['2020-12-23', '2021-01-06', 'Weihnachtsferien', 1],
  ['2021-03-29', '2021-04-10', 'Osterferien', 1],
  ['2021-05-25', '2021-05-25', 'Pfingstferien', 1],

  ['2021-07-05', '2021-08-17', 'Sommerferien', 1],
  ['2021-10-11', '2021-10-23', 'Herbstferien', 1],
  ['2021-12-24', '2022-01-08', 'Weihnachtsferien', 1],
  ['2022-04-11', '2022-04-23', 'Osterferien', 1],

  ['2022-06-27', '2022-08-09', 'Sommerferien', 1],
  ['2022-10-04', '2022-10-15', 'Herbstferien', 1],
  ['2022-12-23', '2023-01-06', 'Weihnachtsferien', 1],
  ['2023-04-03', '2023-04-15', 'Osterferien', 1],
  ['2023-05-30', '2023-05-30', 'Pfingstferien', 1],

  ['2023-06-22', '2023-08-04', 'Sommerferien', 1],
  ['2023-10-02', '2023-10-14', 'Herbstferien', 1],
  ['2023-12-21', '2024-01-05', 'Weihnachtsferien', 1],
  ['2024-03-25', '2024-04-06', 'Osterferien', 1],
  ['2024-05-21', '2024-05-21', 'Pfingstferien', 1],
].each do |new_event|
  federal_state.events.where(starts_on: new_event[0], ends_on: new_event[1], summary: new_event[2], event_type_id: new_event[3]).first_or_create
end

# Feiertage für Nordrhein-Westfalen
#
[
  ['2015-01-01', '2015-01-01', 'Neujahr', 2],
  ['2015-04-03', '2015-04-03', 'Karfreitag', 2],
  ['2015-04-06', '2015-04-06', 'Ostermontag', 2],
  ['2015-05-01', '2015-05-01', 'Tag der Arbeit', 2],
  ['2015-05-14', '2015-05-14', 'Christi Himmelfahrt', 2],
  ['2015-05-25', '2015-05-25', 'Pfingstmontag', 2],
  ['2015-06-04', '2015-06-04', 'Fronleichnam', 2],
  ['2015-10-03', '2015-10-03', 'Tag der Deutschen Einheit', 2],
  ['2015-11-01', '2015-11-01', 'Allerheiligen', 2],
  ['2015-12-25', '2015-12-25', '1. Weihnachtstag', 2],
  ['2015-12-26', '2015-12-26', '2. Weihnachtstag', 2],
  ['2016-01-01', '2016-01-01', 'Neujahr', 2],
  ['2016-03-25', '2016-03-25', 'Karfreitag', 2],
  ['2016-03-28', '2016-03-28', 'Ostermontag', 2],
  ['2016-05-01', '2016-05-01', 'Tag der Arbeit', 2],
  ['2016-05-05', '2016-05-05', 'Christi Himmelfahrt', 2],
  ['2016-05-16', '2016-05-16', 'Pfingstmontag', 2],
  ['2016-05-26', '2016-05-26', 'Fronleichnam', 2],
  ['2016-10-03', '2016-10-03', 'Tag der Deutschen Einheit', 2],
  ['2016-11-01', '2016-11-01', 'Allerheiligen', 2],
  ['2016-12-25', '2016-12-25', '1. Weihnachtstag', 2],
  ['2016-12-26', '2016-12-26', '2. Weihnachtstag', 2],
  ['2017-01-01', '2017-01-01', 'Neujahr', 2],
  ['2017-04-14', '2017-04-14', 'Karfreitag', 2],
  ['2017-04-17', '2017-04-17', 'Ostermontag', 2],
  ['2017-05-01', '2017-05-01', 'Tag der Arbeit', 2],
  ['2017-05-25', '2017-05-25', 'Christi Himmelfahrt', 2],
  ['2017-06-05', '2017-06-05', 'Pfingstmontag', 2],
  ['2017-06-15', '2017-06-15', 'Fronleichnam', 2],
  ['2017-10-03', '2017-10-03', 'Tag der Deutschen Einheit', 2],
  ['2017-10-31', '2017-10-31', 'Reformationstag', 2],
  ['2017-11-01', '2017-11-01', 'Allerheiligen', 2],
  ['2017-12-25', '2017-12-25', '1. Weihnachtstag', 2],
  ['2017-12-26', '2017-12-26', '2. Weihnachtstag', 2],
].each do |new_event|
  federal_state.events.where(starts_on: new_event[0], ends_on: new_event[1], summary: new_event[2], event_type_id: new_event[3]).first_or_create
end

# Rheinland-Pfalz
#
federal_state = FederalState.where(name: 'Rheinland-Pfalz', slug: 'rheinland-pfalz', country_id: country.id, url: 'http://mbwwk.rlp.de/service/ferientermine-in-rlp/').first_or_create

# Ferientermine für Rheinland-Pfalz
#
[
  ['2014-12-22', '2015-01-07', 'Weihnachtsferien', 1],
  ['2015-03-26', '2015-04-10', 'Osterferien', 1],

  ['2015-07-27', '2015-09-04', 'Sommerferien', 1],
  ['2015-10-19', '2015-10-30', 'Herbstferien', 1],
  ['2015-12-23', '2016-01-08', 'Weihnachtsferien', 1],
  ['2016-03-18', '2016-04-01', 'Osterferien', 1],

  ['2016-07-18', '2016-08-26', 'Sommerferien', 1],
  ['2016-10-10', '2016-10-21', 'Herbstferien', 1],
  ['2016-12-22', '2017-01-06', 'Weihnachtsferien', 1],
  ['2017-04-10', '2017-04-21', 'Osterferien', 1],

  ['2017-07-03', '2017-08-11', 'Sommerferien', 1],
  ['2017-10-02', '2017-10-13', 'Herbstferien', 1],
  ['2017-12-22', '2018-01-09', 'Weihnachtsferien', 1],
].each do |new_event|
  federal_state.events.where(starts_on: new_event[0], ends_on: new_event[1], summary: new_event[2], event_type_id: new_event[3]).first_or_create
end

# Feiertage für Rheinland-Pfalz
#
[
  ['2015-01-01', '2015-01-01', 'Neujahr', 2],
  ['2015-04-03', '2015-04-03', 'Karfreitag', 2],
  ['2015-04-06', '2015-04-06', 'Ostermontag', 2],
  ['2015-05-01', '2015-05-01', 'Tag der Arbeit', 2],
  ['2015-05-14', '2015-05-14', 'Christi Himmelfahrt', 2],
  ['2015-05-25', '2015-05-25', 'Pfingstmontag', 2],
  ['2015-06-04', '2015-06-04', 'Fronleichnam', 2],
  ['2015-10-03', '2015-10-03', 'Tag der Deutschen Einheit', 2],
  ['2015-11-01', '2015-11-01', 'Allerheiligen', 2],
  ['2015-12-25', '2015-12-25', '1. Weihnachtstag', 2],
  ['2015-12-26', '2015-12-26', '2. Weihnachtstag', 2],
  ['2016-01-01', '2016-01-01', 'Neujahr', 2],
  ['2016-03-25', '2016-03-25', 'Karfreitag', 2],
  ['2016-03-28', '2016-03-28', 'Ostermontag', 2],
  ['2016-05-01', '2016-05-01', 'Tag der Arbeit', 2],
  ['2016-05-05', '2016-05-05', 'Christi Himmelfahrt', 2],
  ['2016-05-16', '2016-05-16', 'Pfingstmontag', 2],
  ['2016-05-26', '2016-05-26', 'Fronleichnam', 2],
  ['2016-10-03', '2016-10-03', 'Tag der Deutschen Einheit', 2],
  ['2016-11-01', '2016-11-01', 'Allerheiligen', 2],
  ['2016-12-25', '2016-12-25', '1. Weihnachtstag', 2],
  ['2016-12-26', '2016-12-26', '2. Weihnachtstag', 2],
  ['2017-01-01', '2017-01-01', 'Neujahr', 2],
  ['2017-04-14', '2017-04-14', 'Karfreitag', 2],
  ['2017-04-17', '2017-04-17', 'Ostermontag', 2],
  ['2017-05-01', '2017-05-01', 'Tag der Arbeit', 2],
  ['2017-05-25', '2017-05-25', 'Christi Himmelfahrt', 2],
  ['2017-06-05', '2017-06-05', 'Pfingstmontag', 2],
  ['2017-06-15', '2017-06-15', 'Fronleichnam', 2],
  ['2017-10-03', '2017-10-03', 'Tag der Deutschen Einheit', 2],
  ['2017-10-31', '2017-10-31', 'Reformationstag', 2],
  ['2017-11-01', '2017-11-01', 'Allerheiligen', 2],
  ['2017-12-25', '2017-12-25', '1. Weihnachtstag', 2],
  ['2017-12-26', '2017-12-26', '2. Weihnachtstag', 2],
].each do |new_event|
  federal_state.events.where(starts_on: new_event[0], ends_on: new_event[1], summary: new_event[2], event_type_id: new_event[3]).first_or_create
end

# Saarland
#
federal_state = FederalState.where(name: 'Saarland', slug: 'saarland', country_id: country.id, url: 'http://www.saarland.de/72694.htm').first_or_create

# Ferientermine für Saarland
#
[
  ['2014-12-22', '2015-01-07', 'Weihnachtsferien', 1],
  ['2015-02-16', '2015-02-21', 'Winterferien', 1],
  ['2015-03-30', '2015-04-11', 'Osterferien', 1],
  ['2015-07-27', '2015-09-05', 'Sommerferien', 1],
  ['2015-10-19', '2015-10-31', 'Herbstferien', 1],
  ['2015-12-21', '2016-01-02', 'Weihnachtsferien', 1],
  ['2016-02-08', '2016-02-13', 'Winterferien', 1],
  ['2016-03-29', '2016-04-09', 'Osterferien', 1],
  ['2016-07-18', '2016-08-27', 'Sommerferien', 1],
  ['2016-10-10', '2016-10-22', 'Herbstferien', 1],
  ['2016-12-19', '2016-12-31', 'Weihnachtsferien', 1],
  ['2017-02-27', '2017-03-04', 'Winterferien', 1],
  ['2017-04-10', '2017-04-22', 'Osterferien', 1],
  ['2017-07-03', '2017-08-14', 'Sommerferien', 1],
  ['2017-10-02', '2017-10-14', 'Herbstferien', 1],
  ['2017-12-21', '2018-01-05', 'Weihnachtsferien', 1],
].each do |new_event|
  federal_state.events.where(starts_on: new_event[0], ends_on: new_event[1], summary: new_event[2], event_type_id: new_event[3]).first_or_create
end

# Feiertage für Saarland
#
[
  ['2015-01-01', '2015-01-01', 'Neujahr', 2],
  ['2015-04-03', '2015-04-03', 'Karfreitag', 2],
  ['2015-04-06', '2015-04-06', 'Ostermontag', 2],
  ['2015-05-01', '2015-05-01', 'Tag der Arbeit', 2],
  ['2015-05-14', '2015-05-14', 'Christi Himmelfahrt', 2],
  ['2015-05-25', '2015-05-25', 'Pfingstmontag', 2],
  ['2015-06-04', '2015-06-04', 'Fronleichnam', 2],
  ['2015-08-15', '2015-08-15', 'Mariä Himmelfahrt', 2],
  ['2015-10-03', '2015-10-03', 'Tag der Deutschen Einheit', 2],
  ['2015-11-01', '2015-11-01', 'Allerheiligen', 2],
  ['2015-12-25', '2015-12-25', '1. Weihnachtstag', 2],
  ['2015-12-26', '2015-12-26', '2. Weihnachtstag', 2],
  ['2016-01-01', '2016-01-01', 'Neujahr', 2],
  ['2016-03-25', '2016-03-25', 'Karfreitag', 2],
  ['2016-03-28', '2016-03-28', 'Ostermontag', 2],
  ['2016-05-01', '2016-05-01', 'Tag der Arbeit', 2],
  ['2016-05-05', '2016-05-05', 'Christi Himmelfahrt', 2],
  ['2016-05-16', '2016-05-16', 'Pfingstmontag', 2],
  ['2016-05-26', '2016-05-26', 'Fronleichnam', 2],
  ['2016-08-15', '2016-08-15', 'Mariä Himmelfahrt', 2],
  ['2016-10-03', '2016-10-03', 'Tag der Deutschen Einheit', 2],
  ['2016-11-01', '2016-11-01', 'Allerheiligen', 2],
  ['2016-12-25', '2016-12-25', '1. Weihnachtstag', 2],
  ['2016-12-26', '2016-12-26', '2. Weihnachtstag', 2],
  ['2017-01-01', '2017-01-01', 'Neujahr', 2],
  ['2017-04-14', '2017-04-14', 'Karfreitag', 2],
  ['2017-04-17', '2017-04-17', 'Ostermontag', 2],
  ['2017-05-01', '2017-05-01', 'Tag der Arbeit', 2],
  ['2017-05-25', '2017-05-25', 'Christi Himmelfahrt', 2],
  ['2017-06-05', '2017-06-05', 'Pfingstmontag', 2],
  ['2017-06-15', '2017-06-15', 'Fronleichnam', 2],
  ['2017-08-15', '2017-08-15', 'Mariä Himmelfahrt', 2],
  ['2017-10-03', '2017-10-03', 'Tag der Deutschen Einheit', 2],
  ['2017-10-31', '2017-10-31', 'Reformationstag', 2],
  ['2017-11-01', '2017-11-01', 'Allerheiligen', 2],
  ['2017-12-25', '2017-12-25', '1. Weihnachtstag', 2],
  ['2017-12-26', '2017-12-26', '2. Weihnachtstag', 2],
].each do |new_event|
  federal_state.events.where(starts_on: new_event[0], ends_on: new_event[1], summary: new_event[2], event_type_id: new_event[3]).first_or_create
end

# Sachsen
#
federal_state = FederalState.where(name: 'Sachsen', slug: 'sachsen', country_id: country.id, url: 'http://www.schule.sachsen.de/413.htm').first_or_create

# Ferientermine für Sachsen
#
[
  ['2014-12-22', '2015-01-03', 'Weihnachtsferien', 1],
  ['2015-02-09', '2015-02-21', 'Winterferien', 1],
  ['2015-04-02', '2015-04-11', 'Osterferien', 1],
  ['2015-05-15', '2015-05-15', 'Pfingstferien', 1],
  ['2015-07-13', '2015-08-21', 'Sommerferien', 1],

  ['2015-10-12', '2015-10-24', 'Herbstferien', 1],
  ['2015-12-21', '2016-01-02', 'Weihnachtsferien', 1],
  ['2016-02-08', '2016-02-20', 'Winterferien', 1],
  ['2016-03-25', '2016-04-02', 'Osterferien', 1],
  ['2016-05-06', '2016-05-06', 'unterrichtsfreier Tag', 1],
  ['2016-06-27', '2016-08-05', 'Sommerferien', 1],

  ['2016-10-03', '2016-10-15', 'Herbstferien', 1],
  ['2016-12-23', '2017-01-02', 'Weihnachtsferien', 1],
  ['2017-02-13', '2017-02-24', 'Winterferien', 1],
  ['2017-04-13', '2017-04-22', 'Osterferien', 1],
  ['2017-05-26', '2017-05-26', 'unterrichtsfreier Tag', 1],
  ['2017-06-26', '2017-08-04', 'Sommerferien', 1],

  ['2017-10-02', '2017-10-14', 'Herbstferien', 1],
  ['2017-10-30', '2017-10-30', 'Herbstferien', 1],
  ['2017-12-23', '2018-01-02', 'Weihnachtsferien', 1],
  ['2018-02-12', '2018-02-23', 'Winterferien', 1],
  ['2018-03-29', '2018-04-06', 'Osterferien', 1],
  ['2018-05-19', '2018-05-22', 'Pfingstferien', 1],
  ['2018-07-02', '2018-08-10', 'Sommerferien', 1],
  ['2017-10-30', '2017-10-30', 'unterrichtsfreier Tag', 1],
  ['2018-05-11', '2018-05-11', 'unterrichtsfreier Tag', 1],

  ['2018-10-08', '2018-10-20', 'Herbstferien', 1],
  ['2018-12-22', '2019-01-04', 'Weihnachtsferien', 1],
  ['2019-02-18', '2019-03-02', 'Winterferien', 1],
  ['2019-04-19', '2019-04-26', 'Osterferien', 1],
  ['2019-07-08', '2019-08-16', 'Sommerferien', 1],
  ['2019-05-31', '2019-05-31', 'unterrichtsfreier Tag', 1],

  ['2019-10-14', '2019-10-25', 'Herbstferien', 1],
  ['2019-12-21', '2020-01-03', 'Weihnachtsferien', 1],
  ['2020-02-10', '2020-02-22', 'Winterferien', 1],
  ['2020-04-10', '2020-04-18', 'Osterferien', 1],
  ['2020-07-20', '2020-08-28', 'Sommerferien', 1],
  ['2020-05-22', '2020-05-22', 'unterrichtsfreier Tag', 1],

  ['2020-10-19', '2020-10-31', 'Herbstferien', 1],
  ['2020-12-23', '2021-01-02', 'Weihnachtsferien', 1],
  ['2021-02-08', '2021-02-20', 'Winterferien', 1],
  ['2021-04-02', '2021-04-10', 'Osterferien', 1],
  ['2021-07-26', '2021-09-03', 'Sommerferien', 1],
  ['2021-05-14', '2021-05-14', 'unterrichtsfreier Tag', 1],

  ['2021-10-18', '2021-10-30', 'Herbstferien', 1],
  ['2021-12-23', '2022-01-01', 'Weihnachtsferien', 1],
  ['2022-02-12', '2022-02-26', 'Winterferien', 1],
  ['2022-04-15', '2022-04-23', 'Osterferien', 1],
  ['2022-07-18', '2022-08-26', 'Sommerferien', 1],
  ['2022-05-17', '2022-05-17', 'unterrichtsfreier Tag', 1],

  ['2022-10-17', '2022-10-29', 'Herbstferien', 1],
  ['2022-12-22', '2023-01-02', 'Weihnachtsferien', 1],
  ['2023-02-13', '2023-02-24', 'Winterferien', 1],
  ['2023-04-07', '2023-04-15', 'Osterferien', 1],
  ['2023-07-10', '2023-08-18', 'Sommerferien', 1],
  ['2023-05-19', '2023-05-19', 'unterrichtsfreier Tag', 1],

  ['2023-10-02', '2023-10-14', 'Herbstferien', 1],
  ['2023-12-23', '2024-01-02', 'Weihnachtsferien', 1],
  ['2024-02-12', '2024-02-23', 'Winterferien', 1],
  ['2024-03-28', '2024-04-05', 'Osterferien', 1],
  ['2024-05-18', '2024-05-21', 'Pfingstferien', 1],
  ['2024-06-20', '2024-07-31', 'Sommerferien', 1],
  ['2023-10-30', '2023-10-30', 'unterrichtsfreier Tag', 1],
  ['2024-05-10', '2024-05-10', 'unterrichtsfreier Tag', 1],
].each do |new_event|
  federal_state.events.where(starts_on: new_event[0], ends_on: new_event[1], summary: new_event[2], event_type_id: new_event[3]).first_or_create
end

# Feiertage für Sachsen
#
[
  ['2015-01-01', '2015-01-01', 'Neujahr', 2],
  ['2015-04-03', '2015-04-03', 'Karfreitag', 2],
  ['2015-04-06', '2015-04-06', 'Ostermontag', 2],
  ['2015-05-01', '2015-05-01', 'Tag der Arbeit', 2],
  ['2015-05-14', '2015-05-14', 'Christi Himmelfahrt', 2],
  ['2015-05-25', '2015-05-25', 'Pfingstmontag', 2],
  ['2015-10-03', '2015-10-03', 'Tag der Deutschen Einheit', 2],
  ['2015-10-31', '2015-10-31', 'Reformationstag', 2],
  ['2015-11-18', '2015-11-18', 'Buß- und Bettag', 2],
  ['2015-12-25', '2015-12-25', '1. Weihnachtstag', 2],
  ['2015-12-26', '2015-12-26', '2. Weihnachtstag', 2],
  ['2016-01-01', '2016-01-01', 'Neujahr', 2],
  ['2016-03-25', '2016-03-25', 'Karfreitag', 2],
  ['2016-03-28', '2016-03-28', 'Ostermontag', 2],
  ['2016-05-01', '2016-05-01', 'Tag der Arbeit', 2],
  ['2016-05-05', '2016-05-05', 'Christi Himmelfahrt', 2],
  ['2016-05-16', '2016-05-16', 'Pfingstmontag', 2],
  ['2016-10-03', '2016-10-03', 'Tag der Deutschen Einheit', 2],
  ['2016-10-31', '2016-10-31', 'Reformationstag', 2],
  ['2016-11-16', '2016-11-16', 'Buß- und Bettag', 2],
  ['2016-12-25', '2016-12-25', '1. Weihnachtstag', 2],
  ['2016-12-26', '2016-12-26', '2. Weihnachtstag', 2],
  ['2017-01-01', '2017-01-01', 'Neujahr', 2],
  ['2017-04-14', '2017-04-14', 'Karfreitag', 2],
  ['2017-04-17', '2017-04-17', 'Ostermontag', 2],
  ['2017-05-01', '2017-05-01', 'Tag der Arbeit', 2],
  ['2017-05-25', '2017-05-25', 'Christi Himmelfahrt', 2],
  ['2017-06-05', '2017-06-05', 'Pfingstmontag', 2],
  ['2017-10-03', '2017-10-03', 'Tag der Deutschen Einheit', 2],
  ['2017-10-31', '2017-10-31', 'Reformationstag', 2],
  ['2017-11-22', '2017-11-22', 'Buß- und Bettag', 2],
  ['2017-12-25', '2017-12-25', '1. Weihnachtstag', 2],
  ['2017-12-26', '2017-12-26', '2. Weihnachtstag', 2],
].each do |new_event|
  federal_state.events.where(starts_on: new_event[0], ends_on: new_event[1], summary: new_event[2], event_type_id: new_event[3]).first_or_create
end

# Sachsen-Anhalt
#
federal_state = FederalState.where(name: 'Sachsen-Anhalt', slug: 'sachsen-anhalt', country_id: country.id, url: 'http://www.mk.bildung-lsa.de/bildung/er-ferien.pdf').first_or_create

# Ferientermine für Sachsen-Anhalt
#
[
  ['2014-12-22', '2015-01-05', 'Weihnachtsferien', 1],
  ['2015-02-02', '2015-02-14', 'Winterferien', 1],
  ['2015-04-02', '2015-04-02', 'Osterferien', 1],
  ['2015-05-15', '2015-05-23', 'Pfingstferien', 1],
  ['2015-07-13', '2015-08-26', 'Sommerferien', 1],

  ['2015-10-17', '2015-10-24', 'Herbstferien', 1],
  ['2015-12-21', '2016-01-05', 'Weihnachtsferien', 1],
  ['2016-02-01', '2016-02-10', 'Winterferien', 1],
  ['2016-03-24', '2016-03-24', 'Osterferien', 1],
  ['2016-05-06', '2016-05-14', 'Pfingstferien', 1],
  ['2016-06-27', '2016-08-10', 'Sommerferien', 1],

  ['2016-10-04', '2016-10-15', 'Herbstferien', 1],
  ['2016-12-19', '2017-01-02', 'Weihnachtsferien', 1],
  ['2017-02-04', '2017-02-11', 'Winterferien', 1],
  ['2017-04-10', '2017-04-13', 'Osterferien', 1],
  ['2017-05-26', '2017-05-26', 'Pfingstferien', 1],
  ['2017-06-26', '2017-08-09', 'Sommerferien', 1],

  ['2017-10-02', '2017-10-13', 'Herbstferien', 1],
  ['2017-10-30', '2017-10-30', 'Ferientag', 1],
  ['2017-12-21', '2018-01-03', 'Weihnachtsferien', 1],
  ['2018-02-05', '2018-02-09', 'Winterferien', 1],
  ['2018-03-26', '2018-03-31', 'Osterferien', 1],
  ['2018-04-30', '2018-04-30', 'Ferientag', 1],
  ['2018-05-11', '2018-05-19', 'Pfingstferien', 1],
  ['2018-06-28', '2018-08-08', 'Sommerferien', 1],

  ['2018-10-01', '2018-10-12', 'Herbstferien', 1],
  ['2018-12-19', '2019-01-04', 'Weihnachtsferien', 1],
  ['2019-02-11', '2019-02-15', 'Winterferien', 1],
  ['2019-04-18', '2019-04-30', 'Osterferien', 1],
  ['2019-05-31', '2019-06-01', 'Pfingstferien', 1],
  ['2019-07-04', '2019-08-14', 'Sommerferien', 1],


  ['2019-10-04', '2019-10-11', 'Herbstferien', 1],
  ['2019-11-01', '2019-11-01', 'Ferientag', 1],
  ['2019-12-23', '2020-01-04', 'Weihnachtsferien', 1],
  ['2020-02-10', '2020-02-14', 'Winterferien', 1],
  ['2020-04-06', '2020-04-11', 'Osterferien', 1],
  ['2020-05-18', '2020-05-30', 'Pfingstferien', 1],
  ['2020-07-16', '2020-08-26', 'Sommerferien', 1],

].each do |new_event|
  federal_state.events.where(starts_on: new_event[0], ends_on: new_event[1], summary: new_event[2], event_type_id: new_event[3]).first_or_create
end

# Feiertage für Sachsen-Anhalt
#
[
  ['2015-01-01', '2015-01-01', 'Neujahr', 2],
  ['2015-01-06', '2015-01-06', 'Heilige Drei Könige', 2],
  ['2015-04-03', '2015-04-03', 'Karfreitag', 2],
  ['2015-04-06', '2015-04-06', 'Ostermontag', 2],
  ['2015-05-01', '2015-05-01', 'Tag der Arbeit', 2],
  ['2015-05-14', '2015-05-14', 'Christi Himmelfahrt', 2],
  ['2015-05-25', '2015-05-25', 'Pfingstmontag', 2],
  ['2015-10-03', '2015-10-03', 'Tag der Deutschen Einheit', 2],
  ['2015-10-31', '2015-10-31', 'Reformationstag', 2],
  ['2015-12-25', '2015-12-25', '1. Weihnachtstag', 2],
  ['2015-12-26', '2015-12-26', '2. Weihnachtstag', 2],
  ['2016-01-01', '2016-01-01', 'Neujahr', 2],
  ['2016-01-06', '2016-01-06', 'Heilige Drei Könige', 2],
  ['2016-03-25', '2016-03-25', 'Karfreitag', 2],
  ['2016-03-28', '2016-03-28', 'Ostermontag', 2],
  ['2016-05-01', '2016-05-01', 'Tag der Arbeit', 2],
  ['2016-05-05', '2016-05-05', 'Christi Himmelfahrt', 2],
  ['2016-05-16', '2016-05-16', 'Pfingstmontag', 2],
  ['2016-10-03', '2016-10-03', 'Tag der Deutschen Einheit', 2],
  ['2016-10-31', '2016-10-31', 'Reformationstag', 2],
  ['2016-12-25', '2016-12-25', '1. Weihnachtstag', 2],
  ['2016-12-26', '2016-12-26', '2. Weihnachtstag', 2],
  ['2017-01-01', '2017-01-01', 'Neujahr', 2],
  ['2017-01-06', '2017-01-06', 'Heilige Drei Könige', 2],
  ['2017-04-14', '2017-04-14', 'Karfreitag', 2],
  ['2017-04-17', '2017-04-17', 'Ostermontag', 2],
  ['2017-05-01', '2017-05-01', 'Tag der Arbeit', 2],
  ['2017-05-25', '2017-05-25', 'Christi Himmelfahrt', 2],
  ['2017-06-05', '2017-06-05', 'Pfingstmontag', 2],
  ['2017-10-03', '2017-10-03', 'Tag der Deutschen Einheit', 2],
  ['2017-10-31', '2017-10-31', 'Reformationstag', 2],
  ['2017-12-25', '2017-12-25', '1. Weihnachtstag', 2],
  ['2017-12-26', '2017-12-26', '2. Weihnachtstag', 2],
].each do |new_event|
  federal_state.events.where(starts_on: new_event[0], ends_on: new_event[1], summary: new_event[2], event_type_id: new_event[3]).first_or_create
end

# Schleswig-Holstein
#
federal_state = FederalState.where(name: 'Schleswig-Holstein', slug: 'schleswig-holstein', country_id: country.id, url: 'http://www.schleswig-holstein.de/DE/Themen/F/Ferien.html').first_or_create

# Ferientermine für Schleswig-Holstein
#
[
  ['2014-12-22', '2015-01-06', 'Weihnachtsferien', 1],
  ['2015-04-01', '2015-04-17', 'Osterferien', 1],
  ['2015-05-15', '2015-05-15', 'Himmelfahrt', 1],
  ['2015-07-20', '2015-08-29', 'Sommerferien', 1],

  ['2015-10-19', '2015-10-31', 'Herbstferien', 1],
  ['2015-12-21', '2016-01-06', 'Weihnachtsferien', 1],
  ['2016-03-24', '2016-04-09', 'Osterferien', 1],
  ['2016-05-06', '2016-05-06', 'Himmelfahrt', 1],

  ['2016-07-25', '2016-09-03', 'Sommerferien', 1],
  ['2016-10-17', '2016-10-29', 'Herbstferien', 1],
  ['2016-12-23', '2017-01-06', 'Weihnachtsferien', 1],
  ['2017-04-07', '2017-04-21', 'Osterferien', 1],
  ['2017-05-26', '2017-05-26', 'Himmelfahrt', 1],

  ['2017-07-24', '2017-09-02', 'Sommerferien', 1],
  ['2017-10-16', '2017-10-27', 'Herbstferien', 1],
  ['2017-12-21', '2018-01-06', 'Weihnachtsferien', 1],
  ['2018-03-29', '2018-04-13', 'Osterferien', 1],
  ['2018-05-11', '2018-05-11', 'Himmelfahrt', 1],

  ['2018-07-09', '2018-08-18', 'Sommerferien', 1],
  ['2018-10-01', '2018-10-19', 'Herbstferien', 1],
  ['2018-12-21', '2019-01-04', 'Weihnachtsferien', 1],
  ['2019-04-04', '2019-04-18', 'Osterferien', 1],
  ['2019-05-31', '2019-05-31', 'Himmelfahrt', 1],

  ['2019-07-01', '2019-08-10', 'Sommerferien', 1],
  ['2019-10-04', '2019-10-18', 'Herbstferien', 1],
  ['2019-12-23', '2020-01-06', 'Weihnachtsferien', 1],
  ['2020-03-30', '2020-04-17', 'Osterferien', 1],
  ['2020-05-22', '2020-05-22', 'Himmelfahrt', 1],

  ['2020-06-29', '2020-08-08', 'Sommerferien', 1],
  ['2020-10-05', '2020-10-17', 'Herbstferien', 1],
  ['2020-12-21', '2021-01-06', 'Weihnachtsferien', 1],
  ['2021-04-01', '2021-04-16', 'Osterferien', 1],
  ['2021-05-14', '2021-05-15', 'Himmelfahrt', 1],

  ['2021-06-21', '2021-07-31', 'Sommerferien', 1],
  ['2021-10-04', '2021-10-16', 'Herbstferien', 1],
  ['2021-12-23', '2022-01-08', 'Weihnachtsferien', 1],
  ['2022-04-04', '2022-04-16', 'Osterferien', 1],
  ['2022-05-27', '2022-05-28', 'Himmelfahrt', 1],

  ['2022-07-04', '2022-08-13', 'Sommerferien', 1],
  ['2022-10-10', '2022-10-21', 'Herbstferien', 1],
  ['2022-12-23', '2023-01-07', 'Weihnachtsferien', 1],
  ['2023-04-06', '2023-04-22', 'Osterferien', 1],
  ['2023-05-19', '2023-05-19', 'Himmelfahrt', 1],

  ['2023-07-17', '2023-08-26', 'Sommerferien', 1],
  ['2023-10-16', '2023-10-27', 'Herbstferien', 1],
  ['2023-12-27', '2024-01-06', 'Weihnachtsferien', 1],
  ['2024-04-02', '2024-05-11', 'Osterferien', 1],
  ['2024-05-10', '2024-05-10', 'Himmelfahrt', 1],

].each do |new_event|
  federal_state.events.where(starts_on: new_event[0], ends_on: new_event[1], summary: new_event[2], event_type_id: new_event[3]).first_or_create
end

# Feiertage für Schleswig-Holstein
#
[
  ['2015-01-01', '2015-01-01', 'Neujahr', 2],
  ['2015-04-03', '2015-04-03', 'Karfreitag', 2],
  ['2015-04-06', '2015-04-06', 'Ostermontag', 2],
  ['2015-05-01', '2015-05-01', 'Tag der Arbeit', 2],
  ['2015-05-14', '2015-05-14', 'Christi Himmelfahrt', 2],
  ['2015-05-25', '2015-05-25', 'Pfingstmontag', 2],
  ['2015-10-03', '2015-10-03', 'Tag der Deutschen Einheit', 2],
  ['2015-12-25', '2015-12-25', '1. Weihnachtstag', 2],
  ['2015-12-26', '2015-12-26', '2. Weihnachtstag', 2],
  ['2016-01-01', '2016-01-01', 'Neujahr', 2],
  ['2016-03-25', '2016-03-25', 'Karfreitag', 2],
  ['2016-03-28', '2016-03-28', 'Ostermontag', 2],
  ['2016-05-01', '2016-05-01', 'Tag der Arbeit', 2],
  ['2016-05-05', '2016-05-05', 'Christi Himmelfahrt', 2],
  ['2016-05-16', '2016-05-16', 'Pfingstmontag', 2],
  ['2016-10-03', '2016-10-03', 'Tag der Deutschen Einheit', 2],
  ['2016-12-25', '2016-12-25', '1. Weihnachtstag', 2],
  ['2016-12-26', '2016-12-26', '2. Weihnachtstag', 2],
  ['2017-01-01', '2017-01-01', 'Neujahr', 2],
  ['2017-04-14', '2017-04-14', 'Karfreitag', 2],
  ['2017-04-17', '2017-04-17', 'Ostermontag', 2],
  ['2017-05-01', '2017-05-01', 'Tag der Arbeit', 2],
  ['2017-05-25', '2017-05-25', 'Christi Himmelfahrt', 2],
  ['2017-06-05', '2017-06-05', 'Pfingstmontag', 2],
  ['2017-10-03', '2017-10-03', 'Tag der Deutschen Einheit', 2],
  ['2017-10-31', '2017-10-31', 'Reformationstag', 2],
  ['2017-12-25', '2017-12-25', '1. Weihnachtstag', 2],
  ['2017-12-26', '2017-12-26', '2. Weihnachtstag', 2],
].each do |new_event|
  federal_state.events.where(starts_on: new_event[0], ends_on: new_event[1], summary: new_event[2], event_type_id: new_event[3]).first_or_create
end

# Thüringen
#
federal_state = FederalState.where(name: 'Thüringen', slug: 'thueringen', country_id: country.id, url: 'http://www.thueringen.de/th2/tmbjs/bildung/schulwesen/ferien/').first_or_create

# Ferientermine für Thüringen
#
[
  ['2014-12-22', '2015-01-03', 'Weihnachtsferien', 1],
  ['2015-02-02', '2015-02-07', 'Winterferien', 1],
  ['2015-03-30', '2015-04-11', 'Osterferien', 1],
  ['2015-05-15', '2015-05-15', 'schulfreier Tag', 1],
  ['2015-07-13', '2015-08-21', 'Sommerferien', 1],

  ['2015-10-05', '2015-10-17', 'Herbstferien', 1],
  ['2015-12-23', '2016-01-02', 'Weihnachtsferien', 1],
  ['2016-02-01', '2016-02-06', 'Winterferien', 1],
  ['2016-03-24', '2016-04-02', 'Osterferien', 1],
  ['2016-05-06', '2016-05-06', 'schulfreier Tag', 1],
  ['2016-06-27', '2016-08-10', 'Sommerferien', 1],

  ['2016-10-10', '2016-10-22', 'Herbstferien', 1],
  ['2016-12-23', '2016-12-31', 'Weihnachtsferien', 1],
  ['2017-02-06', '2017-02-11', 'Winterferien', 1],
  ['2017-04-10', '2017-04-21', 'Osterferien', 1],
  ['2017-05-26', '2017-05-26', 'schulfreier Tag', 1],
  ['2017-06-26', '2017-08-09', 'Sommerferien', 1],

  ['2017-10-02', '2017-10-14', 'Herbstferien', 1],
  ['2017-12-22', '2018-01-05', 'Weihnachtsferien', 1],
  ['2018-02-05', '2018-02-09', 'Winterferien', 1],
  ['2018-03-26', '2018-04-07', 'Osterferien', 1],
  ['2018-05-11', '2018-05-11', 'schulfreier Tag', 1],
  ['2018-07-02', '2018-08-11', 'Sommerferien', 1],

  ['2018-10-01', '2018-10-13', 'Herbstferien', 1],
  ['2018-12-21', '2019-01-04', 'Weihnachtsferien', 1],
  ['2019-02-11', '2019-02-15', 'Winterferien', 1],
  ['2019-04-15', '2019-04-27', 'Osterferien', 1],
  ['2019-05-31', '2019-05-31', 'schulfreier Tag', 1],
  ['2019-07-08', '2019-08-17', 'Sommerferien', 1],

  ['2019-10-07', '2019-10-19', 'Herbstferien', 1],
  ['2019-12-21', '2020-01-03', 'Weihnachtsferien', 1],
  ['2020-02-10', '2020-02-14', 'Winterferien', 1],
  ['2020-04-06', '2020-04-18', 'Osterferien', 1],
  ['2020-05-22', '2020-05-22', 'schulfreier Tag', 1],
  ['2020-07-20', '2020-08-29', 'Sommerferien', 1],

  ['2020-10-17', '2020-10-30', 'Herbstferien', 1],
  ['2020-12-23', '2021-01-02', 'Weihnachtsferien', 1],
  ['2021-02-08', '2021-02-13', 'Winterferien', 1],
  ['2021-03-29', '2021-04-10', 'Osterferien', 1],
  ['2021-05-14', '2021-05-14', 'schulfreier Tag', 1],
  ['2021-07-26', '2021-09-04', 'Sommerferien', 1],

  ['2021-10-25', '2021-11-06', 'Herbstferien', 1],
  ['2021-12-23', '2021-12-31', 'Weihnachtsferien', 1],
  ['2022-02-12', '2022-02-19', 'Winterferien', 1],
  ['2022-01-11', '2022-04-23', 'Osterferien', 1],
  ['2022-05-27', '2022-05-27', 'schulfreier Tag', 1],
  ['2022-07-18', '2022-08-27', 'Sommerferien', 1],

  ['2022-10-17', '2022-10-29', 'Herbstferien', 1],
  ['2022-12-22', '2023-01-03', 'Weihnachtsferien', 1],
  ['2023-02-13', '2023-02-17', 'Winterferien', 1],
  ['2023-04-03', '2023-04-15', 'Osterferien', 1],
  ['2023-05-19', '2023-05-19', 'schulfreier Tag', 1],
  ['2023-07-10', '2023-08-19', 'Sommerferien', 1],

  ['2023-10-02', '2023-10-14', 'Herbstferien', 1],
  ['2023-12-22', '2024-01-05', 'Weihnachtsferien', 1],
  ['2024-02-12', '2024-02-16', 'Winterferien', 1],
  ['2024-03-25', '2024-04-06', 'Osterferien', 1],
  ['2024-05-10', '2024-05-10', 'schulfreier Tag', 1],
  ['2024-06-20', '2024-07-31', 'Sommerferien', 1],

].each do |new_event|
  federal_state.events.where(starts_on: new_event[0], ends_on: new_event[1], summary: new_event[2], event_type_id: new_event[3]).first_or_create
end

# Feiertage für Thüringen
#
[
  ['2015-01-01', '2015-01-01', 'Neujahr', 2],
  ['2015-04-03', '2015-04-03', 'Karfreitag', 2],
  ['2015-04-06', '2015-04-06', 'Ostermontag', 2],
  ['2015-05-01', '2015-05-01', 'Tag der Arbeit', 2],
  ['2015-05-14', '2015-05-14', 'Christi Himmelfahrt', 2],
  ['2015-05-25', '2015-05-25', 'Pfingstmontag', 2],
  ['2015-10-03', '2015-10-03', 'Tag der Deutschen Einheit', 2],
  ['2015-10-31', '2015-10-31', 'Reformationstag', 2],
  ['2015-12-25', '2015-12-25', '1. Weihnachtstag', 2],
  ['2015-12-26', '2015-12-26', '2. Weihnachtstag', 2],
  ['2016-01-01', '2016-01-01', 'Neujahr', 2],
  ['2016-03-25', '2016-03-25', 'Karfreitag', 2],
  ['2016-03-28', '2016-03-28', 'Ostermontag', 2],
  ['2016-05-01', '2016-05-01', 'Tag der Arbeit', 2],
  ['2016-05-05', '2016-05-05', 'Christi Himmelfahrt', 2],
  ['2016-05-16', '2016-05-16', 'Pfingstmontag', 2],
  ['2016-10-03', '2016-10-03', 'Tag der Deutschen Einheit', 2],
  ['2016-10-31', '2016-10-31', 'Reformationstag', 2],
  ['2016-12-25', '2016-12-25', '1. Weihnachtstag', 2],
  ['2016-12-26', '2016-12-26', '2. Weihnachtstag', 2],
  ['2017-01-01', '2017-01-01', 'Neujahr', 2],
  ['2017-04-14', '2017-04-14', 'Karfreitag', 2],
  ['2017-04-17', '2017-04-17', 'Ostermontag', 2],
  ['2017-05-01', '2017-05-01', 'Tag der Arbeit', 2],
  ['2017-05-25', '2017-05-25', 'Christi Himmelfahrt', 2],
  ['2017-06-05', '2017-06-05', 'Pfingstmontag', 2],
  ['2017-10-03', '2017-10-03', 'Tag der Deutschen Einheit', 2],
  ['2017-10-31', '2017-10-31', 'Reformationstag', 2],
  ['2017-12-25', '2017-12-25', '1. Weihnachtstag', 2],
  ['2017-12-26', '2017-12-26', '2. Weihnachtstag', 2],
].each do |new_event|
  federal_state.events.where(starts_on: new_event[0], ends_on: new_event[1], summary: new_event[2], event_type_id: new_event[3]).first_or_create
end
