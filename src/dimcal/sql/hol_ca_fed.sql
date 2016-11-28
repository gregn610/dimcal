BEGIN;
-- Canada federal

UPDATE dim_calendar
SET hol_ca_fed = FALSE
;


-- Monday after Easter Day
-- In lieu of Good Friday (Stat Holiday), 	Easter Monday	Lundi de Pâques
UPDATE dim_calendar
SET hol_ca_fed = TRUE
WHERE calc_western_easter_mon = TRUE
;


-- Victoria Day
-- Monday on or before May 24		Fête de la Reine ou Journée nationale des Patriotes
UPDATE dim_calendar
SET hol_ca_fed = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 24
AND   EXTRACT( MONTH FROM calendar_date) = 5 
;


-- August Civic Holiday	
-- First Monday in August	Premier lundi d'août
WITH cte AS (
    SELECT EXTRACT(YEAR FROM dc2.calendar_date) AS yr,
           MIN(calendar_date) AS first_mon_aug
           FROM dim_calendar AS dc2
           WHERE EXTRACT(MONTH FROM calendar_date) = 8
           AND EXTRACT(DOW FROM calendar_date) = 1
           GROUP BY EXTRACT(YEAR FROM dc2.calendar_date)
)
UPDATE dim_calendar
SET hol_ca_fed = TRUE
FROM cte
WHERE dim_calendar.calendar_date = cte.first_mon_aug
;




-- Thanksgiving	
-- Second Monday in October	Action de grâce
WITH cte AS (
    SELECT EXTRACT(YEAR FROM dc2.calendar_date) AS yr,
           MIN(calendar_date) AS second_mon_oct
           FROM dim_calendar AS dc2
           WHERE EXTRACT(MONTH FROM calendar_date) = 10
           AND EXTRACT( DAY FROM calendar_date ) > 7
           AND EXTRACT( DOW FROM calendar_date) = 1
           GROUP BY EXTRACT(YEAR FROM dc2.calendar_date)
)
UPDATE dim_calendar
SET hol_ca_fed = TRUE
FROM cte
WHERE dim_calendar.calendar_date = cte.second_mon_oct
;



-- Remembrance Day
-- November 11		Jour du Souvenir	
UPDATE dim_calendar
SET hol_ca_fed = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 11
AND   EXTRACT( MONTH FROM calendar_date) = 11 
;


-- Boxing Day
-- December 26		
UPDATE dim_calendar
SET hol_ca_fed = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 26
AND   EXTRACT( MONTH FROM calendar_date) = 12 
;


COMMIT;
