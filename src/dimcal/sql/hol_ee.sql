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
UPDATE dim_calendar
SET hol_ee = TRUE
WHERE calc_western_easter_sun = TRUE
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
WHERE calc_western_whit_sun = TRUE
; 
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
UPDATE dim_calendar
SET hol_ee = TRUE
WHERE calc_western_christmas_eve = TRUE
; 


-- December 25	Christmas Day	esimene jõulupüha	
UPDATE dim_calendar
SET hol_ee = TRUE
WHERE calc_western_christmas = TRUE
; 


-- December 26	Boxing Day	teine jõulupüha	
UPDATE dim_calendar
SET hol_ee = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 26
AND   EXTRACT( MONTH FROM calendar_date) = 12
; 




COMMIT;
