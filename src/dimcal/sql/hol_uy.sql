-- Uruguay

BEGIN;

UPDATE dim_calendar
SET hol_uy = FALSE
;


-- Only 5 of these holidays (January 1, May 1, July 18, August 25 and December 25) imply a mandatory paid leave for workers. 
-- Most of the other days are only observed by schools and some public sector offices.


-- January 1	New Year's Day	Año Nuevo
UPDATE dim_calendar
SET hol_uy = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 1
AND   EXTRACT( MONTH FROM calendar_date) = 1
;

-- -- January 6	Children's Day	Día de los Niños (Día de Reyes)
-- UPDATE dim_calendar
-- SET hol_uy = TRUE
-- WHERE EXTRACT( DAY   FROM calendar_date) = 6
-- AND   EXTRACT( MONTH FROM calendar_date) = 1
-- ;


-- -- moveable in late February or early March	Carnival	Carnaval	
-- WITH cte AS (
--   SELECT EXTRACT(YEAR FROM dc2.calendar_date) AS yr,
--     MIN(dc2.calendar_date - INTERVAL '63 DAYS') AS calc_septuagesima_sun,
--     MAX(dc2.calendar_date - INTERVAL '1 DAY') AS calc_shrove_tue
--   FROM dim_calendar AS dc2
--   WHERE dc2.calc_western_easter_sun = TRUE 
--   OR dc2.calc_western_ash_wed = TRUE
--   GROUP BY EXTRACT(YEAR FROM dc2.calendar_date)
-- )
-- UPDATE dim_calendar
-- SET hol_uy = TRUE
-- FROM cte
-- WHERE EXTRACT(YEAR from dim_calendar.calendar_date) = cte.yr
-- AND dim_calendar.calendar_date BETWEEN cte.calc_septuagesima_sun AND cte.calc_shrove_tue
-- ;



-- moveable in late March or early April	Tourism Week (in place of Christian Holy week)	Semana de Turismo (formerly Semana Santa)	
-- WITH cte AS (
--   SELECT EXTRACT(YEAR FROM dc2.calendar_date) AS yr,
--     MIN(dc2.calendar_date) AS calc_western_palm_sun,
--     MAX(dc2.calendar_date) AS calc_western_easter_sat
--   FROM dim_calendar AS dc2
--   WHERE dc2.calc_western_palm_sun = TRUE 
--   OR dc2.calc_western_easter_sat = TRUE
--   GROUP BY EXTRACT(YEAR FROM dc2.calendar_date)
-- )
-- UPDATE dim_calendar
-- SET hol_uy = TRUE
-- FROM cte
-- WHERE EXTRACT(YEAR from dim_calendar.calendar_date) = cte.yr
-- AND dim_calendar.calendar_date BETWEEN cte.calc_western_palm_sun AND cte.calc_western_easter_sat
-- ;

-- -- April 19	Landing of the 33 Patriots Day	Desembarco de los 33 Orientales	
-- UPDATE dim_calendar
-- SET hol_uy = TRUE
-- WHERE EXTRACT( DAY   FROM calendar_date) = 19
-- AND   EXTRACT( MONTH FROM calendar_date) = 4
-- ;


-- May 1	International Workers' Day	Día de los Trabajadores	
UPDATE dim_calendar
SET hol_uy = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 1
AND   EXTRACT( MONTH FROM calendar_date) = 5
;


-- -- May 18	Battle of Las Piedras	Batalla de las Piedras	
-- UPDATE dim_calendar
-- SET hol_uy = TRUE
-- WHERE EXTRACT( DAY   FROM calendar_date) = 18
-- AND   EXTRACT( MONTH FROM calendar_date) = 5
-- ;


-- -- June 19	Birthday of José Gervasio Artigas and Never Again Day	Natalicio de Artigas y Día del Nunca Más	
-- UPDATE dim_calendar
-- SET hol_uy = TRUE
-- WHERE EXTRACT( DAY   FROM calendar_date) = 19
-- AND   EXTRACT( MONTH FROM calendar_date) = 6
-- ;


-- July 18	Constitution Day	Jura de la Constitución	To commemorate the promulgation of the First Constitution of Uruguay in 1830
UPDATE dim_calendar
SET hol_uy = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 18
AND   EXTRACT( MONTH FROM calendar_date) = 7
;


-- August 25	Independence Day	Día de la Independencia	From the Empire of Brazil in 1825
UPDATE dim_calendar
SET hol_uy = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 25
AND   EXTRACT( MONTH FROM calendar_date) = 8
;


-- -- October 12	Day of the race (Columbus Day)	Día de la Raza	
-- UPDATE dim_calendar
-- SET hol_uy = TRUE
-- WHERE EXTRACT( DAY   FROM calendar_date) = 12
-- AND   EXTRACT( MONTH FROM calendar_date) = 10
-- ;


-- -- November 2	Deceased ones day	Día de los Difuntos	
-- UPDATE dim_calendar
-- SET hol_uy = TRUE
-- WHERE EXTRACT( DAY   FROM calendar_date) = 2
-- AND   EXTRACT( MONTH FROM calendar_date) = 11
-- ;


-- December 25	Day of the Family ( Christmas )	Día de la Familia (Navidad)	
UPDATE dim_calendar
SET hol_uy = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 25
AND   EXTRACT( MONTH FROM calendar_date) = 12
;



COMMIT;
