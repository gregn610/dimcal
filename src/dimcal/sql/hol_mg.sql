-- Madagascar

BEGIN;

UPDATE dim_calendar
SET hol_mg = FALSE
;


-- January 1	New Year's Day
UPDATE dim_calendar
SET hol_mg = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 1
AND   EXTRACT( MONTH FROM calendar_date) = 1
;


-- March 29	Martyrs' Day
UPDATE dim_calendar
SET hol_mg = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 29
AND   EXTRACT( MONTH FROM calendar_date) = 3
;


-- variable (March or April)	Easter Monday
UPDATE dim_calendar
SET hol_mg = TRUE
WHERE calc_western_easter_mon = TRUE
;


-- May 1	Labour Day
UPDATE dim_calendar
SET hol_mg = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 1
AND   EXTRACT( MONTH FROM calendar_date) = 5
;


-- variable (May or June)	Ascension
UPDATE dim_calendar
SET hol_mg = TRUE
WHERE calc_western_ascension_thu = TRUE
;

-- variable (May or June)	Whit Monday
UPDATE dim_calendar
SET hol_mg = TRUE
WHERE calc_western_whit_mon = TRUE
;


-- June 26	Independence Day
UPDATE dim_calendar
SET hol_mg = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 26
AND   EXTRACT( MONTH FROM calendar_date) = 6
;


-- August 15	Assumption
UPDATE dim_calendar
SET hol_mg = TRUE
WHERE calc_western_assumption = TRUE
;


-- November 1	All Saints Day
UPDATE dim_calendar
SET hol_mg = TRUE
WHERE calc_western_all_saints = TRUE
;


-- December 25	Christmas Day
UPDATE dim_calendar
SET hol_mg = TRUE
WHERE calc_western_christmas = TRUE
;






COMMIT;
