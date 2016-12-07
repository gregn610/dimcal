-- Panama

BEGIN;

UPDATE dim_calendar
SET hol_pa = FALSE
;


-- January 1, New Year's Day
UPDATE dim_calendar
SET hol_pa = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 1
AND   EXTRACT( MONTH FROM calendar_date) = 1 
;


-- January 9, Martyrs' Day (Panama)
UPDATE dim_calendar
SET hol_pa = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 9
AND   EXTRACT( MONTH FROM calendar_date) = 1 
;


-- Carnival's Monday. The Monday before Ash Wednesday.
WITH cte AS (
    SELECT calendar_date - INTERVAL '2 DAYS' AS mon_before_ash_wed
           FROM dim_calendar AS dc2
           WHERE calc_western_ash_wed = TRUE
)
UPDATE dim_calendar
SET hol_pa = TRUE
FROM cte
WHERE dim_calendar.calendar_date = cte.mon_before_ash_wed
;


-- Carnival's Tuesday. The Tuesday before Ash Wednesday.
WITH cte AS (
    SELECT calendar_date - INTERVAL '1 DAYS' AS tue_before_ash_wed
           FROM dim_calendar AS dc2
           WHERE calc_western_ash_wed = TRUE
)
UPDATE dim_calendar
SET hol_pa = TRUE
FROM cte
WHERE dim_calendar.calendar_date = cte.tue_before_ash_wed
;


-- Holy Friday - Good Friday - Death of Christ
UPDATE dim_calendar
SET hol_pa = TRUE
WHERE calc_western_good_fri = TRUE
;


-- May 1, May Day - Labor Day
UPDATE dim_calendar
SET hol_pa = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 1
AND   EXTRACT( MONTH FROM calendar_date) = 5 
;


-- July 1. (every 5 years) presidential inauguration
UPDATE dim_calendar
SET hol_pa = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 1
AND   EXTRACT( MONTH FROM calendar_date) = 7 
AND   EXTRACT( YEAR  FROM calendar_date) >= 2009
AND   EXTRACT( YEAR  FROM calendar_date)::INTEGER % 5 = 4
;


-- November 3. Separation Day (from Colombia).
UPDATE dim_calendar
SET hol_pa = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 3
AND   EXTRACT( MONTH FROM calendar_date) = 11 
;

-- November 4. Flag Day
UPDATE dim_calendar
SET hol_pa = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 4
AND   EXTRACT( MONTH FROM calendar_date) = 11 
;

-- November 5. Colón Day
UPDATE dim_calendar
SET hol_pa = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 5
AND   EXTRACT( MONTH FROM calendar_date) = 11 
;

-- November 10. "Primer Grito de Independencia de la Villa de los Santos" celebrating 
UPDATE dim_calendar
SET hol_pa = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 10
AND   EXTRACT( MONTH FROM calendar_date) = 11 
;

-- November 28. Independence Day (from Spain).
UPDATE dim_calendar
SET hol_pa = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 28
AND   EXTRACT( MONTH FROM calendar_date) = 11 
;

-- December 8. Mothers' Day.
UPDATE dim_calendar
SET hol_pa = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 8
AND   EXTRACT( MONTH FROM calendar_date) = 12 
;

-- December 25. Christmas.
UPDATE dim_calendar
SET hol_pa = TRUE
WHERE calc_western_christmas = TRUE
;



COMMIT;
