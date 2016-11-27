-- Scotland

BEGIN;

UPDATE dim_calendar
SET hol_gb_sct = FALSE
;




-- New Years day 01 Jan
-- Wikipedia says
--   1 January	New Year's Day
UPDATE dim_calendar
SET hol_gb_sct = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 1
AND   EXTRACT( MONTH FROM calendar_date) = 1
;


-- New Years New Year Holiday 02 Jan
-- Wikipedia says

UPDATE dim_calendar
SET hol_gb_sct = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 2
AND   EXTRACT( MONTH FROM calendar_date) = 1
;


-- Good Friday
-- Wikipedia says
--    variable	Good Friday	Traditional common law holiday[1][2][3][4]
UPDATE dim_calendar
SET hol_gb_sct = TRUE
WHERE calc_western_good_fri = TRUE
;


-- May Day Bank Holiday
-- Wikipedia says
-- First Monday in May
WITH cte AS (
    SELECT EXTRACT(YEAR FROM dc2.calendar_date) AS yr,
           MIN(calendar_date) AS first_mon_may
           FROM dim_calendar AS dc2
           WHERE EXTRACT(MONTH FROM calendar_date) = 5
           AND EXTRACT(DOW FROM calendar_date) = 1
           GROUP BY EXTRACT(YEAR FROM dc2.calendar_date)
)
UPDATE dim_calendar
SET hol_gb_sct = TRUE
FROM cte
WHERE dim_calendar.calendar_date = cte.first_mon_may
;

-- Spring Bank Holiday
WITH cte AS (
    SELECT EXTRACT(YEAR FROM dc2.calendar_date) AS yr,
           MAX(calendar_date) AS last_mon_may
           FROM dim_calendar AS dc2
           WHERE EXTRACT(MONTH FROM calendar_date) = 5
           AND EXTRACT(DOW FROM calendar_date) = 1
           GROUP BY EXTRACT(YEAR FROM dc2.calendar_date)
)
UPDATE dim_calendar
SET hol_gb_sct = TRUE
FROM cte
WHERE dim_calendar.calendar_date = cte.last_mon_may
;



-- Last Monday in August
-- Wikipedia says
--    Late Summer Bank Holiday Statutory bank holiday from 1971,[12] following a trial period from 1965 to 1970.
--    Replaced the first Monday in August (formerly commonly known as "August Bank Holiday".[1][4][12]
--    The legislation does not specify a name for the holiday, merely when it occurs.
WITH cte AS (
    SELECT EXTRACT(YEAR FROM dc2.calendar_date) AS yr,
           MIN(calendar_date) AS first_mon_aug
           FROM dim_calendar AS dc2
           WHERE EXTRACT(MONTH FROM calendar_date) = 8
           AND EXTRACT(DOW FROM calendar_date) = 1
           GROUP BY EXTRACT(YEAR FROM dc2.calendar_date)
)
UPDATE dim_calendar
SET hol_gb_sct = TRUE
FROM cte
WHERE dim_calendar.calendar_date = cte.first_mon_aug
;



-- 30 Nov St. Andrew's Day
UPDATE dim_calendar
SET hol_gb_sct = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 30
AND   EXTRACT( MONTH FROM calendar_date) = 11
;

-- Christmas day 25 Dec
UPDATE dim_calendar
SET hol_gb_sct = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 25
AND   EXTRACT( MONTH FROM calendar_date) = 12
;


-- Boxing day
UPDATE dim_calendar
SET hol_gb_sct = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 26
AND   EXTRACT( MONTH FROM calendar_date) = 12
;

-- In 2012, there was a special holiday on Tuesday, 5 June, to celebrate the Diamond Jubilee of Elizabeth II.
UPDATE dim_calendar
SET hol_gb_sct = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 05
AND   EXTRACT( MONTH FROM calendar_date) = 06
AND   EXTRACT( YEAR  FROM calendar_date) = 2012
;



COMMIT;