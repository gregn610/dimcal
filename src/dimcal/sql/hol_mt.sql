BEGIN;

UPDATE dim_calendar
SET hol_mt = FALSE
;

UPDATE dim_calendar
SET hol_mt = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 1
AND   EXTRACT( MONTH FROM calendar_date) = 1
;


-- -- National holidays
--
-- February 10 - Feast of Saint Paul, Patron Saint of Malta (Jum San Pawl)[1]
UPDATE dim_calendar
SET hol_mt = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 10
AND   EXTRACT( MONTH FROM calendar_date) = 2
;

-- March 31 - Freedom Day (Jum il-Ħelsien)
UPDATE dim_calendar
SET hol_mt = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 31
AND   EXTRACT( MONTH FROM calendar_date) = 3
;

-- June 7 - Sette Giugno
UPDATE dim_calendar
SET hol_mt = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 7
AND   EXTRACT( MONTH FROM calendar_date) = 6
;

-- September 8 - Victory Day (Jum il-Vitorja)
UPDATE dim_calendar
SET hol_mt = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 8
AND   EXTRACT( MONTH FROM calendar_date) = 9
;

-- September 21 - Independence Day (Jum l-Indipendenza)
UPDATE dim_calendar
SET hol_mt = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 21
AND   EXTRACT( MONTH FROM calendar_date) = 9
;

-- December 13 - Republic Day (Jum ir-Repubblika)
UPDATE dim_calendar
SET hol_mt = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 31
AND   EXTRACT( MONTH FROM calendar_date) = 12
;

--
-- -- Public holidays
--
-- January 1 - New Year's Day (L-Ewwel tas-Sena)
UPDATE dim_calendar
SET hol_mt = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 1
AND   EXTRACT( MONTH FROM calendar_date) = 1
;

-- February 10 - Feast of Saint Paul's Shipwreck in Malta (Nawfraġju ta' San Pawl) - the apostle is the patron saint of Malta
UPDATE dim_calendar
SET hol_mt = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 10
AND   EXTRACT( MONTH FROM calendar_date) = 2
;

-- March 19 - Feast of Saint Joseph (San Ġużepp)
UPDATE dim_calendar
SET hol_mt = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 19
AND   EXTRACT( MONTH FROM calendar_date) = 3
;

-- Friday before Easter - Good Friday (Il-Ġimgħa l-Kbira)
UPDATE dim_calendar
SET hol_mt = TRUE
WHERE calc_western_good_fri = TRUE
;

-- May 1 - Worker's Day (Jum il-Ħaddiem)
UPDATE dim_calendar
SET hol_mt = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 1
AND   EXTRACT( MONTH FROM calendar_date) = 5
;

-- June 29 - Feast of Saint Peter & Saint Paul, patron saints (L-Imnarja)
UPDATE dim_calendar
SET hol_mt = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 29
AND   EXTRACT( MONTH FROM calendar_date) = 6
;

-- August 15 - Feast of the Assumption of Our Lady (Santa Marija)
UPDATE dim_calendar
SET hol_mt = TRUE
WHERE calc_western_assumption = TRUE
;

-- December 8 - Feast of the Immaculate Conception (Il-Kunċizzjoni)
UPDATE dim_calendar
SET hol_mt = TRUE
WHERE calc_western_immaculate_con = TRUE
;

-- December 25 - Christmas Day (Il-Milied)
UPDATE dim_calendar
SET hol_mt = TRUE
WHERE calc_western_christmas = TRUE
;



COMMIT;