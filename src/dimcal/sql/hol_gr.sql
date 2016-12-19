-- Greece

BEGIN;

UPDATE dim_calendar
SET hol_gr = FALSE
;


-- 1 January	New Year's Day	Protochroniá	Πρωτοχρονιά	
UPDATE dim_calendar
SET hol_gr = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 1
AND   EXTRACT( MONTH FROM calendar_date) = 1
;


-- 6 January	Epiphany or Theophany	Theophánia	Θεοφάνεια		[1]
UPDATE dim_calendar
SET hol_gr = TRUE
WHERE calc_western_epiphany = TRUE
;


-- moveable Easter – 48 days. Clean Monday or Shrove Monday	Kathará Deftéra	Καθαρά Δευτέρα	The first day of Lent
-- wikipedia says 14March2016 which doesn't match the usual formula.
WITH cte AS (
    SELECT ( calendar_date  - INTERVAL '48 DAYS'   ) AS eastern_easter_sun_minus_48
    FROM dim_calendar
    WHERE calc_eastern_easter_sun = TRUE
)
UPDATE dim_calendar
SET hol_gr = TRUE
FROM cte
WHERE dim_calendar.calendar_date = cte.eastern_easter_sun_minus_48
AND EXTRACT(YEAR FROM dim_calendar.calendar_date) <> '2016'
; 
UPDATE dim_calendar
SET hol_gr = TRUE
WHERE calendar_date = '2016-03-14'
;


-- (lit. 25 March)	Εικοστή Πέμπτη Μαρτίου	Anniversary of the declaration of the start of Greek War of Independence from the Ottoman Empire
UPDATE dim_calendar
SET hol_gr = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 25
AND   EXTRACT( MONTH FROM calendar_date) = 3
;


-- moveable Easter – 2 days Next: 29 April 2016	Good Friday	Megáli Paraskeví	Μεγάλη Παρασκευή		[1]
WITH cte AS (
    SELECT ( calendar_date  - INTERVAL '2 DAYS'   ) AS eastern_easter_sun_minus_2
    FROM dim_calendar
    WHERE calc_eastern_easter_sun = TRUE
)
UPDATE dim_calendar
SET hol_gr = TRUE
FROM cte
WHERE dim_calendar.calendar_date = cte.eastern_easter_sun_minus_2
;


-- moveable	Easter	Kiriakí tou Páscha	Κυριακή του Πάσχα	Next: 1 May 2016	[3]
-- Note that Easter Sunday and Pentecost, are not official holidays as they always occur on a Sunday


-- moveable Easter + 1 day Easter Monday	Deftéra tou Páscha	Δευτέρα του Πάσχα		[2]
WITH cte AS (
    SELECT ( calendar_date  + INTERVAL '1 DAY'   ) AS eastern_easter_sun_plus_1
    FROM dim_calendar
    WHERE calc_eastern_easter_sun = TRUE
)
UPDATE dim_calendar
SET hol_gr = TRUE
FROM cte
WHERE dim_calendar.calendar_date = cte.eastern_easter_sun_plus_1
;


-- 1 May	Labour Day	Ergatikí Protomagiá
UPDATE dim_calendar
SET hol_gr = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 1
AND   EXTRACT( MONTH FROM calendar_date) = 5
;


-- moveable Easter + 49 days	Pentecost or Whit Sunday	Pentikostí
-- Note that Easter Sunday and Pentecost, are not official holidays as they always occur on a Sunday 


-- moveable Easter + 50 days Pentecost Monday or Whit Monday	Deftéra Pentikostís
WITH cte AS (
    SELECT ( calendar_date  + INTERVAL '50 DAYS'   ) AS eastern_easter_sun_plus_50
    FROM dim_calendar
    WHERE calc_eastern_easter_sun = TRUE
)
UPDATE dim_calendar
SET hol_gr = TRUE
FROM cte
WHERE dim_calendar.calendar_date = cte.eastern_easter_sun_plus_50
;


-- 15 August	Assumption or Dormition of the Holy Virgin	Kímisi tis Theotókou	Κοίμηση της Θεοτόκου	
UPDATE dim_calendar
SET hol_gr = TRUE
WHERE calc_western_assumption = TRUE
;


-- 28 October	Ochi Day	'To Ochi' or 'Imera tou Ochi'
UPDATE dim_calendar
SET hol_gr = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 28
AND   EXTRACT( MONTH FROM calendar_date) = 10
;


-- 25 December	Christmas	Christoúyenna	Χριστούγεννα		[2]
UPDATE dim_calendar
SET hol_gr = TRUE
WHERE calc_western_christmas = TRUE
;


-- 26 December	Glorifying Mother of God	Sínaxis Yperagías Theotókou Marías	Σύναξις Υπεραγίας Θεοτόκου Μαρίας	
UPDATE dim_calendar
SET hol_gr = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 26
AND   EXTRACT( MONTH FROM calendar_date) = 12
;



COMMIT;
