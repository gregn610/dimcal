BEGIN;

-- Canada AB

UPDATE dim_calendar
SET hol_ca_on = FALSE
;


-- Family Day	Fête de la famille
-- Second Monday in February	
WITH cte AS (
    SELECT EXTRACT(YEAR FROM dc2.calendar_date) AS yr,
           MIN(calendar_date) AS second_mon_feb
           FROM dim_calendar AS dc2
           WHERE EXTRACT(MONTH FROM calendar_date) = 2
           AND EXTRACT( DAY FROM calendar_date > 7
           AND EXTRACT( DOW FROM calendar_date) = 1
           GROUP BY EXTRACT(YEAR FROM dc2.calendar_date)
)
UPDATE dim_calendar
SET hol_ca_on = TRUE
FROM cte
WHERE dim_calendar.calendar_date = cte.second_mon_feb
;


-- Islander Day	Fête des Insulaires/Family Day	Fête de la famille/Heritage Day	Fête du Patrimoine
-- Third Monday in February	
WITH cte AS (
    SELECT EXTRACT(YEAR FROM dc2.calendar_date) AS yr,
           MIN(calendar_date) AS third_mon_feb
           FROM dim_calendar AS dc2
           WHERE EXTRACT(MONTH FROM calendar_date) = 2
           AND EXTRACT( DAY FROM calendar_date > 14
           AND EXTRACT( DOW FROM calendar_date) = 1
           GROUP BY EXTRACT(YEAR FROM dc2.calendar_date)
)
UPDATE dim_calendar
SET hol_ca_on = TRUE
FROM cte
WHERE dim_calendar.calendar_date = cte.third_mon_feb
;


-- Saint Patrick's Day	Jour de la Saint-Patrick
-- March 17	
UPDATE dim_calendar
SET hol_ca_on = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 17
AND   EXTRACT( MONTH FROM calendar_date) = 3
; 


-- Good Friday
UPDATE dim_calendar
SET hol_ca_on = TRUE
WHERE calc_western_good_fri = TRUE
; 


-- Monday after Easter Day	Easter Monday	Lundi de Pâques
UPDATE dim_calendar
SET hol_ca_on = TRUE
WHERE calc_western_easter_mon = TRUE
; 


-- April 23	Saint George's Day	Jour de St. George
UPDATE dim_calendar
SET hol_ca_on = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 23
AND   EXTRACT( MONTH FROM calendar_date) = 4
; 


-- Monday on or before May 24	Victoria Day	Fête de la Reine
-- 
-- 
-- July 12	Orangemen's Day	Fête des orangistes
UPDATE dim_calendar
SET hol_ca_on = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 12
AND   EXTRACT( MONTH FROM calendar_date) = 7
; 


-- First Monday in August	Civic Holiday	Premier lundi d'août
WITH cte AS (
    SELECT EXTRACT(YEAR FROM dc2.calendar_date) AS yr,
           MIN(calendar_date) AS first_mon_aug
           FROM dim_calendar AS dc2
           WHERE EXTRACT(MONTH FROM calendar_date) = 8
           AND EXTRACT( DOW FROM calendar_date) = 1
           GROUP BY EXTRACT(YEAR FROM dc2.calendar_date)
)
UPDATE dim_calendar
SET hol_ca_on = TRUE
FROM cte
WHERE dim_calendar.calendar_date = cte.first_mon_aug
;


-- Third Friday in August	Gold Cup Parade Day	Défilé de la Coupe d'or
WITH cte AS (
    SELECT EXTRACT(YEAR FROM dc2.calendar_date) AS yr,
           MIN(calendar_date) AS third_fri_aug
           FROM dim_calendar AS dc2
           WHERE EXTRACT(MONTH FROM calendar_date) = 8
           AND EXTRACT( DAY FROM calendar_date > 21
           AND EXTRACT( DOW FROM calendar_date) = 5
           GROUP BY EXTRACT(YEAR FROM dc2.calendar_date)
)
UPDATE dim_calendar
SET hol_ca_on = TRUE
FROM cte
WHERE dim_calendar.calendar_date = cte.third_fri_aug
;


-- Third Monday in August	Discovery Day	Jour de la Découverte
WITH cte AS (
    SELECT EXTRACT(YEAR FROM dc2.calendar_date) AS yr,
           MIN(calendar_date) AS third_mon_aug
           FROM dim_calendar AS dc2
           WHERE EXTRACT(MONTH FROM calendar_date) = 8
           AND EXTRACT( DAY FROM calendar_date > 21
           AND EXTRACT( DOW FROM calendar_date) = 1
           GROUP BY EXTRACT(YEAR FROM dc2.calendar_date)
)
UPDATE dim_calendar
SET hol_ca_on = TRUE
FROM cte
WHERE dim_calendar.calendar_date = cte.third_mon_aug
;


-- November 11	Armistice Day	Jour de l'Armistice
UPDATE dim_calendar
SET hol_ca_on = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 11
AND   EXTRACT( MONTH FROM calendar_date) = 11
; 


-- December 26	Boxing Day	Lendemain de Noël
UPDATE dim_calendar
SET hol_ca_on = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 26
AND   EXTRACT( MONTH FROM calendar_date) = 12
; 

COMMIT;
