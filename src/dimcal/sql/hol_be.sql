BEGIN;


UPDATE dim_calendar
SET hol_be = FALSE
;

-- New Year's Day	January 1	Nieuwjaar	Nouvel An	Neujahr
UPDATE dim_calendar
SET hol_be = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 1
AND   EXTRACT( MONTH FROM calendar_date) = 1
; 

-- Easter Monday	Monday after Easter	Paasmaandag	Lundi de Pâques	Ostermontag
UPDATE dim_calendar
SET hol_be = TRUE
WHERE calc_western_easter_mon = TRUE
; 

-- Labour Day	May 1	Dag van de arbeid	Fête du Travail	Tag der Arbeit
UPDATE dim_calendar
SET hol_be = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 1
AND   EXTRACT( MONTH FROM calendar_date) = 5
; 

-- Ascension	39 days after Easter	Onze Lieve Heer hemelvaart	Ascension	Christi Himmelfahrt
WITH cte AS (
    SELECT calendar_date  + INTERVAL '38' DAYS AS easter_mon_plus_38
    FROM dim_calendar 
    WHERE calc_western_easter_mon = TRUE
)
UPDATE dim_calendar
SET hol_be = TRUE
FROM cte
WHERE dim_calendar.calendar_date = cte.easter_mon_plus_38
; 

-- Pentecost Monday	Monday after Pentecost	Pinkstermaandag	Lundi de Pentecôte	Pfingstmontag
UPDATE dim_calendar
SET hol_be = TRUE
WHERE calc_western_whit_mon = TRUE;
; 

-- Belgian National Day	July 21	Nationale feestdag	Fête nationale	Nationalfeiertag
UPDATE dim_calendar
SET hol_be = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 21
AND   EXTRACT( MONTH FROM calendar_date) = 7
; 

-- Assumption of Mary	August 15	Onze Lieve Vrouw hemelvaart	Assomption	Mariä Himmelfahrt
UPDATE dim_calendar
SET hol_be = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 15
AND   EXTRACT( MONTH FROM calendar_date) = 8
; 

-- All Saints' Day	November 1	Allerheiligen	Toussaint	Allerheiligen
UPDATE dim_calendar
SET hol_be = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 1
AND   EXTRACT( MONTH FROM calendar_date) = 11
; 

-- Armistice Day	November 11	Wapenstilstand	Jour de l'Armistice	Waffenstillstand
UPDATE dim_calendar
SET hol_be = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 11
AND   EXTRACT( MONTH FROM calendar_date) = 11
; 

-- Christmas	December 25	Kerstmis	Noël	Weihnachten
UPDATE dim_calendar
SET hol_be = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 25
AND   EXTRACT( MONTH FROM calendar_date) = 12
; 

COMMIT;
