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
WITH cte AS (
    SELECT ( calendar_date  + INTERVAL '2 DAYS'   ) AS good_fri_plus_2
    FROM dim_calendar 
    WHERE calc_western_good_fri = TRUE
)
UPDATE dim_calendar
SET hol_dk = TRUE
FROM cte
WHERE dim_calendar.calendar_date = cte.good_fri_plus_2
; 


-- The day after Easter Sunday	Easter Monday	2. Påskedag	 
UPDATE dim_calendar
SET hol_dk = TRUE
WHERE calc_western_easter_mon = TRUE
;


-- The 4th Friday after Easter	General Prayer Day	Store bededag	A collection of minor Christian holy days consolidated into one day. The name translates literally from Danish language, "Great Prayer Day".

-- 39 days after Easter	Ascension Day	Kristi Himmelfartsdag	 
UPDATE dim_calendar
SET hol_dk = TRUE
WHERE calc_western_ascension_thu = TRUE
;


-- 7 weeks after Easter	Pentecost	Pinsedag	This is a Sunday. Danes celebrate two days of Whitsun.
UPDATE dim_calendar
SET hol_dk = TRUE 
WHERE calc_western_whit_mon = TRUE
;


-- 7 weeks +1 day after Easter	Whit Monday	2. Pinsedag	This is a Monday. Danes celebrate two days of Whitsun.
WITH cte AS (
    SELECT ( calendar_date  + INTERVAL '1 DAY'   ) AS whit_plus_1
    FROM dim_calendar 
    WHERE calc_western_whit_mon = TRUE
)
UPDATE dim_calendar
SET hol_dk = TRUE
FROM cte
WHERE dim_calendar.calendar_date = cte.whit_plus_1
; 


-- 25 December	First Day of Christmas	Juledag / 1. juledag	Danes celebrate three days of Christmas, starting early on December 24 in the evening.
UPDATE dim_calendar
SET hol_dk = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 25
AND   EXTRACT( MONTH FROM calendar_date) = 12
; 


-- 26 December	Second Day of Christmas	2. juledag	 
UPDATE dim_calendar
SET hol_dk = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 26
AND   EXTRACT( MONTH FROM calendar_date) = 12
; 



COMMIT;
