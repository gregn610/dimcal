-- Poland

BEGIN;

UPDATE dim_calendar
SET hol_pl = FALSE
;


-- January 1	New Year's Day	Nowy Rok (Nowy Rok)	
UPDATE dim_calendar
SET hol_pl = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 1
AND   EXTRACT( MONTH FROM calendar_date) = 1
;


-- January 6	Epiphany	Święto Trzech Króli (Trzech Króli)	in effect since 2011
UPDATE dim_calendar
SET hol_pl = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 6
AND   EXTRACT( MONTH FROM calendar_date) = 1
AND   EXTRACT( YEAR  FROM calendar_date) >= 2011
;


-- Sunday in Spring (movable)	Easter Sunday	pierwszy dzień Wielkiej Nocy (Niedziela Wielkanocna)	
WITH cte AS (
    SELECT ( calendar_date  + INTERVAL '2 DAYS'   ) AS good_fri_plus_2
    FROM dim_calendar 
    WHERE calc_western_good_fri = TRUE
)
UPDATE dim_calendar
SET hol_pl = TRUE
FROM cte
WHERE dim_calendar.calendar_date = cte.good_fri_plus_2
;


-- Monday following Easter Sunday	Easter Monday	drugi dzień Wielkiej Nocy (Poniedziałek Wielkanocny)	
UPDATE dim_calendar
SET hol_pl = TRUE
WHERE calc_western_easter_mon = TRUE
;


-- May 1	May Day	Święto Państwowe (Święto Pracy)	This holiday is officially called State Holiday (Święto Państwowe).
UPDATE dim_calendar
SET hol_pl = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 1
AND   EXTRACT( MONTH FROM calendar_date) = 5
;


-- May 3	Constitution Day	Święto Narodowe Trzeciego Maja (Święto Konstytucji Trzeciego Maja).	Post 1989
UPDATE dim_calendar
SET hol_pl = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 3
AND   EXTRACT( MONTH FROM calendar_date) = 5
AND   EXTRACT( YEAR  FROM calendar_date) > = 1989
;


-- 7th Sunday after Easter	Pentecost Sunday	pierwszy dzień Zielonych Świątek (Zielone Świątki)	
-- As this holiday always falls on a Sunday, it is not widely known that it is considered a non-working day, as all 
-- Sundays are already non-working days and holidays falling on Sunday don't give the right to another free day.
WITH cte AS (
    SELECT ( calendar_date 1 INTERVAL '1 DAY'   ) AS whit_mon_minus_1
    FROM dim_calendar 
    WHERE calc_western_whit_mon = TRUE
)
UPDATE dim_calendar
SET hol_pl = TRUE
FROM cte
WHERE dim_calendar.calendar_date = cte.whit_mon_minus_1
; 


-- 9th Thursday after Easter	Corpus Christi	dzień Bożego Ciała (Boże Ciało)	This is a Catholic church Holiday
UPDATE dim_calendar
SET hol_pl = TRUE
WHERE calc_western_corpuschristi_thu = TRUE
;


-- August 15	Assumption of the Blessed Virgin Mary	Wniebowzięcie Najświętszej Maryi Panny (Święto Wojska Polskiego or Święto Matki Boskiej Zielnej)
UPDATE dim_calendar
SET hol_pl = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 15
AND   EXTRACT( MONTH FROM calendar_date) = 8
;


-- November 1	All Saints' Day	Wszystkich Świętych (Dzień Zmarłych)	
UPDATE dim_calendar
SET hol_pl = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 1
AND   EXTRACT( MONTH FROM calendar_date) = 11
;


-- November 11	Independence Day	Narodowe Święto Niepodległości (Dzień Niepodległości)	
UPDATE dim_calendar
SET hol_pl = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 11
AND   EXTRACT( MONTH FROM calendar_date) = 11
;


-- December 25	Christmas Day	pierwszy dzień Bożego Narodzenia	
UPDATE dim_calendar
SET hol_pl = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 25
AND   EXTRACT( MONTH FROM calendar_date) = 12
;


-- December 26	Boxing Day	drugi dzień Bożego Narodzenia
UPDATE dim_calendar
SET hol_pl = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 26
AND   EXTRACT( MONTH FROM calendar_date) = 12
;



COMMIT;
