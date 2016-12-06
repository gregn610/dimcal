-- Italy

BEGIN;

UPDATE dim_calendar
SET hol_it = FALSE
;


-- 1 January	New Year's Day	Capodanno	
UPDATE dim_calendar
SET hol_it = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 1
AND   EXTRACT( MONTH FROM calendar_date) = 1
; 


-- 6 January	Epiphany	Epifania	
UPDATE dim_calendar
SET hol_it = TRUE
WHERE calc_western_epiphany = TRUE
;


-- Monday after Easter	Easter Monday	Lunedì dell'Angelo, Lunedì in Albis or more commonly Pasquetta	
UPDATE dim_calendar
SET hol_it = TRUE
WHERE calc_western_easter_mon = TRUE
; 


-- 25 April	Liberation Day	Festa della Liberazione	Liberation of Italy from Nazi Germany, 1945
UPDATE dim_calendar
SET hol_it = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 25
AND   EXTRACT( MONTH FROM calendar_date) = 4
; 


-- 1 May	International Workers' Day	Festa del Lavoro (or Festa dei Lavoratori)	
UPDATE dim_calendar
SET hol_it = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 1
AND   EXTRACT( MONTH FROM calendar_date) = 5
; 


-- 2 June	Republic Day	Festa della Repubblica	Birth of the Italian Republic, 1946
UPDATE dim_calendar
SET hol_it = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 2
AND   EXTRACT( MONTH FROM calendar_date) = 6
; 


-- 15 August	Ferragosto/Assumption Day	Ferragosto and Assunzione	
UPDATE dim_calendar
SET hol_it = TRUE
WHERE calc_western_assumption = TRUE
;

; 


-- 1 November	All Saints' Day	Tutti i santi (or Ognissanti)	
UPDATE dim_calendar
SET hol_it = TRUE
WHERE calc_western_all_saints = TRUE
;



-- 8 December	Immaculate Conception	Immacolata Concezione (or just Immacolata)	
UPDATE dim_calendar
SET hol_it = TRUE
WHERE calc_western_immaculate_con = TRUE
; 


-- 25 December	Christmas Day	Natale	
UPDATE dim_calendar
SET hol_it = TRUE
WHERE calc_western_christmas = TRUE
; 


-- 26 December	St. Stephen's Day	Santo Stefano	
UPDATE dim_calendar
SET hol_it = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 26
AND   EXTRACT( MONTH FROM calendar_date) = 12
; 





COMMIT;
