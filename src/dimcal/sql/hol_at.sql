BEGIN;

-- Austria

UPDATE dim_calendar
SET hol_at = FALSE
;


-- 1 January	New Year's Day	Neujahr	
UPDATE dim_calendar
SET hol_at = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 1
AND   EXTRACT( MONTH FROM calendar_date) = 1
; 

-- 6 January	Epiphany	Heilige Drei Könige
UPDATE dim_calendar
SET hol_at = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 6
AND   EXTRACT( MONTH FROM calendar_date) = 1
; 

-- *	Easter Monday	Ostermontag	
UPDATE dim_calendar
SET hol_at = TRUE
WHERE calc_western_easter_mon = TRUE
;

-- 1 May	National Holiday	Staatsfeiertag	
UPDATE dim_calendar
SET hol_at = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 1
AND   EXTRACT( MONTH FROM calendar_date) = 5
; 

-- *	Ascension Day	Christi Himmelfahrt	39 days after Easter Sunday
UPDATE dim_calendar
SET hol_at = TRUE
WHERE calc_western_ascension_thu = TRUE
;

-- *	Whit Monday	Pfingstmontag	Descent of the Holy Ghost upon the Apostles, 49 and 50 days after the Resurrection of Christ
UPDATE dim_calendar
SET hol_at = TRUE
WHERE calc_western_whit_mon = TRUE
; 

-- *	Corpus Christi	Fronleichnam	First Holy Eucharist Last Supper. Thursday after Trinity Sunday (60 days after Easter Sunday)
UPDATE dim_calendar
SET hol_at = TRUE
WHERE calc_western_corpuschristi_thu = TRUE
; 

-- 15 August	Assumption of the Virgin Mary	Mariä Himmelfahrt	
UPDATE dim_calendar
SET hol_at = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 15
AND   EXTRACT( MONTH FROM calendar_date) = 8
;

-- 26 October	National Holiday	Nationalfeiertag	day of the Declaration of Neutrality
UPDATE dim_calendar
SET hol_at = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 26
AND   EXTRACT( MONTH FROM calendar_date) = 10
;

-- 1 November	All Saints' Day	Allerheiligen	
UPDATE dim_calendar
SET hol_at = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 1
AND   EXTRACT( MONTH FROM calendar_date) = 11
;

-- 8 December	Immaculate Conception	Mariä Empfängnis	retail stores are allowed to open for Christmas shopping
UPDATE dim_calendar
SET hol_at = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 8
AND   EXTRACT( MONTH FROM calendar_date) = 12
;

-- 25 December	Christmas Day	Christtag	
UPDATE dim_calendar
SET hol_at = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 25
AND   EXTRACT( MONTH FROM calendar_date) = 12
;

-- 26 December	St. Stephen's Day	Stefanitag	
UPDATE dim_calendar
SET hol_at = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 26
AND   EXTRACT( MONTH FROM calendar_date) = 12
;


COMMIT;
