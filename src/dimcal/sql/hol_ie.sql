BEGIN;


-- Ireland 
UPDATE dim_calendar
SET hol_ie = FALSE
;

-- 1 January	
-- New Year's Day	Lá Caille or Lá Bliana Nua
UPDATE dim_calendar
SET hol_ie = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 1
AND   EXTRACT( MONTH FROM calendar_date) = 1
;


-- 17 March	
-- Saint Patrick's Day	Lá Fhéile Pádraig
-- National day. First became an official public holiday in Ireland in 1903.[2]
UPDATE dim_calendar
SET hol_ie = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 17
AND   EXTRACT( MONTH FROM calendar_date) = 3
;

-- -- Good Friday (Aoine an Chéasta) is not a public holiday, though all state schools and some businesses close.
-- UPDATE dim_calendar
-- SET hol_ie = TRUE
-- WHERE calc_western_good_fri = TRUE
-- ;


-- Moveable Monday	
-- Easter Monday	Luan Cásca
UPDATE dim_calendar
SET hol_ie = TRUE
WHERE calc_western_easter_mon = TRUE
;

  
-- Moveable Monday	
-- May Day[3]	Lá Bealtaine	
-- The first Monday in May. First observed in 1994.[4]
WITH cte AS (
    SELECT EXTRACT(YEAR FROM dc2.calendar_date) AS yr,
           MIN(calendar_date) AS first_mon_may
           FROM dim_calendar AS dc2
           WHERE EXTRACT(MONTH FROM calendar_date) = 5
           AND EXTRACT(DOW FROM calendar_date) = 1
           GROUP BY EXTRACT(YEAR FROM dc2.calendar_date)
)
UPDATE dim_calendar
SET hol_ie = TRUE
FROM cte
WHERE dim_calendar.calendar_date = cte.first_mon_may
AND EXTRACT(YEAR FROM calendar_date) >= 1994
;


-- Moveable Monday	
-- June Holiday	Lá Saoire i mí an Mheithimh	The first Monday in June. 
-- Previously observed as Whit Monday until 1973.[5]
WITH cte AS (
    SELECT EXTRACT(YEAR FROM dc2.calendar_date) AS yr,
           MIN(calendar_date) AS first_mon_jun
           FROM dim_calendar AS dc2
           WHERE EXTRACT(MONTH FROM calendar_date) = 6
           AND EXTRACT(DOW FROM calendar_date) = 1
           GROUP BY EXTRACT(YEAR FROM dc2.calendar_date)
)
UPDATE dim_calendar
SET hol_ie = TRUE
FROM cte
WHERE dim_calendar.calendar_date = cte.first_mon_jun
;


-- Moveable Monday	
-- August Holiday	Lá Saoire i mí Lúnasa	
-- The first Monday in August.
WITH cte AS (
    SELECT EXTRACT(YEAR FROM dc2.calendar_date) AS yr,
           MIN(calendar_date) AS first_mon_aug
           FROM dim_calendar AS dc2
           WHERE EXTRACT(MONTH FROM calendar_date) = 8
           AND EXTRACT(DOW FROM calendar_date) = 1
           GROUP BY EXTRACT(YEAR FROM dc2.calendar_date)
)
UPDATE dim_calendar
SET hol_ie = TRUE
FROM cte
WHERE dim_calendar.calendar_date = cte.first_mon_aug
;

-- Moveable Monday	
-- October Holiday	Lá Saoire i mí Dheireadh Fómhair	
-- The last Monday in October. (Lá Saoire Oíche Shamhna). First observed in 1977.[6]
WITH cte AS (
    SELECT EXTRACT(YEAR FROM dc2.calendar_date) AS yr,
           MAX(calendar_date) AS last_mon_oct
           FROM dim_calendar AS dc2
           WHERE EXTRACT(MONTH FROM calendar_date) = 10
           AND EXTRACT(DOW FROM calendar_date) = 1
           GROUP BY EXTRACT(YEAR FROM dc2.calendar_date)
)
UPDATE dim_calendar
SET hol_ie = TRUE
FROM cte
WHERE dim_calendar.calendar_date = cte.last_mon_oct
;

-- 25 December	
-- Christmas Day	Lá Nollag	
UPDATE dim_calendar
SET hol_ie = TRUE
WHERE calc_western_christmas = TRUE
;

-- 26 December	
-- St. Stephen's Day	Lá Fhéile Stiofáin or Lá an Dreoilín	
UPDATE dim_calendar
SET hol_ie = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 26
AND   EXTRACT( MONTH FROM calendar_date) = 12
;



-- Note that where a public holiday falls on a Saturday or a Sunday, or possibly coincides with another public holiday, 
-- it is generally observed (as a day off work) on the next available weekday, even though the public holiday itself does not move. 
-- In such cases, an employee is entitled to at least one of the following (as chosen by the employer): a day off within a month, 
-- an additional day's paid annual leave or an additional day's pay. 
-- The usual practice is, however, to award a day off on the next available weekday.

-- Roll Sat holidays to next working day
WITH cte1 AS (
SELECT calendar_date AS holiday_weekend_day
FROM dim_calendar
WHERE hol_ie = TRUE
AND EXTRACT( DOW FROM calendar_date) = 6 -- Sat
),
cte2 AS (
SELECT MIN(dc2.calendar_date) AS next_free_day
FROM cte1, dim_calendar as dc2
WHERE dc2.calendar_date > cte1.holiday_weekend_day
AND EXTRACT( DOW FROM dc2.calendar_date) BETWEEN 1 AND 5
AND dc2.hol_ie = FALSE
GROUP BY cte1.holiday_weekend_day
)
UPDATE dim_calendar
SET hol_ie = TRUE
FROM cte2
WHERE dim_calendar.calendar_date = cte2.next_free_day
;

-- Roll Sun holidays to next working day
WITH cte1 AS (
SELECT calendar_date AS holiday_weekend_day
FROM dim_calendar
WHERE hol_ie = TRUE
AND EXTRACT( DOW FROM calendar_date) = 0 -- Sun
),
cte2 AS (
SELECT MIN(dc2.calendar_date) AS next_free_day
FROM cte1, dim_calendar as dc2
WHERE dc2.calendar_date > cte1.holiday_weekend_day
AND EXTRACT( DOW FROM dc2.calendar_date) BETWEEN 1 AND 5
AND dc2.hol_ie = FALSE
GROUP BY cte1.holiday_weekend_day
)
UPDATE dim_calendar
SET hol_ie = TRUE
FROM cte2
WHERE dim_calendar.calendar_date = cte2.next_free_day
;





COMMIT;
