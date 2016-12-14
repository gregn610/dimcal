-- Sweden

BEGIN;

UPDATE dim_calendar
SET hol_se = FALSE
;


-- New Year's Day (nyårsdagen) 	January 1
UPDATE dim_calendar
SET hol_se = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 1
AND   EXTRACT( MONTH FROM calendar_date) = 1
;


-- Epiphany (trettondedag jul) 	January 6
UPDATE dim_calendar
SET hol_se = TRUE
WHERE calc_western_epiphany = TRUE
;


-- Good Friday (långfredagen) 	The Friday before Easter Sunday
UPDATE dim_calendar
SET hol_se = TRUE
WHERE calc_western_good_fri = TRUE
;


-- Easter Sunday (påskdagen) 	The first Sunday after a full moon on or after March 21
UPDATE dim_calendar
SET hol_se = TRUE
WHERE calc_western_easter_sun = TRUE
;


-- Easter Monday (annandag påsk) 	The day after Easter Sunday
UPDATE dim_calendar
SET hol_se = TRUE
WHERE calc_western_easter_mon = TRUE
;


-- International Workers' Day (Första maj) 	May 1
UPDATE dim_calendar
SET hol_se = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 1
AND   EXTRACT( MONTH FROM calendar_date) = 5
;


-- Ascension Day (Kristi himmelsfärds dag) 	39 days after Easter Sunday
UPDATE dim_calendar
SET hol_se = TRUE
WHERE calc_western_ascension_thu = TRUE
;


-- Pentecost (pingstdagen) 	The 7th Sunday (49 days) after Easter Sunday
UPDATE dim_calendar
SET hol_se = TRUE
WHERE calc_western_whit_sun = TRUE
;


-- National Day of Sweden (Sveriges nationaldag) 	June 6
UPDATE dim_calendar
SET hol_se = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 6
AND   EXTRACT( MONTH FROM calendar_date) = 6
;


-- Midsummer's Day (midsommardagen) 	The Saturday during the period 20–26 June. (2016: June 25)
UPDATE dim_calendar
SET hol_se = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) BETWEEN 20 AND 26
AND   EXTRACT( DOW   FROM calendar_date) = 6
AND   EXTRACT( MONTH FROM calendar_date) = 6
;


-- All Saints' Day (alla helgons dag) 	The Saturday during the period 31 October–6 November. (2016: November 5)
UPDATE dim_calendar
SET hol_se = TRUE
WHERE calc_western_all_saints = TRUE
;


-- Christmas Day (juldagen) 	25 December
UPDATE dim_calendar
SET hol_se = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 25
AND   EXTRACT( MONTH FROM calendar_date) = 12
;


-- Second Day of Christmas (annandag jul) 	26 December
UPDATE dim_calendar
SET hol_se = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 26
AND   EXTRACT( MONTH FROM calendar_date) = 12
;



COMMIT;