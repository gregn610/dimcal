BEGIN;

UPDATE dim_calendar
SET hol_nl = FALSE
;

-- 1 January	New Year's Day	Nieuwjaarsdag	
UPDATE dim_calendar
SET hol_nl = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 1
AND   EXTRACT( MONTH FROM calendar_date) = 1
; 

-- March/April	Good Friday	Goede Vrijdag	
UPDATE dim_calendar
SET hol_nl = TRUE
WHERE calc_western_good_fri = TRUE
; 


-- March/April	Easter	Pasen	A two-day holiday (Easter Sunday and the subsequent Monday).
-- Easter Sunday – date variable
WITH cte AS (
    SELECT ( calendar_date  + INTERVAL '2 DAYS'   ) AS good_fri_plus_2
    FROM dim_calendar
    WHERE calc_western_good_fri = TRUE
)
UPDATE dim_calendar
SET hol_nl = TRUE
FROM cte
WHERE dim_calendar.calendar_date = cte.good_fri_plus_2
;

UPDATE dim_calendar
SET hol_nl = TRUE
WHERE calc_western_easter_mon = TRUE
; 


-- Up until 2013, the holiday was known as Koninginnedag or Queen's Day and was celebrated on 30 April.
UPDATE dim_calendar
SET hol_nl = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 30
AND   EXTRACT( MONTH FROM calendar_date) = 4
AND   EXTRACT( YEAR  FROM calendar_date) <= 2013
;


-- 27 April	King's Day	Koningsdag	If 27 April falls on a Sunday, King's day is celebrated on the 26th.
UPDATE dim_calendar
SET hol_nl = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 27
AND   EXTRACT( MONTH FROM calendar_date) = 4
AND   EXTRACT( YEAR  FROM calendar_date) > 2013
AND   EXTRACT( DOW   FROM calendar_date) > 0
; 
UPDATE dim_calendar
SET hol_nl = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 26
AND   EXTRACT( MONTH FROM calendar_date) = 4
AND   EXTRACT( YEAR  FROM calendar_date) > 2013
AND   EXTRACT( DOW   FROM calendar_date) = 0
; 



-- 5 May	Liberation Day	Bevrijdingsdag	This is a national holiday, previously only once every five years.
UPDATE dim_calendar
SET hol_nl = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 5
AND   EXTRACT( MONTH FROM calendar_date) = 5
; 


-- 40 days after Easter	Ascension Day	Hemelvaartsdag	The subsequent Friday is a day off for most people.
WITH cte AS (
    SELECT ( calendar_date  + INTERVAL '38 DAYS'   ) AS easter_mon_plus_38
    FROM dim_calendar 
    WHERE calc_western_easter_mon = TRUE
)
UPDATE dim_calendar
SET hol_nl = TRUE
FROM cte
WHERE dim_calendar.calendar_date = cte.easter_mon_plus_38
; 



-- 7 weeks after Easter	Pentecost	Pinksteren	A two-day holiday (Whitsunday and the subsequent Monday).
WITH cte AS (
    SELECT ( calendar_date  - INTERVAL '1 DAY'   ) AS whit_mon_minus_1
    FROM dim_calendar 
    WHERE calc_western_whit_mon = TRUE
)
UPDATE dim_calendar
SET hol_nl = TRUE
FROM cte
WHERE dim_calendar.calendar_date = cte.whit_mon_minus_1
; 
-- 7 weeks after Easter	Pentecost	Pinksteren	A two-day holiday (Whitsunday and the subsequent Monday).
UPDATE dim_calendar
SET hol_nl = TRUE
WHERE calc_western_whit_mon = TRUE
;



-- 25 & 26 December	Christmas	Kerstmis	The Dutch have two days of Christmas, both called Christmas Day
UPDATE dim_calendar
SET hol_nl = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) BETWEEN 25 AND 26
AND   EXTRACT( MONTH FROM calendar_date) = 12
; 



COMMIT;
