-- Cyprus

BEGIN;


UPDATE dim_calendar
SET hol_cy = FALSE
;


-- New Year's Day – 1 January
UPDATE dim_calendar
SET hol_cy = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 1
AND   EXTRACT( MONTH FROM calendar_date) = 1
; 


-- Epiphany – 6 January
UPDATE dim_calendar
SET hol_cy = TRUE
WHERE calc_western_epiphany = TRUE
;


-- Clean Monday – date variable
-- Ash Monday. 48 Days before easter
WITH cte AS (
    SELECT ( calendar_date  - INTERVAL '49 DAYS'   ) AS easter_mon_minus_49
    FROM dim_calendar 
    WHERE calc_western_easter_mon = TRUE
)
UPDATE dim_calendar
SET hol_cy = TRUE
FROM cte
WHERE dim_calendar.calendar_date = cte.easter_mon_minus_49
; 


-- Greek Independence Day – 25 March
UPDATE dim_calendar
SET hol_cy = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 25
AND   EXTRACT( MONTH FROM calendar_date) = 3
; 


-- Cyprus National Day – 1 April
UPDATE dim_calendar
SET hol_cy = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 1
AND   EXTRACT( MONTH FROM calendar_date) = 4
; 


-- Good Friday – date variable
UPDATE dim_calendar
SET hol_cy = TRUE
WHERE calc_western_good_fri = TRUE
; 


-- Holy Saturday – date variable
WITH cte AS (
    SELECT ( calendar_date + INTERVAL '1 DAY'   ) AS good_fri_plus_1
    FROM dim_calendar 
    WHERE calc_western_good_fri = TRUE
)
UPDATE dim_calendar
SET hol_cy = TRUE
FROM cte
WHERE dim_calendar.calendar_date = cte.good_fri_plus_1
; 


-- Easter Sunday – date variable
UPDATE dim_calendar
SET hol_cy = TRUE
WHERE calc_western_easter_sun = TRUE
; 


-- Easter Monday – date variable
UPDATE dim_calendar
SET hol_cy = TRUE
WHERE calc_western_easter_mon = TRUE
;

-- Easter Tuesday – date variable
WITH cte AS (
    SELECT ( calendar_date + INTERVAL '1 DAY'   ) AS easter_mon_plus_1
    FROM dim_calendar 
    WHERE calc_western_easter_mon = TRUE
)
UPDATE dim_calendar
SET hol_cy = TRUE
FROM cte
WHERE dim_calendar.calendar_date = cte.easter_mon_plus_1
; 


-- Labour Day – 1 May
UPDATE dim_calendar
SET hol_cy = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 1
AND   EXTRACT( MONTH FROM calendar_date) = 5
; 


-- Pentecost Monday – date variable
UPDATE dim_calendar
SET hol_cy = TRUE
WHERE calc_western_whit_mon = TRUE
;


-- Dormition of the Theotokos – 15 August
UPDATE dim_calendar
SET hol_cy = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 15
AND   EXTRACT( MONTH FROM calendar_date) = 8
; 


-- Cyprus Independence Day – 1 October
UPDATE dim_calendar
SET hol_cy = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 1
AND   EXTRACT( MONTH FROM calendar_date) = 10
; 


-- Greek National Day – 28 October
UPDATE dim_calendar
SET hol_cy = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 28
AND   EXTRACT( MONTH FROM calendar_date) = 10
; 


-- Christmas Eve – 24 December
UPDATE dim_calendar
SET hol_cy = TRUE
WHERE calc_western_christmas_eve = TRUE
; 


-- Christmas Day – 25 December
UPDATE dim_calendar
SET hol_cy = TRUE
WHERE calc_western_christmas = TRUE
; 


-- Boxing Day – 26 December
UPDATE dim_calendar
SET hol_cy = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 26
AND   EXTRACT( MONTH FROM calendar_date) = 12
; 



COMMIT;
