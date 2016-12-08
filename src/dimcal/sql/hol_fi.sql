-- Finland

BEGIN;

UPDATE dim_calendar
SET hol_fi = FALSE
;


-- 1 January	New Year's Day	Uudenvuodenpäivä	Nyårsdagen	 
UPDATE dim_calendar
SET hol_fi = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 1
AND   EXTRACT( MONTH FROM calendar_date) = 1
; 


-- 6 January	Epiphany	Loppiainen	Trettondedagen	 
UPDATE dim_calendar
SET hol_fi = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 6 
AND   EXTRACT( MONTH FROM calendar_date) = 1 
AND NOT EXTRACT (YEAR FROM calendar_date) BETWEEN 1973 AND 2001
; 

--  Epiphany to the Saturday following 5 January BETWEEN 1973 AND 2001
WITH cte AS (
    SELECT EXTRACT(YEAR FROM dc2.calendar_date) AS yr,
           MIN(calendar_date) AS first_sat_5_jan
           FROM dim_calendar AS dc2
           WHERE EXTRACT(MONTH FROM calendar_date) = 1
           AND EXTRACT(DOW FROM calendar_date) = 6
           AND EXTRACT(YEAR FROM dc2.calendar_date) BETWEEN 1973 AND 2001
           GROUP BY EXTRACT(YEAR FROM dc2.calendar_date)
)
UPDATE dim_calendar
SET hol_fi = TRUE
FROM cte
WHERE dim_calendar.calendar_date = cte.first_sat_5_jan
;




-- Moveable Friday	Good Friday	Pitkäperjantai	Långfredagen	The Friday before Easter Sunday
UPDATE dim_calendar
SET hol_fi = TRUE
WHERE calc_western_good_fri = TRUE
; 


-- Moveable Sunday	Easter Sunday	Pääsiäispäivä	Påskdagen	 
-- Easter Sunday – date variable
UPDATE dim_calendar
SET hol_fi = TRUE
WHERE calc_western_easter_sun = TRUE
; 


-- Moveable Monday	Easter Monday	2. pääsiäispäivä	Andra påskdagen	The day after Easter Sunday
UPDATE dim_calendar
SET hol_fi = TRUE
WHERE calc_western_easter_mon = TRUE
;


-- 1 May	May Day	Vappu	Första maj	See Walpurgis Night
UPDATE dim_calendar
SET hol_fi = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 1
AND   EXTRACT( MONTH FROM calendar_date) = 5
; 


-- Moveable Thursday	Ascension Day	Helatorstai	Kristi himmelfärds dag	39 days after Easter Sunday
UPDATE dim_calendar
SET hol_fi = TRUE
WHERE calc_western_ascension_thu = TRUE
AND NOT EXTRACT (YEAR FROM calendar_date) BETWEEN 1973 AND 2001
;
--  Ascension Day to the Saturday before the traditional Thursday
WITH cte AS (
    SELECT ( calendar_date  + INTERVAL '33 DAYS'   ) AS easter_mon_plus_33
    FROM dim_calendar 
    WHERE calc_western_easter_mon = TRUE
    AND EXTRACT( YEAR FROM calendar_date) BETWEEN 1973 AND 2001
)
UPDATE dim_calendar
SET hol_fi = TRUE
FROM cte
WHERE dim_calendar.calendar_date = cte.easter_mon_plus_33
; 



-- Moveable Sunday	Pentecost	Helluntaipäivä	Pingst	49 days after Easter Sunday
UPDATE dim_calendar
SET hol_fi = TRUE
WHERE calc_western_whit_sun = TRUE
;


-- Friday between 19 June and 25 June	Midsummer Eve	Juhannusaatto	Midsommarafton	Non-official
-- Non-business day in the Annual Holidays Act (162/2005) - holiday in some collective labor agreements
UPDATE dim_calendar
SET hol_fi = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) BETWEEN 19 AND 25
AND   EXTRACT( MONTH FROM calendar_date) = 6
AND   EXTRACT( YEAR FROM calendar_date) >= 1955 -- Defacto holiday before 1995
AND   EXTRACT( DOW  FROM calendar_date) = 5 -- Fri
; 


-- Saturday between 20 June and 26 June	Midsummer Day	Juhannuspäivä	Midsommardagen	Moved from 24 June
UPDATE dim_calendar
SET hol_fi = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) BETWEEN 20 AND 26
AND   EXTRACT( MONTH FROM calendar_date) = 6
AND   EXTRACT( YEAR FROM calendar_date) >= 1955 -- Defacto holiday before 1995
AND   EXTRACT( DOW  FROM calendar_date) = 6 -- Sat
; 


-- Saturday between 31 October and 6 November	All Saints' Day	Pyhäinpäivä	Alla helgons dag	Moved from 1 November
UPDATE dim_calendar
SET hol_fi = TRUE
WHERE (
(EXTRACT( DAY   FROM calendar_date) = 31 AND  EXTRACT( MONTH FROM calendar_date) = 10)
OR
(EXTRACT( DAY   FROM calendar_date) BETWEEN 1 AND 6 AND   EXTRACT( MONTH FROM calendar_date) = 11)
)
AND   EXTRACT( YEAR FROM calendar_date) >= 1955
AND   EXTRACT( DOW  FROM calendar_date) = 6 -- Sat
; 


-- 6 December	Independence Day	Itsenäisyyspäivä	Självständighetsdagen	 
UPDATE dim_calendar
SET hol_fi = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 6
AND   EXTRACT( MONTH FROM calendar_date) = 12
; 


-- 24 December	Christmas Eve	Jouluaatto	Julafton
-- Non-official – Non-business day in the Annual Holidays Act (162/2005) - holiday in some collective labor agreements
UPDATE dim_calendar
SET hol_fi = TRUE
WHERE calc_western_christmas_eve = TRUE
-- AND   EXTRACT( YEAR FROM calendar_date) >= 2005 -- Defacto holiday before 1995
; 


-- 25 December	Christmas Day	Joulupäivä	Juldagen	 
UPDATE dim_calendar
SET hol_fi = TRUE
WHERE calc_western_christmas = TRUE
; 


-- 26 December	St Stephen's Day	2. joulupäivä or tapaninpäivä	Annandag jul	 
UPDATE dim_calendar
SET hol_fi = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 26
AND   EXTRACT( MONTH FROM calendar_date) = 12
; 




COMMIT;
