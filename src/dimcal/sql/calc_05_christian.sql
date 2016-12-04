-- Easter
BEGIN;

UPDATE dim_calendar
SET  calc_western_epiphany          = FALSE
    ,calc_western_clean_mon         = FALSE
    ,calc_western_annunciation      = FALSE
    ,calc_western_ash_wed           = FALSE
    ,calc_western_palm_sun          = FALSE
    ,calc_western_holy_thu          = FALSE
    ,calc_western_good_fri          = FALSE
    ,calc_western_easter_sat        = FALSE
    ,calc_western_easter_sun        = FALSE
    ,calc_western_easter_mon        = FALSE
    ,calc_western_all_saints        = FALSE
    ,calc_western_immaculate_con    = FALSE
    ,calc_western_christmas_eve     = FALSE
    ,calc_western_christmas         = FALSE
    ,calc_western_ascension_thu     = FALSE
    ,calc_western_assumption        = FALSE
    ,calc_western_whit_sun          = FALSE
    ,calc_western_whit_mon          = FALSE
    ,calc_western_corpuschristi_thu = FALSE
;

-- 6 January	Epiphany
UPDATE dim_calendar
SET calc_western_epiphany = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 6
AND   EXTRACT( MONTH FROM calendar_date) = 1
;

 -- Assumption
UPDATE dim_calendar
SET calc_western_assumption = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 15
AND   EXTRACT( MONTH FROM calendar_date) = 8
;


-- 1 November	All Saints' Day
UPDATE dim_calendar
SET calc_western_all_saints = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 1
AND   EXTRACT( MONTH FROM calendar_date) = 11
;

-- 8 December	Immaculate Conception
UPDATE dim_calendar
SET calc_western_immaculate_con = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 8
AND   EXTRACT( MONTH FROM calendar_date) = 12
;

-- Xmas eve
UPDATE dim_calendar
SET calc_western_christmas_eve = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 24
AND   EXTRACT( MONTH FROM calendar_date) = 12
;

-- Xmas
UPDATE dim_calendar
SET calc_western_christmas = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 25
AND   EXTRACT( MONTH FROM calendar_date) = 12
;


UPDATE dim_calendar SET calc_western_easter_sun = TRUE WHERE calendar_date = '1970-03-29';
UPDATE dim_calendar SET calc_western_easter_sun = TRUE WHERE calendar_date = '1971-04-11';
UPDATE dim_calendar SET calc_western_easter_sun = TRUE WHERE calendar_date = '1972-04-02';
UPDATE dim_calendar SET calc_western_easter_sun = TRUE WHERE calendar_date = '1973-04-22';
UPDATE dim_calendar SET calc_western_easter_sun = TRUE WHERE calendar_date = '1974-04-14';
UPDATE dim_calendar SET calc_western_easter_sun = TRUE WHERE calendar_date = '1975-03-30';
UPDATE dim_calendar SET calc_western_easter_sun = TRUE WHERE calendar_date = '1976-04-18';
UPDATE dim_calendar SET calc_western_easter_sun = TRUE WHERE calendar_date = '1977-04-10';
UPDATE dim_calendar SET calc_western_easter_sun = TRUE WHERE calendar_date = '1978-03-26';
UPDATE dim_calendar SET calc_western_easter_sun = TRUE WHERE calendar_date = '1979-04-15';
UPDATE dim_calendar SET calc_western_easter_sun = TRUE WHERE calendar_date = '1980-04-06';
UPDATE dim_calendar SET calc_western_easter_sun = TRUE WHERE calendar_date = '1981-04-19';
UPDATE dim_calendar SET calc_western_easter_sun = TRUE WHERE calendar_date = '1982-04-11';
UPDATE dim_calendar SET calc_western_easter_sun = TRUE WHERE calendar_date = '1983-04-03';
UPDATE dim_calendar SET calc_western_easter_sun = TRUE WHERE calendar_date = '1984-04-22';
UPDATE dim_calendar SET calc_western_easter_sun = TRUE WHERE calendar_date = '1985-04-07';
UPDATE dim_calendar SET calc_western_easter_sun = TRUE WHERE calendar_date = '1986-03-30';
UPDATE dim_calendar SET calc_western_easter_sun = TRUE WHERE calendar_date = '1987-04-19';
UPDATE dim_calendar SET calc_western_easter_sun = TRUE WHERE calendar_date = '1988-04-03';
UPDATE dim_calendar SET calc_western_easter_sun = TRUE WHERE calendar_date = '1989-03-26';
UPDATE dim_calendar SET calc_western_easter_sun = TRUE WHERE calendar_date = '1990-04-15';
UPDATE dim_calendar SET calc_western_easter_sun = TRUE WHERE calendar_date = '1991-03-31';
UPDATE dim_calendar SET calc_western_easter_sun = TRUE WHERE calendar_date = '1992-04-19';
UPDATE dim_calendar SET calc_western_easter_sun = TRUE WHERE calendar_date = '1993-04-11';
UPDATE dim_calendar SET calc_western_easter_sun = TRUE WHERE calendar_date = '1994-04-03';
UPDATE dim_calendar SET calc_western_easter_sun = TRUE WHERE calendar_date = '1995-04-16';
UPDATE dim_calendar SET calc_western_easter_sun = TRUE WHERE calendar_date = '1996-04-07';
UPDATE dim_calendar SET calc_western_easter_sun = TRUE WHERE calendar_date = '1997-03-30';
UPDATE dim_calendar SET calc_western_easter_sun = TRUE WHERE calendar_date = '1998-04-12';
UPDATE dim_calendar SET calc_western_easter_sun = TRUE WHERE calendar_date = '1999-04-04';
UPDATE dim_calendar SET calc_western_easter_sun = TRUE WHERE calendar_date = '2000-04-23';
UPDATE dim_calendar SET calc_western_easter_sun = TRUE WHERE calendar_date = '2001-04-15';
UPDATE dim_calendar SET calc_western_easter_sun = TRUE WHERE calendar_date = '2002-03-31';
UPDATE dim_calendar SET calc_western_easter_sun = TRUE WHERE calendar_date = '2003-04-20';
UPDATE dim_calendar SET calc_western_easter_sun = TRUE WHERE calendar_date = '2004-04-11';
UPDATE dim_calendar SET calc_western_easter_sun = TRUE WHERE calendar_date = '2005-03-27';
UPDATE dim_calendar SET calc_western_easter_sun = TRUE WHERE calendar_date = '2006-04-16';
UPDATE dim_calendar SET calc_western_easter_sun = TRUE WHERE calendar_date = '2007-04-08';
UPDATE dim_calendar SET calc_western_easter_sun = TRUE WHERE calendar_date = '2008-03-23';
UPDATE dim_calendar SET calc_western_easter_sun = TRUE WHERE calendar_date = '2009-04-12';
UPDATE dim_calendar SET calc_western_easter_sun = TRUE WHERE calendar_date = '2010-04-04';
UPDATE dim_calendar SET calc_western_easter_sun = TRUE WHERE calendar_date = '2011-04-24';
UPDATE dim_calendar SET calc_western_easter_sun = TRUE WHERE calendar_date = '2012-04-08';
UPDATE dim_calendar SET calc_western_easter_sun = TRUE WHERE calendar_date = '2013-03-31';
UPDATE dim_calendar SET calc_western_easter_sun = TRUE WHERE calendar_date = '2014-04-20';
UPDATE dim_calendar SET calc_western_easter_sun = TRUE WHERE calendar_date = '2015-04-05';
UPDATE dim_calendar SET calc_western_easter_sun = TRUE WHERE calendar_date = '2016-03-27';
UPDATE dim_calendar SET calc_western_easter_sun = TRUE WHERE calendar_date = '2017-04-16';
UPDATE dim_calendar SET calc_western_easter_sun = TRUE WHERE calendar_date = '2018-04-01';
UPDATE dim_calendar SET calc_western_easter_sun = TRUE WHERE calendar_date = '2019-04-21';
UPDATE dim_calendar SET calc_western_easter_sun = TRUE WHERE calendar_date = '2020-04-12';
UPDATE dim_calendar SET calc_western_easter_sun = TRUE WHERE calendar_date = '2021-04-04';
UPDATE dim_calendar SET calc_western_easter_sun = TRUE WHERE calendar_date = '2022-04-17';
UPDATE dim_calendar SET calc_western_easter_sun = TRUE WHERE calendar_date = '2023-04-09';
UPDATE dim_calendar SET calc_western_easter_sun = TRUE WHERE calendar_date = '2024-03-31';
UPDATE dim_calendar SET calc_western_easter_sun = TRUE WHERE calendar_date = '2025-04-20';
UPDATE dim_calendar SET calc_western_easter_sun = TRUE WHERE calendar_date = '2026-04-05';
UPDATE dim_calendar SET calc_western_easter_sun = TRUE WHERE calendar_date = '2027-03-28';
UPDATE dim_calendar SET calc_western_easter_sun = TRUE WHERE calendar_date = '2028-04-16';
UPDATE dim_calendar SET calc_western_easter_sun = TRUE WHERE calendar_date = '2029-04-01';
UPDATE dim_calendar SET calc_western_easter_sun = TRUE WHERE calendar_date = '2030-04-21';
UPDATE dim_calendar SET calc_western_easter_sun = TRUE WHERE calendar_date = '2031-04-13';
UPDATE dim_calendar SET calc_western_easter_sun = TRUE WHERE calendar_date = '2032-03-28';
UPDATE dim_calendar SET calc_western_easter_sun = TRUE WHERE calendar_date = '2033-04-17';
UPDATE dim_calendar SET calc_western_easter_sun = TRUE WHERE calendar_date = '2034-04-09';
UPDATE dim_calendar SET calc_western_easter_sun = TRUE WHERE calendar_date = '2035-03-25';
UPDATE dim_calendar SET calc_western_easter_sun = TRUE WHERE calendar_date = '2036-04-13';
UPDATE dim_calendar SET calc_western_easter_sun = TRUE WHERE calendar_date = '2037-04-05';



-- Clean Monday – date variable
-- Ash Monday. 48 Days before easter
WITH cte AS (
    SELECT ( calendar_date  - INTERVAL '48 DAYS'   ) AS easter_mon_minus_48
    FROM dim_calendar
    WHERE calc_western_easter_sun = TRUE
)
UPDATE dim_calendar
SET calc_western_clean_mon = TRUE
FROM cte
WHERE dim_calendar.calendar_date = cte.easter_mon_minus_48
;


-- Ash Wednesday. 46 Days before easter
WITH cte AS (
    SELECT ( calendar_date  - INTERVAL '46 DAYS'   ) AS easter_sun_minus_46
    FROM dim_calendar
    WHERE calc_western_easter_sun = TRUE
)
UPDATE dim_calendar
SET calc_western_ash_wed = TRUE
FROM cte
WHERE dim_calendar.calendar_date = cte.easter_sun_minus_46
;

-- Palm Sunday
WITH cte AS (
    SELECT ( calendar_date  - INTERVAL '7 DAYS'   ) AS easter_sun_minus_7
    FROM dim_calendar
    WHERE calc_western_easter_sun = TRUE
)
UPDATE dim_calendar
SET calc_western_palm_sun = TRUE
FROM cte
WHERE dim_calendar.calendar_date = cte.easter_sun_minus_7
;


-- Holy Thursday / Maundy Thursday
WITH cte AS (
    SELECT ( calendar_date  - INTERVAL '3 DAYS'   ) AS easter_sun_minus_3
    FROM dim_calendar
    WHERE calc_western_easter_sun = TRUE
)
UPDATE dim_calendar
SET calc_western_holy_thu = TRUE
FROM cte
WHERE dim_calendar.calendar_date = cte.easter_sun_minus_3
;

-- Good Friday
WITH cte AS (
    SELECT ( calendar_date  - INTERVAL '2 DAYS'   ) AS easter_sun_minus_2
    FROM dim_calendar
    WHERE calc_western_easter_sun = TRUE
)
UPDATE dim_calendar
SET calc_western_good_fri = TRUE
FROM cte
WHERE dim_calendar.calendar_date = cte.easter_sun_minus_2
;


-- Easter Sat
WITH cte AS (
    SELECT ( calendar_date  - INTERVAL '1 DAY'   ) AS easter_sun_minus_1
    FROM dim_calendar
    WHERE calc_western_easter_sun = TRUE
)
UPDATE dim_calendar
SET calc_western_easter_sat = TRUE
FROM cte
WHERE dim_calendar.calendar_date = cte.easter_sun_minus_1
;




-- Easter Mon
WITH cte AS (
    SELECT ( calendar_date  + INTERVAL '1 DAY'   ) AS easter_sun_plus_1
    FROM dim_calendar
    WHERE calc_western_easter_sun = TRUE
)
UPDATE dim_calendar
SET calc_western_easter_mon = TRUE
FROM cte
WHERE dim_calendar.calendar_date = cte.easter_sun_plus_1
;



-- Ascension	39 days after Easter	Onze Lieve Heer hemelvaart	Ascension	Christi Himmelfahrt
WITH cte AS (
    SELECT ( calendar_date  + INTERVAL '39 DAYS'   ) AS easter_sun_plus_39
    FROM dim_calendar 
    WHERE calc_western_easter_sun = TRUE
)
UPDATE dim_calendar
SET calc_western_ascension_thu = TRUE
FROM cte
WHERE dim_calendar.calendar_date = cte.easter_sun_plus_39
; 


-- Whit Sunday
WITH cte AS (
    SELECT ( calendar_date  + INTERVAL '49 DAYS'   ) AS easter_sun_plus_49
    FROM dim_calendar
    WHERE calc_western_easter_sun = TRUE
)
UPDATE dim_calendar
SET calc_western_whit_sun = TRUE
FROM cte
WHERE dim_calendar.calendar_date = cte.easter_sun_plus_49
;


-- Whit Monday or Pentecost Monday 
WITH cte AS (
    SELECT ( calendar_date  + INTERVAL '50 DAYS'   ) AS easter_sun_plus_50
    FROM dim_calendar 
    WHERE calc_western_easter_sun = TRUE
)
UPDATE dim_calendar
SET calc_western_whit_mon = TRUE
FROM cte
WHERE dim_calendar.calendar_date = cte.easter_sun_plus_50
; 



-- Corpus Christi Thursday 
WITH cte AS (
    SELECT ( calendar_date  + INTERVAL '60 DAYS'   ) AS easter_sun_plus_60
    FROM dim_calendar 
    WHERE calc_western_easter_sun = TRUE
)
UPDATE dim_calendar
SET calc_western_corpuschristi_thu = TRUE
FROM cte
WHERE dim_calendar.calendar_date = cte.easter_sun_plus_60
; 



COMMIT;

-- Unit test
--
-- select calc_western_good_fri,
--        calc_western_easter_mon,
--        to_char(calendar_date, 'Day yyyy-mm-dd')
-- from   dim_calendar
-- where  calc_western_good_fri = TRUE
-- or     calc_western_easter_mon = TRUE
-- ;
