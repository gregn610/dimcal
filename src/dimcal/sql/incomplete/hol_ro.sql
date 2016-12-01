-- Romania

BEGIN;


UPDATE dim_calendar
SET hol_ro = FALSE
;



-- January 1	Anul Nou	New Year's Day	
UPDATE dim_calendar
SET hol_ro = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 1
AND   EXTRACT( MONTH FROM calendar_date) = 1
; 


-- January 2	Anul Nou	Day after New Year's Day
UPDATE dim_calendar
SET hol_ro = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 2
AND   EXTRACT( MONTH FROM calendar_date) = 1
; 


-- January 24	Unirea Principatelor Române/Mica Unire	Union Day/Small Union	
UPDATE dim_calendar
SET hol_ro = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 24
AND   EXTRACT( MONTH FROM calendar_date) = 1
; 


-- April/May	Paștele	Easter	The official holiday is the Orthodox Easter. 
-- The holiday is three days long, the Easter Sunday and Monday are non-working, Tuesday is not a public holiday.
WITH cte AS (
    SELECT ( calendar_date  + INTERVAL '2 DAYS'   ) AS good_fri_plus_2
    FROM dim_calendar 
    WHERE calc_western_good_fri = TRUE
)
UPDATE dim_calendar
SET hol_ro = TRUE
FROM cte
WHERE dim_calendar.calendar_date = cte.good_fri_plus_2
; 

UPDATE dim_calendar
SET hol_ro = TRUE
WHERE calc_western_easter_mon = TRUE
;


-- May 1	Ziua Muncii	Labour Day	International Labour Day
UPDATE dim_calendar
SET hol_ro = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 1
AND   EXTRACT( MONTH FROM calendar_date) = 5
; 


-- May/June	Rusaliile	Pentecost, Whit Monday	The 50th and 51st day after the Orthodox Easter.
UPDATE dim_calendar
SET hol_ro = TRUE
WHERE calc_western_whit_mon = TRUE
;


-- August 15	Adormirea Maicii Domnului/Sfânta Maria Mare	Dormition of the Theotokos	Also the Day of the Romanian Naval Forces since St. Mary is the patron saint of the Navy.
UPDATE dim_calendar
SET hol_ro = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 15
AND   EXTRACT( MONTH FROM calendar_date) = 8
; 


-- November 30	Sfântul Andrei	St. Andrew's Day	Saint Andrew is the patron saint of Romania.
UPDATE dim_calendar
SET hol_ro = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 30
AND   EXTRACT( MONTH FROM calendar_date) = 11
; 


-- December 1	Ziua Națională/Marea Unire	National Day/Great Union	It celebrates the union of Transylvania with Romania.
UPDATE dim_calendar
SET hol_ro = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 1
AND   EXTRACT( MONTH FROM calendar_date) = 12
; 


-- December 25/26	Crăciunul	Christmas	Both first and second Christmas Day are holidays. Third Christmas Day is not a public holiday.
UPDATE dim_calendar
SET hol_ro = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 25
AND   EXTRACT( MONTH FROM calendar_date) = 12
; 


UPDATE dim_calendar
SET hol_ro = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 26
AND   EXTRACT( MONTH FROM calendar_date) = 12
; 



COMMIT;
