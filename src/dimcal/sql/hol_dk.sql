-- Denmark

BEGIN;

UPDATE dim_calendar
SET hol_dk = FALSE
;



-- 1 January	New Year's Day	Nytårsdag	 
UPDATE dim_calendar
SET hol_dk = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 1
AND   EXTRACT( MONTH FROM calendar_date) = 1
;



-- Palm Sunday
WITH cte AS (
    SELECT ( calendar_date - INTERVAL '5 DAY'   ) AS good_fri_minus_5
    FROM dim_calendar
    WHERE calc_western_good_fri = TRUE
)
UPDATE dim_calendar
SET hol_dk = TRUE
FROM cte
WHERE dim_calendar.calendar_date = cte.good_fri_minus_5
;



-- The Thursday before Easter Sunday	Maundy Thursday	Skærtorsdag	 
WITH cte AS (
    SELECT ( calendar_date - INTERVAL '1 DAY'   ) AS good_fri_minus_1
    FROM dim_calendar 
    WHERE calc_western_good_fri = TRUE
)
UPDATE dim_calendar
SET hol_dk = TRUE
FROM cte
WHERE dim_calendar.calendar_date = cte.good_fri_minus_1
; 


-- The Friday before Easter Sunday	Good Friday	Langfredag	 
UPDATE dim_calendar
SET hol_dk = TRUE
WHERE calc_western_good_fri = TRUE
;


-- March/April	Easter Sunday	Påskedag	 
UPDATE dim_calendar
SET hol_dk = TRUE
WHERE calc_western_easter_sun = TRUE
; 


-- The day after Easter Sunday	Easter Monday	2. Påskedag	 
UPDATE dim_calendar
SET hol_dk = TRUE
WHERE calc_western_easter_mon = TRUE
;


-- The 4th Friday after Easter	General Prayer Day	Store bededag
WITH cte AS (
    SELECT ( calendar_date  + INTERVAL '28 DAYS'   ) AS good_fri_plus_28
    FROM dim_calendar
    WHERE calc_western_good_fri = TRUE
)
UPDATE dim_calendar
SET hol_dk = TRUE
FROM cte
WHERE dim_calendar.calendar_date = cte.good_fri_plus_28
;


-- Constitution Day (Denmark) 	Grundlovsdag
-- With few exceptions, all shops stay closed on Grundlovsdag by law.[1]
UPDATE dim_calendar
SET hol_dk = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 5
AND   EXTRACT( MONTH FROM calendar_date) = 6
;


-- 39 days after Easter	Ascension Day	Kristi Himmelfartsdag	 
UPDATE dim_calendar
SET hol_dk = TRUE
WHERE calc_western_ascension_thu = TRUE
;


-- 7 weeks after Easter	Pentecost	Pinsedag	This is a Sunday. Danes celebrate two days of Whitsun.
UPDATE dim_calendar
SET hol_dk = TRUE 
WHERE calc_western_whit_sun = TRUE
;


-- 7 weeks +1 day after Easter	Whit Monday	2. Pinsedag	This is a Monday. Danes celebrate two days of Whitsun.
UPDATE dim_calendar
SET hol_dk = TRUE
WHERE calc_western_whit_mon = TRUE
;


-- Danes celebrate three days of Christmas, starting early on December 24 in the evening.
UPDATE dim_calendar
SET hol_dk = TRUE
WHERE calc_western_christmas_eve = TRUE
;



-- 25 December	First Day of Christmas	Juledag / 1. juledag
UPDATE dim_calendar
SET hol_dk = TRUE
WHERE calc_western_christmas = TRUE
; 


-- 26 December	Second Day of Christmas	2. juledag	 
UPDATE dim_calendar
SET hol_dk = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 26
AND   EXTRACT( MONTH FROM calendar_date) = 12
; 


-- With few exceptions, all shops stay closed by law from 3 PM on Nytårsaftensdag, the day of Nytårsaften.[1]
UPDATE dim_calendar
SET hol_dk = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 31
AND   EXTRACT( MONTH FROM calendar_date) = 12
;


COMMIT;
