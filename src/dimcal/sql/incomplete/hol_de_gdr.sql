-- East Germany  German Democratic Republic 1949-1990

BEGIN;

UPDATE dim_calendar
SET hol_de_gdr = FALSE
;


-- New Year's Day	Neujahrstag	1 January
UPDATE dim_calendar
SET hol_de_gdr = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 1
AND   EXTRACT( MONTH FROM calendar_date) = 1
AND   EXTRACT( YEAR  FROM calendar_date) BETWEEN 1949 AND 1990
;




-- Good Friday	Karfreitag	Easter Sunday - 2d
UPDATE dim_calendar
SET hol_de_gdr = TRUE
WHERE calc_western_good_fri = TRUE
AND   EXTRACT( YEAR  FROM calendar_date) BETWEEN 1949 AND 1990
;


-- Easter Monday	Ostermontag	Easter Sunday + 1d
UPDATE dim_calendar
SET hol_de_gdr = TRUE
WHERE calc_western_easter_mon = TRUE
AND   (
    (EXTRACT( YEAR  FROM calendar_date) BETWEEN 1949 AND 1967) OR
    (EXTRACT( YEAR  FROM calendar_date) = 1990)
)
;


-- Labor Day	Tag der Arbeit	1 May
UPDATE dim_calendar
SET hol_de_gdr = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 1
AND   EXTRACT( MONTH FROM calendar_date) = 5
AND   EXTRACT( YEAR  FROM calendar_date) BETWEEN 1949 AND 1990
;


-- Day of Liberation
UPDATE dim_calendar
SET hol_de_gdr = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 1
AND   EXTRACT( MONTH FROM calendar_date) = 5
AND   (
    (EXTRACT( YEAR  FROM calendar_date) BETWEEN 1949 AND 1967) OR
    (EXTRACT( YEAR  FROM calendar_date) = 1985)
)
;


-- Day of Victory 	Tag des Sieges
UPDATE dim_calendar
SET hol_de_gdr = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 1
AND   EXTRACT( MONTH FROM calendar_date) = 5
AND   EXTRACT( YEAR  FROM calendar_date) = 1975
;

-- Ascension Day	Christi Himmelfahrt	Easter Sunday + 39d
UPDATE dim_calendar
SET hol_de_gdr = TRUE
WHERE calc_western_ascension_thu = TRUE
AND   (
    (EXTRACT( YEAR  FROM calendar_date) BETWEEN 1949 AND 1967) OR
    (EXTRACT( YEAR  FROM calendar_date) = 1990)
)
;


-- Whit Monday	Pfingstmontag	Easter Sunday + 50d
UPDATE dim_calendar
SET hol_de_gdr = TRUE
WHERE calc_western_whit_mon = TRUE
AND   EXTRACT( YEAR  FROM calendar_date) BETWEEN 1949 AND 1990
;


-- Day of the Republic 	Tag der Republik
UPDATE dim_calendar
SET hol_de_gdr = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 7
AND   EXTRACT( MONTH FROM calendar_date) = 10
AND   EXTRACT( YEAR  FROM calendar_date) BETWEEN 1949 AND 1990
;


-- Reformation Day
UPDATE dim_calendar
SET hol_de_gdr = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 31
AND   EXTRACT( MONTH FROM calendar_date) = 10
AND   EXTRACT( YEAR  FROM calendar_date) BETWEEN 1949 AND 1966
;


-- Repentance and Prayer Day (4)	Buß- und Bettag	Second Wednesday before the First Advent		(6)											Yes
--  it is the Wednesday that falls between 16th and 22nd November
UPDATE dim_calendar
SET hol_de_gdr = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) BETWEEN 16 AND 22
AND   EXTRACT( DOW   FROM calendar_date) = 3
AND   EXTRACT( MONTH FROM calendar_date) = 11
AND   EXTRACT( YEAR  FROM calendar_date) BETWEEN 1949 AND 1966
;


-- Christmas Day	Weihnachtstag	25 December
UPDATE dim_calendar
SET hol_de_gdr = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 25
AND   EXTRACT( MONTH FROM calendar_date) = 12
AND   EXTRACT( YEAR  FROM calendar_date) BETWEEN 1949 AND 1990
;


-- St Stephen's Day / Boxing Day	Zweiter Weihnachtsfeiertag	26 December
UPDATE dim_calendar
SET hol_de_gdr = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 26
AND   EXTRACT( MONTH FROM calendar_date) = 12
AND   EXTRACT( YEAR  FROM calendar_date) BETWEEN 1949 AND 1990
;


COMMIT;
