-- Estonia

BEGIN;


UPDATE dim_calendar
SET hol_ee = FALSE
;


-- January 1	New Year's Day	uusaasta	
UPDATE dim_calendar
SET hol_ee = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 1
AND   EXTRACT( MONTH FROM calendar_date) = 1
; 


-- February 24	Independence Day	iseseisvuspäev	National Day – celebrates the declaration of independence in 1918.
UPDATE dim_calendar
SET hol_ee = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 24
AND   EXTRACT( MONTH FROM calendar_date) = 2
; 


-- Moveable Friday	Good Friday	suur reede	
UPDATE dim_calendar
SET hol_ee = TRUE
WHERE calc_western_good_fri = TRUE
;


-- Moveable Sunday	Easter Sunday	ülestõusmispühade 1. püha	Commonly known as lihavõtted.
WITH cte AS (
    SELECT ( calendar_date  + INTERVAL '2 DAYS'   ) AS good_fri_plus_2
    FROM dim_calendar 
    WHERE calc_western_good_fri = TRUE
)
UPDATE dim_calendar
SET hol_ee = TRUE
FROM cte
WHERE dim_calendar.calendar_date = cte.good_fri_plus_2
; 


-- May 1	Spring Day (May Day)	kevadpüha	
UPDATE dim_calendar
SET hol_ee = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 1
AND   EXTRACT( MONTH FROM calendar_date) = 5
; 


-- Moveable	Whitsunday (Pentecost)	nelipühade 1. püha	
-- June 23	Victory Day	võidupüha and jaanilaupäev	Celebrates the victory in the Battle of Võnnu during the Estonian War of Independence.
UPDATE dim_calendar
SET hol_ee = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 23
AND   EXTRACT( MONTH FROM calendar_date) = 6
; 


-- June 24	Jaan's Day or Midsummer Day or St. John's Day	jaanipäev	Jaaniõhtu is celebrated in the night before Midsummer Day.
UPDATE dim_calendar
SET hol_ee = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 24
AND   EXTRACT( MONTH FROM calendar_date) = 6
; 


-- August 20	Day of Restoration of Independence	taasiseseisvumispäev	Celebrates Estonia's restoration of independence in 1991.
UPDATE dim_calendar
SET hol_ee = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 20
AND   EXTRACT( MONTH FROM calendar_date) = 8
AND   EXTRACT( YEAR  FROM calendar_date) >= 1991
; 


-- December 24	Christmas Eve	jõululaupäev	UPDATE dim_calendar
SET hol_ee = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 24
AND   EXTRACT( MONTH FROM calendar_date) = 12
; 


-- December 25	Christmas Day	esimene jõulupüha	
UPDATE dim_calendar
SET hol_ee = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 25
AND   EXTRACT( MONTH FROM calendar_date) = 12
; 


-- December 26	Boxing Day	teine jõulupüha	
UPDATE dim_calendar
SET hol_ee = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 26
AND   EXTRACT( MONTH FROM calendar_date) = 12
; 




COMMIT;
