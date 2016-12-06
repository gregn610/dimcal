BEGIN;

-- Bulgaria

UPDATE dim_calendar
SET hol_bg = FALSE
;



-- 1 January	New Year's Day	Нова година	 
UPDATE dim_calendar
SET hol_bg = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 1
AND   EXTRACT( MONTH FROM calendar_date) = 1
; 

-- 3 March	Liberation Day	Ден на Освобождението на България от османско робство !	See Liberation of Bulgaria.
UPDATE dim_calendar
SET hol_bg = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 3
AND   EXTRACT( MONTH FROM calendar_date) = 3
;

-- Moveable	Easter	Велики петък, Велика събота и Великден	The Sunday and Monday of Easter are non-working days.
UPDATE dim_calendar
SET hol_bg = TRUE
WHERE calc_western_easter_mon = TRUE
;

-- 1 May	International Workers' Day	Ден на труда и на международната работническа солидарност	 
UPDATE dim_calendar
SET hol_bg = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 1
AND   EXTRACT( MONTH FROM calendar_date) = 5
;

-- 6 May	Saint George's Day	Гергьовден, ден на храбростта и Българската армия	 
UPDATE dim_calendar
SET hol_bg = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 6
AND   EXTRACT( MONTH FROM calendar_date) = 5
;

-- 24 May	Saints Cyril and Methodius Day	Ден на българската просвета и култура и на славянската писменост	 
UPDATE dim_calendar
SET hol_bg = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 24
AND   EXTRACT( MONTH FROM calendar_date) = 5
;

-- 6 September	Unification Day	Ден на Съединението	See Bulgarian unification.
UPDATE dim_calendar
SET hol_bg = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 6
AND   EXTRACT( MONTH FROM calendar_date) = 9
;

-- 22 September	Independence Day	Ден на независимостта на България	See Bulgarian Declaration of Independence.
UPDATE dim_calendar
SET hol_bg = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 22
AND   EXTRACT( MONTH FROM calendar_date) = 9
;

-- 1 November	National Awakening Day	Ден на народните будители	Non-attendance day for schools, otherwise a working day.
UPDATE dim_calendar
SET hol_bg = TRUE
WHERE calc_western_all_saints = TRUE
;


-- 24 December	Christmas Eve	Бъдни вечер	 
UPDATE dim_calendar
SET hol_bg = TRUE
WHERE calc_western_christmas_eve = TRUE
;

-- 25 & 26 December	Christmas	Рождество Христово	The Bulgarians have two days of Christmas, both called Christmas Day.
UPDATE dim_calendar
SET hol_bg = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) IN (25, 26)
AND   EXTRACT( MONTH FROM calendar_date) = 12
;





COMMIT;
