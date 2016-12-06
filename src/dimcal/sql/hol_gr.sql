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
UPDATE dim_calendar
SET hol_gr = TRUE
FROM cte
WHERE calc_western_clean_mon = TRUE
; 


-- (lit. 25 March)	Εικοστή Πέμπτη Μαρτίου	Anniversary of the declaration of the start of Greek War of Independence from the Ottoman Empire
UPDATE dim_calendar
SET hol_gr = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 25
AND   EXTRACT( MONTH FROM calendar_date) = 3
;


-- moveable Easter – 2 days Next: 29 April 2016	Good Friday	Megáli Paraskeví	Μεγάλη Παρασκευή		[1]
UPDATE dim_calendar
SET hol_gr = TRUE
WHERE calc_western_good_fri = TRUE
;


-- moveable	Easter	Kiriakí tou Páscha	Κυριακή του Πάσχα	Next: 1 May 2016	[3]
-- Note that Easter Sunday and Pentecost, are not official holidays as they always occur on a Sunday


-- moveable Easter + 1 day Easter Monday	Deftéra tou Páscha	Δευτέρα του Πάσχα		[2]
UPDATE dim_calendar
SET hol_gr = TRUE
WHERE calc_western_easter_mon = TRUE
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
UPDATE dim_calendar
SET hol_gr = TRUE
WHERE calc_western_whit_mon = TRUE
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
