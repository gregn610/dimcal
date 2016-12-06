BEGIN;

-- Canada nationwide statutory

UPDATE dim_calendar
SET hol_ca_nat = FALSE
;


-- January 1	New Year's Day	Jour de l'An	Celebrates the first day of every year in the Gregorian calendar.
UPDATE dim_calendar
SET hol_ca_nat = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 1
AND   EXTRACT( MONTH FROM calendar_date) = 1
;


-- Friday before Easter Day	Good Friday	Vendredi saint	Commemorates the crucifixion of Jesus. 
-- In Quebec, non-federally regulated employers must give either Good Friday or Easter Monday as a statutory holiday, though some give both days.
UPDATE dim_calendar
SET hol_ca_nat = TRUE
WHERE calc_western_good_fri = TRUE
;


-- July 1	Canada Day	Fête du Canada	Celebrates Canada's 1867 Confederation and establishment of dominion status.
-- In Newfoundland and Labrador, observed as Memorial Day.
UPDATE dim_calendar
SET hol_ca_nat = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 1
AND   EXTRACT( MONTH FROM calendar_date) = 7
;


-- First Monday in September	Labour Day	Fête du travail	Celebrates economic and social achievements of workers.
WITH cte AS (
    SELECT EXTRACT(YEAR FROM dc2.calendar_date) AS yr,
           MIN(calendar_date) AS first_mon_sep
           FROM dim_calendar AS dc2
           WHERE EXTRACT(MONTH FROM calendar_date) = 9
           AND EXTRACT(DOW FROM calendar_date) = 1
           GROUP BY EXTRACT(YEAR FROM dc2.calendar_date)
)
UPDATE dim_calendar
SET hol_ca_nat = TRUE
FROM cte
WHERE dim_calendar.calendar_date = cte.first_mon_sep
;


-- December 25	Christmas Day	Noël	Celebrates the nativity of Jesus.
UPDATE dim_calendar
SET hol_ca_nat = TRUE
WHERE calc_western_christmas = TRUE
;





COMMIT;
