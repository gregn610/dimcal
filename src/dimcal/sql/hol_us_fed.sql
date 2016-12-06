BEGIN;

UPDATE dim_calendar
SET hol_us_fed = FALSE
;

-- New Years Day
-- January 1 (Fixed)
UPDATE dim_calendar
SET hol_us_fed = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 1
AND   EXTRACT( MONTH FROM calendar_date) = 1
;

-- Birthday of Martin Luther King, Jr.
-- January 15–21 (Floating Monday)
UPDATE dim_calendar
SET hol_us_fed = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) BETWEEN 15 AND 21
AND   EXTRACT( MONTH FROM calendar_date) = 1
AND   EXTRACT( DOW   FROM calendar_date) = 1 -- Mon yyyy/01/15
AND   EXTRACT( YEAR FROM calendar_date) >= 1996
;


-- Inauguration Day
-- January 20 or 21
-- Wikipedia says:
--   While this is a federal holiday, this is not a "public holiday".
--   Only federal employees in the Washington, D.C. Area observe this day





-- Washington's Birthday
-- February 15–21 (Floating Monday)
UPDATE dim_calendar
SET hol_us_fed = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) BETWEEN 15 AND 21
AND   EXTRACT( MONTH FROM calendar_date) = 2
AND   EXTRACT( DOW   FROM calendar_date) = 1 -- Mon yyyy/01/15
;



-- Memorial Day
-- May 25–31 (Floating Monday)
UPDATE dim_calendar
SET hol_us_fed = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) BETWEEN 25 AND 31
AND   EXTRACT( MONTH FROM calendar_date) = 5
AND   EXTRACT( DOW   FROM calendar_date) = 1 -- Mon yyyy/01/15
;


-- Independence Day
-- July 4 (Fixed)
UPDATE dim_calendar
SET hol_us_fed = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 4
AND   EXTRACT( MONTH FROM calendar_date) = 7
;


-- Victory Day
-- Third Monday of August
-- Celebrated the U.S. victory against Japan in the conclusion of World War II. Was in place 1948 to 1975.
UPDATE dim_calendar
SET hol_us_fed = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) BETWEEN 15 AND 21
AND   EXTRACT( MONTH FROM calendar_date) = 8
AND   EXTRACT( DOW   FROM calendar_date) = 1 -- Mon yyyy/01/15
AND   EXTRACT( YEAR FROM calendar_date) <= 1975
;



-- Labor Day
-- September 1–7 (Floating Monday)
UPDATE dim_calendar
SET hol_us_fed = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) BETWEEN 1 AND 7
AND   EXTRACT( MONTH FROM calendar_date) = 9
AND   EXTRACT( DOW   FROM calendar_date) = 1 -- Mon yyyy/01/15
;


-- Columbus Day
-- October 8–14 (Floating Monday)
UPDATE dim_calendar
SET hol_us_fed = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) BETWEEN 8 AND 14
AND   EXTRACT( MONTH FROM calendar_date) = 10
AND   EXTRACT( DOW   FROM calendar_date) = 1 -- Mon yyyy/01/15
;


-- Veterans Day
-- November 11 (Fixed)
UPDATE dim_calendar
SET hol_us_fed = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 11
AND   EXTRACT( MONTH FROM calendar_date) = 11
;



-- Thanksgiving Day
-- November 22–28 (Floating Thursday)
UPDATE dim_calendar
SET hol_us_fed = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) BETWEEN 22 AND 28
AND   EXTRACT( MONTH FROM calendar_date) = 11
AND   EXTRACT( DOW   FROM calendar_date) = 4 -- Thu yyyy/01/15
;


-- Christmas Day
-- December 25 (Fixed)
UPDATE dim_calendar
SET hol_us_fed = TRUE
WHERE calc_western_christmas = TRUE
;



-- Roll Sat holidays to prev working day
WITH cte1 AS (
SELECT calendar_date AS holiday_weekend_day
FROM dim_calendar
WHERE hol_us_fed = TRUE
AND EXTRACT( DOW FROM calendar_date) = 6 -- Sat
),
cte2 AS (
SELECT MAX(dc2.calendar_date) AS last_free_day
FROM cte1, dim_calendar as dc2
WHERE dc2.calendar_date < cte1.holiday_weekend_day
AND EXTRACT( DOW FROM dc2.calendar_date) BETWEEN 1 AND 5
AND dc2.hol_us_fed = FALSE
GROUP BY cte1.holiday_weekend_day
)
UPDATE dim_calendar
SET hol_us_fed = TRUE
FROM cte2
WHERE dim_calendar.calendar_date = cte2.last_free_day
;



-- Roll Sun holidays to next working day
WITH cte1 AS (
SELECT calendar_date AS holiday_weekend_day
FROM dim_calendar
WHERE hol_us_fed = TRUE
AND EXTRACT( DOW FROM calendar_date) = 0 -- Sun
),
cte2 AS (
SELECT MIN(dc2.calendar_date) AS next_free_day
FROM cte1, dim_calendar as dc2
WHERE dc2.calendar_date > cte1.holiday_weekend_day
AND EXTRACT( DOW FROM dc2.calendar_date) BETWEEN 1 AND 5
AND dc2.hol_us_fed = FALSE
GROUP BY cte1.holiday_weekend_day
)
UPDATE dim_calendar
SET hol_us_fed = TRUE
FROM cte2
WHERE dim_calendar.calendar_date = cte2.next_free_day
;

COMMIT;