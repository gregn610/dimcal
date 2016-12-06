-- Croatia


BEGIN;



-- January 1	New Year's Day	Nova Godina	
UPDATE dim_calendar
SET hol_hr = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 1
AND   EXTRACT( MONTH FROM calendar_date) = 1
; 

-- January 6	Epiphany	Bogojavljenje, Sveta tri kralja	
UPDATE dim_calendar
SET hol_hr = TRUE
WHERE calc_western_epiphany = TRUE
;

-- Easter and the day after	Easter and Easter Monday	Uskrs i uskrsni ponedjeljak	variable date
UPDATE dim_calendar
SET hol_hr = TRUE
WHERE calc_western_easter_mon = TRUE
; 

-- May 1	International Workers' Day	Međunarodni praznik rada	
UPDATE dim_calendar
SET hol_hr = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 1
AND   EXTRACT( MONTH FROM calendar_date) = 5
; 

-- 60 days post Easter	Corpus Christi	Tijelovo	variable date
UPDATE dim_calendar
SET hol_hr = TRUE
WHERE calc_western_corpuschristi_thu = TRUE
; 

-- June 22	Anti-Fascist Struggle Day	Dan antifašističke borbe	
UPDATE dim_calendar
SET hol_hr = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 22
AND   EXTRACT( MONTH FROM calendar_date) = 6
; 

-- June 25	Statehood Day	Dan državnosti	
UPDATE dim_calendar
SET hol_hr = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 25
AND   EXTRACT( MONTH FROM calendar_date) = 6
; 

-- August 5	Victory and Homeland Thanksgiving Day and the Day of Croatian defenders	Dan pobjede i domovinske zahvalnosti i Dan hrvatskih branitelja	
UPDATE dim_calendar
SET hol_hr = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 5
AND   EXTRACT( MONTH FROM calendar_date) = 8
; 

-- August 15	Assumption of Mary	Velika Gospa	
UPDATE dim_calendar
SET hol_hr = TRUE
WHERE calc_western_assumption = TRUE
;

; 

-- October 8	Independence Day	Dan neovisnosti	
UPDATE dim_calendar
SET hol_hr = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 8
AND   EXTRACT( MONTH FROM calendar_date) = 10
; 

-- November 1	All Saints' Day	Dan svih svetih	
UPDATE dim_calendar
SET hol_hr = TRUE
WHERE calc_western_all_saints = TRUE
;


-- December 25	Christmas	Božić	
UPDATE dim_calendar
SET hol_hr = TRUE
WHERE calc_western_christmas = TRUE
; 

-- December 26	St. Stephen's Day	Prvi dan po Božiću, Sveti Stjepan, Štefanje	
UPDATE dim_calendar
SET hol_hr = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 26
AND   EXTRACT( MONTH FROM calendar_date) = 12
; 


COMMIT;

