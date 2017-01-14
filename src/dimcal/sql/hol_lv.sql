-- Latvia

BEGIN;

UPDATE dim_calendar
SET hol_lv = FALSE
;


-- 1 January	New Year's Day	Jaunais Gads	
UPDATE dim_calendar
SET hol_lv = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 1
AND   EXTRACT( MONTH FROM calendar_date) = 1
;


-- The Friday before Easter Sunday	Good Friday	Lielā Piektdiena	
UPDATE dim_calendar
SET hol_lv = TRUE
WHERE calc_western_good_fri = TRUE
;

-- March/April	Easter Sunday	Lieldienas	
UPDATE dim_calendar
SET hol_lv = TRUE
WHERE calc_western_easter_sun = TRUE
; 


-- The day after Easter Sunday	Easter Monday	Otrās Lieldienas
UPDATE dim_calendar
SET hol_lv = TRUE
WHERE calc_western_easter_mon = TRUE
;

-- 1 May	Labour Day	Darba svētki	
UPDATE dim_calendar
SET hol_lv = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 1
AND   EXTRACT( MONTH FROM calendar_date) = 5
;


-- 4 May	Restoration of Independence day	Latvijas Republikas Neatkarības atjaunošanas diena	On 4 May 1990. 
-- Latvia proclaimed its independence from the USSR, and restoration of the Republic of Latvia. 
-- If the day is on the weekend the next Monday is a holiday.
UPDATE dim_calendar
SET hol_lv = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 4
AND   EXTRACT( MONTH FROM calendar_date) = 5
AND   EXTRACT( YEAR  FROM calendar_date) >= 1990
;
-- Sat Observed
UPDATE dim_calendar
SET hol_lv = TRUE
WHERE EXTRACT( DOW   FROM calendar_date) = 1
AND   EXTRACT( DAY   FROM calendar_date) = 6
AND   EXTRACT( MONTH FROM calendar_date) = 5
AND   EXTRACT( YEAR  FROM calendar_date) >= 1990 
;
-- Sun Observed
UPDATE dim_calendar
SET hol_lv = TRUE
WHERE EXTRACT( DOW   FROM calendar_date) = 1
AND   EXTRACT( DAY   FROM calendar_date) = 5
AND   EXTRACT( MONTH FROM calendar_date) = 5
AND   EXTRACT( YEAR  FROM calendar_date) >= 1990 
;


-- -- Second Sunday of May	Mother's day	Mātes diena
-- UPDATE dim_calendar
-- SET hol_lv = TRUE
-- WHERE EXTRACT( DOW   FROM calendar_date) = 0 -- Sun
-- AND   EXTRACT( DAY   FROM calendar_date) BETWEEN 8 and 15
-- AND   EXTRACT( MONTH FROM calendar_date) = 5
-- ;


-- 23 June	Midsummer Eve	Līgo Diena	
UPDATE dim_calendar
SET hol_lv = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 23
AND   EXTRACT( MONTH FROM calendar_date) = 6
;


-- 24 June	Midsummer	Jāņi	
UPDATE dim_calendar
SET hol_lv = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 24
AND   EXTRACT( MONTH FROM calendar_date) = 6
;


-- 18 November	Proclamation Day of the Republic of Latvia	
-- Latvijas Republikas proklamēšanas diena	The independence of Latvia was proclaimed on this day in 1918. 
-- If the day is on the weekend the next Monday is a holiday.
UPDATE dim_calendar
SET hol_lv = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 18
AND   EXTRACT( MONTH FROM calendar_date) = 11
;
-- Sat Observed
UPDATE dim_calendar
SET hol_lv = TRUE
WHERE EXTRACT( DOW   FROM calendar_date) = 1 -- sat
AND   EXTRACT( DAY   FROM calendar_date) = 20
AND   EXTRACT( MONTH FROM calendar_date) = 11
;
-- Sun Observed
UPDATE dim_calendar
SET hol_lv = TRUE
WHERE EXTRACT( DOW   FROM calendar_date) = 1 -- sun
AND   EXTRACT( DAY   FROM calendar_date) = 19
AND   EXTRACT( MONTH FROM calendar_date) = 11
;


-- 24 December	Christmas Eve	Ziemassvētku vakars	
UPDATE dim_calendar
SET hol_lv = TRUE
WHERE calc_western_christmas_eve = TRUE
;


-- 25 December	Christmas Day	Ziemassvētki	
UPDATE dim_calendar
SET hol_lv = TRUE
WHERE calc_western_christmas = TRUE
;


-- 26 December	Boxing Day Second Day of Christmas	Otrie Ziemassvētki	
UPDATE dim_calendar
SET hol_lv = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 26
AND   EXTRACT( MONTH FROM calendar_date) = 12
;


-- 31 December	New Year's Eve	Vecgada vakars
UPDATE dim_calendar
SET hol_lv = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 31
AND   EXTRACT( MONTH FROM calendar_date) = 12
;



COMMIT;
