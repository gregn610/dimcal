-- Luxembourg

BEGIN;

UPDATE dim_calendar
SET hol_lu = FALSE
;


-- 1 January	New Year's Day	Neijoerschdag	Neujahr	Jour de l'an	
UPDATE dim_calendar
SET hol_lu = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 1
AND   EXTRACT( MONTH FROM calendar_date) = 1
;


-- movable	Easter Monday	Ouschterméindeg	Ostermontag	Lundi de Pâques	6 April in 2015
UPDATE dim_calendar
SET hol_lu = TRUE
WHERE calc_western_easter_mon = TRUE
;


-- 1 May	Labour Day	Dag vun der Aarbecht	Tag der Arbeit	Fête du Travail	
UPDATE dim_calendar
SET hol_lu = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 1
AND   EXTRACT( MONTH FROM calendar_date) = 5
;


-- movable	Ascension	Christi Himmelfaart	Christi Himmelfahrt	Ascension	14 May in 2015
UPDATE dim_calendar
SET hol_lu = TRUE
WHERE calc_western_ascension_thu = TRUE
; 


-- movable	Whit Monday	Péngschtméindeg	Pfingstmontag	Lundi de Pentecôte	25 May in 2015
UPDATE dim_calendar
SET hol_lu = TRUE
WHERE calc_western_whit_mon = TRUE
;


-- 23 June	National Holiday (Sovereign's birthday)	Nationalfeierdag / Groussherzogsgebuertsdag / Gehaansdag	Nationalfeiertag	Fête nationale	
--  If June 23 is a Sunday, the celebration is moved to Monday June 24
UPDATE dim_calendar
SET hol_lu = TRUE
WHERE (
(   EXTRACT( DOW   FROM calendar_date) > 0
AND EXTRACT( DAY   FROM calendar_date) = 23
AND EXTRACT( MONTH FROM calendar_date) = 6)
OR
(   EXTRACT( DOW   FROM calendar_date) = 0
AND EXTRACT( DAY   FROM calendar_date) = 24
AND EXTRACT( MONTH FROM calendar_date) = 6)
)
;


-- 15 August	Assumption	Léiffrawëschdag / Mariä Himmelfaart	Maria Himmelfahrt	Assomption	
UPDATE dim_calendar
SET hol_lu = TRUE
WHERE calc_western_assumption = TRUE
;


-- 1 November	All Saint's Day	Allerhellgen	Allerheiligen	Toussaint	
UPDATE dim_calendar
SET hol_lu = TRUE
WHERE calc_western_all_saints = TRUE
;



-- 25 December	Christmas Day	Chrëschtdag	Weihnachten	Noël	
UPDATE dim_calendar
SET hol_lu = TRUE
WHERE calc_western_christmas = TRUE
;


-- 26 December	St. Stephen's Day / Boxing Day	Stiefesdag	Zweiter Weihnachtsfeiertag	St.Etienne	
UPDATE dim_calendar
SET hol_lu = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 26
AND   EXTRACT( MONTH FROM calendar_date) = 12
;



COMMIT;
