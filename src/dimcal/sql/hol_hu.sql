-- Hungary

BEGIN;

UPDATE dim_calendar
SET hol_hu = FALSE
;


-- 1 January	New Year's Day	Újév	
UPDATE dim_calendar
SET hol_hu = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 1
AND   EXTRACT( MONTH FROM calendar_date) = 1
; 


-- 15 March	National Day	Nemzeti ünnep	Memorial day of the 1848 Revolution
UPDATE dim_calendar
SET hol_hu = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 15
AND   EXTRACT( MONTH FROM calendar_date) = 3
; 


-- Moveable	Easter Sunday	Húsvétvasárnap
UPDATE dim_calendar
SET hol_hu = TRUE
WHERE calc_western_easter_sun = TRUE
;

-- Moveable	Easter Monday	Húsvéthétfő	
UPDATE dim_calendar
SET hol_hu = TRUE
WHERE calc_western_easter_mon = TRUE
;

-- 1 May	Labour day	A munka ünnepe	
UPDATE dim_calendar
SET hol_hu = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 1
AND   EXTRACT( MONTH FROM calendar_date) = 5
; 


-- Moveable	Pentecost Sunday	Pünkösdvasárnap	Sunday, 49 days after Easter
WITH cte AS (
    SELECT ( calendar_date - INTERVAL '1 DAY'   ) AS whit_mon_minus_1
    FROM dim_calendar 
    WHERE calc_western_whit_mon = TRUE
)
UPDATE dim_calendar
SET hol_hu = TRUE
FROM cte
WHERE dim_calendar.calendar_date = cte.whit_mon_minus_1
;


-- Moveable	Pentecost Monday	Pünkösdhétfő	Monday after Pentecost
UPDATE dim_calendar
SET hol_hu = TRUE
WHERE calc_western_whit_mon = TRUE
;


-- 20 August	State Foundation Day	Az államalapítás ünnepe	Hungary's first king St. Stephen's Day
UPDATE dim_calendar
SET hol_hu = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 20
AND   EXTRACT( MONTH FROM calendar_date) = 8
; 


-- 23 October	National Day	Nemzeti ünnep	Memorial day of the 1956 Revolution
UPDATE dim_calendar
SET hol_hu = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 23
AND   EXTRACT( MONTH FROM calendar_date) = 10
; 


-- 1 November	All Saints Day	Mindenszentek	Day of remembrance of the dead.
UPDATE dim_calendar
SET hol_hu = TRUE
WHERE calc_western_all_saints = TRUE
;



-- 25 December	Christmas	Karácsony	
UPDATE dim_calendar
SET hol_hu = TRUE
WHERE calc_western_christmas = TRUE
; 


-- 26 December	Second Day of Christmas	Karácsony másnapja
UPDATE dim_calendar
SET hol_hu = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 26
AND   EXTRACT( MONTH FROM calendar_date) = 12
; 



COMMIT;
