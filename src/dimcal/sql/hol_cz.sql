-- Czech Republic

BEGIN;

UPDATE dim_calendar
SET hol_cz = FALSE
;


-- 1 January	Restoration Day of the Independent Czech State;
-- New Year's Day	Den obnovy samostatného českého státu; Nový rok	Czechoslovakia split into the Czech Republic and Slovakia.
UPDATE dim_calendar
SET hol_cz = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 1
AND   EXTRACT( MONTH FROM calendar_date) = 1
; 


-- March, April	Good Friday	Velký pátek	Good Friday is public holiday since 2016.
UPDATE dim_calendar
SET hol_cz = TRUE
WHERE calc_western_good_fri = TRUE
AND EXTRACT( YEAR FROM calendar_date) >= 2016
; 


-- March, April	Easter Monday	Velikonoční pondělí	
UPDATE dim_calendar
SET hol_cz = TRUE
WHERE calc_western_easter_mon = TRUE
; 


-- 1 May	Labour Day	Svátek práce	 
UPDATE dim_calendar
SET hol_cz = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 1
AND   EXTRACT( MONTH FROM calendar_date) = 5
; 


-- 8 May	Liberation Day	Den vítězství or Den osvobození	1945, the end of the European part of World War II
UPDATE dim_calendar
SET hol_cz = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 8
AND   EXTRACT( MONTH FROM calendar_date) = 5
; 


-- 5 July	Saints Cyril and Methodius Day	Den slovanských věrozvěstů Cyrila a Metoděje
UPDATE dim_calendar
SET hol_cz = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 5
AND   EXTRACT( MONTH FROM calendar_date) = 7
; 


-- 6 July	Jan Hus Day	Den upálení mistra Jana Husa	The religious reformer Jan Hus was burned at the stake in 1415.
UPDATE dim_calendar
SET hol_cz = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 6
AND   EXTRACT( MONTH FROM calendar_date) = 7
; 


-- 28 September	St. Wenceslas Day (Czech Statehood Day)	Den české státnosti	In 935, St. Wenceslas, Duke of Bohemia, now patron of the Czech State, was murdered by his brother.
UPDATE dim_calendar
SET hol_cz = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 28
AND   EXTRACT( MONTH FROM calendar_date) = 9
; 


-- 28 October	Independent Czechoslovak State Day	Den vzniku samostatného československého státu	Independence Day and Creation of Czechoslovakia in 1918.
UPDATE dim_calendar
SET hol_cz = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 28
AND   EXTRACT( MONTH FROM calendar_date) = 10
; 


-- 17 November	Struggle for Freedom and Democracy Day	Den boje za svobodu a demokracii	Commemorating the student demonstration against Nazi occupation in 1939, and the demonstration in 1989 that started the Velvet Revolution.
UPDATE dim_calendar
SET hol_cz = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 17
AND   EXTRACT( MONTH FROM calendar_date) = 11
; 


-- 24 December	Christmas Eve	Štědrý den	Christmas is celebrated during the evening of the 24th.
UPDATE dim_calendar
SET hol_cz = TRUE
WHERE calc_western_christmas_eve = TRUE
; 


-- 25 December	Christmas Day	1. svátek vánoční	 
UPDATE dim_calendar
SET hol_cz = TRUE
WHERE calc_western_christmas = TRUE
; 


-- 26 December	St. Stephen's Day (Czech: "The Second Christmas Day")	2. svátek vánoční	 
UPDATE dim_calendar
SET hol_cz = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 26
AND   EXTRACT( MONTH FROM calendar_date) = 12
; 





COMMIT;
