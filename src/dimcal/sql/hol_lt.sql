-- Lithuania

BEGIN;

UPDATE dim_calendar
SET hol_lt = FALSE
;


-- January 1	New Year's Day	Naujieji metai	 
UPDATE dim_calendar
SET hol_lt = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 1
AND   EXTRACT( MONTH FROM calendar_date) = 1
;


-- February 16	the Day of Restoration of the State of Lithuania (1918)	Lietuvos valstybės atkūrimo diena	 
UPDATE dim_calendar
SET hol_lt = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 16
AND   EXTRACT( MONTH FROM calendar_date) = 2
;


-- March 11	Day of Restoration of Independence of Lithuania (from the Soviet Union, 1990)	Lietuvos nepriklausomybės atkūrimo diena	
UPDATE dim_calendar
SET hol_lt = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 11
AND   EXTRACT( MONTH FROM calendar_date) = 3
AND   EXTRACT( YEAR  FROM calendar_date) >= 1990
;


-- The first Sunday after the full moon that occurs on or soonest after 21 March 
-- and following Monday	Easter	Velykos	Commemorates resurrection of Jesus
WITH cte AS (
    SELECT ( calendar_date  + INTERVAL '2 DAYS'   ) AS good_fri_plus_2
    FROM dim_calendar 
    WHERE calc_western_good_fri = TRUE
)
UPDATE dim_calendar
SET hol_lt = TRUE
FROM cte
WHERE dim_calendar.calendar_date = cte.good_fri_plus_2
; 
-- Easter Monday – date variable
UPDATE dim_calendar
SET hol_lt = TRUE
WHERE calc_western_easter_mon = TRUE
;


-- May 1	International Working Day	Tarptautinė darbo diena	 
UPDATE dim_calendar
SET hol_lt = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 1
AND   EXTRACT( MONTH FROM calendar_date) = 5
;


-- First Sunday in May	Mother's Day	Motinos diena	 
WITH cte AS (
    SELECT EXTRACT(YEAR FROM dc2.calendar_date) AS yr,
           MIN(calendar_date) AS first_sun_may
           FROM dim_calendar AS dc2
           WHERE EXTRACT(MONTH FROM calendar_date) = 5
           AND EXTRACT(DOW FROM calendar_date) = 0
           GROUP BY EXTRACT(YEAR FROM dc2.calendar_date)
)
UPDATE dim_calendar
SET hol_lt = TRUE
FROM cte
WHERE dim_calendar.calendar_date = cte.first_sun_may
;

-- First Sunday in June	Father's Day	Tėvo diena	 
WITH cte AS (
    SELECT EXTRACT(YEAR FROM dc2.calendar_date) AS yr,
           MIN(calendar_date) AS first_sun_jun
           FROM dim_calendar AS dc2
           WHERE EXTRACT(MONTH FROM calendar_date) = 6
           AND EXTRACT(DOW FROM calendar_date) = 0
           GROUP BY EXTRACT(YEAR FROM dc2.calendar_date)
)
UPDATE dim_calendar
SET hol_lt = TRUE
FROM cte
WHERE dim_calendar.calendar_date = cte.first_sun_jun
;


-- June 24	St. John's Day [Christian name], Day of Dew [original pagan name]	Joninės, Rasos	
UPDATE dim_calendar
SET hol_lt = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 24
AND   EXTRACT( MONTH FROM calendar_date) = 6
;


-- July 6	Statehood Day	Valstybės (Lietuvos karaliaus Mindaugo karūnavimo) diena
UPDATE dim_calendar
SET hol_lt = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 6
AND   EXTRACT( MONTH FROM calendar_date) = 7
;


-- August 15	Assumption Day	Žolinė (Švč. Mergelės Marijos ėmimo į dangų diena)	 
UPDATE dim_calendar
SET hol_lt = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 15
AND   EXTRACT( MONTH FROM calendar_date) = 8
;


-- November 1	All Saints' Day	Visų šventųjų diena	 
UPDATE dim_calendar
SET hol_lt = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 1
AND   EXTRACT( MONTH FROM calendar_date) = 11
;


-- December 24	Christmas Eve	Šv. Kūčios	 
UPDATE dim_calendar
SET hol_lt = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 24
AND   EXTRACT( MONTH FROM calendar_date) = 12
;


-- December 25 and 26	Christmas	Šv. Kalėdos	Commemorates birth of Jesus
UPDATE dim_calendar
SET hol_lt = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 25
AND   EXTRACT( MONTH FROM calendar_date) = 12
;




COMMIT;
