-- Germany Saxony-Anhalt

BEGIN;


UPDATE dim_calendar
SET hol_de_st = FALSE
;


-- New Year's Day	Neujahrstag	1 January
UPDATE dim_calendar
SET hol_de_st = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 1
AND   EXTRACT( MONTH FROM calendar_date) = 1
; 


-- Epiphany	Heilige Drei Könige	6 January
UPDATE dim_calendar
SET hol_de_st = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 6
AND   EXTRACT( MONTH FROM calendar_date) = 1
; 


-- Good Friday	Karfreitag	Easter Sunday - 2d
UPDATE dim_calendar
SET hol_de_st = TRUE
WHERE calc_western_good_fri = TRUE
; 


-- Easter Monday	Ostermontag	Easter Sunday + 1d
UPDATE dim_calendar
SET hol_de_st = TRUE
WHERE calc_western_easter_mon = TRUE
; 


-- Labor Day	Tag der Arbeit	1 May
UPDATE dim_calendar
SET hol_de_st = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 1
AND   EXTRACT( MONTH FROM calendar_date) = 5
; 


-- Ascension Day	Christi Himmelfahrt	Easter Sunday + 39d
UPDATE dim_calendar
SET hol_de_st = TRUE
WHERE calc_western_ascension_thu = TRUE
; 


-- Whit Monday	Pfingstmontag	Easter Sunday + 50d
UPDATE dim_calendar
SET hol_de_st = TRUE
WHERE calc_western_whit_mon = TRUE
; 


-- -- Corpus Christi	Fronleichnam	Easter Sunday + 60d
-- UPDATE dim_calendar
-- SET hol_de_st = TRUE
-- WHERE calc_western_corpuschristi_thu = TRUE
-- ;
--
--
-- -- Peace Festival	Friedensfest	8 August		(3)
-- UPDATE dim_calendar
-- SET hol_de_st = TRUE
-- WHERE EXTRACT( DAY   FROM calendar_date) = 8
-- AND   EXTRACT( MONTH FROM calendar_date) = 8
-- ;
--
--
-- -- Assumption Day	Mariä Himmelfahrt	15 August
-- UPDATE dim_calendar
-- SET hol_de_st = TRUE
-- WHERE calc_western_assumption = TRUE
-- ;


-- German Unity Day	Tag der Deutschen Einheit	3 October
UPDATE dim_calendar
SET hol_de_st = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 3
AND   EXTRACT( MONTH FROM calendar_date) = 10
; 


-- Reformation Day	Reformationstag	31 October
UPDATE dim_calendar
SET hol_de_st = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 31
AND   EXTRACT( MONTH FROM calendar_date) = 10
; 


-- -- All Saints	Allerheiligen	1 November
-- UPDATE dim_calendar
-- SET hol_de_st = TRUE
-- WHERE calc_western_all_saints = TRUE
-- ;


-- Repentance and Prayer Day (4)	Buß- und Bettag	Second Wednesday before the First Advent		(6)											Yes
--  it is the Wednesday that falls between 16th and 22nd November
UPDATE dim_calendar
SET hol_de_st = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) BETWEEN 16 AND 22
AND   EXTRACT( DOW   FROM calendar_date) = 3
AND   EXTRACT( MONTH FROM calendar_date) = 11
AND   EXTRACT( YEAR  FROM calendar_date) <= 1994
;


-- Christmas Day	Weihnachtstag	25 December
UPDATE dim_calendar
SET hol_de_st = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 25
AND   EXTRACT( MONTH FROM calendar_date) = 12
; 


-- St Stephen's Day / Boxing Day	Zweiter Weihnachtsfeiertag	26 December
UPDATE dim_calendar
SET hol_de_st = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 26
AND   EXTRACT( MONTH FROM calendar_date) = 12
; 


COMMIT;
