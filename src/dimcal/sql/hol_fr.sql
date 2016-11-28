BEGIN;

UPDATE dim_calendar
SET hol_fr = FALSE
;

-- 1 January	New Year's Day	Nouvel an / Jour de l'an / Premier de l'an	
UPDATE dim_calendar
SET hol_fr = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 1
AND   EXTRACT( MONTH FROM calendar_date) = 1
;
-- moveable	Good Friday	Vendredi saint	Friday before Easter Sunday (observed only in Alsace and Moselle)
UPDATE dim_calendar
SET hol_fr = TRUE
WHERE calc_western_good_fri = TRUE
;


-- moveable	Easter Monday	Lundi de Pâques	Monday after Easter Sunday (one day after Easter Sunday)
UPDATE dim_calendar
SET hol_fr = TRUE
WHERE calc_western_easter_mon = TRUE
;


-- 1 May	May Day/Labour Day	Fête du Travail / Fête des Travailleurs	
UPDATE dim_calendar
SET hol_fr = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 1
AND   EXTRACT( MONTH FROM calendar_date) = 5 
;


-- 8 May	Victory in Europe Day	Fête de la Victoire	End of hostilities in Europe in World War II
UPDATE dim_calendar
SET hol_fr = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 8
AND   EXTRACT( MONTH FROM calendar_date) = 5 
;


-- moveable	Ascension Day	Ascension	Thursday, 39 days after Easter Sunday
WITH cte AS (
    SELECT ( calendar_date  + INTERVAL '38 DAYS'   ) AS easter_mon_plus_38
    FROM dim_calendar 
    WHERE calc_western_easter_mon = TRUE
)
UPDATE dim_calendar
SET hol_fr = TRUE
FROM cte
WHERE dim_calendar.calendar_date = cte.easter_mon_plus_38
; 


-- moveable	Whit Monday	Lundi de Pentecôte	Monday after Pentecost (50 days after Easter), observed only in some businesses, see notes
WITH cte AS (
    SELECT ( calendar_date  + INTERVAL '49 DAYS'   ) AS easter_mon_plus_49
    FROM dim_calendar 
    WHERE calc_western_easter_mon = TRUE
)
UPDATE dim_calendar
SET hol_fr = TRUE
FROM cte
WHERE dim_calendar.calendar_date = cte.easter_mon_plus_49
; 


-- 14 July	Bastille Day	Fête nationale	French National Day, commemorates the Feast of the Federation
UPDATE dim_calendar
SET hol_fr = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 14
AND   EXTRACT( MONTH FROM calendar_date) = 7 
;


-- 15 August	Assumption of Mary to Heaven	Assomption	
UPDATE dim_calendar
SET hol_fr = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 15
AND   EXTRACT( MONTH FROM calendar_date) = 8
;


-- 1 November	All Saints' Day	Toussaint	
UPDATE dim_calendar
SET hol_fr = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 1
AND   EXTRACT( MONTH FROM calendar_date) = 11 
;


-- 11 November	Armistice Day	Armistice de 1918	End of World War I
UPDATE dim_calendar
SET hol_fr = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 11
AND   EXTRACT( MONTH FROM calendar_date) = 11 
;


-- 25 December	Christmas Day	Noël	
UPDATE dim_calendar
SET hol_fr = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 25
AND   EXTRACT( MONTH FROM calendar_date) = 12 
;


-- 26 December	St. Stephen's Day	Saint-Étienne	Observed only in Alsace and Moselle
UPDATE dim_calendar
SET hol_fr = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 26
AND   EXTRACT( MONTH FROM calendar_date) = 12 
;




COMMIT;
