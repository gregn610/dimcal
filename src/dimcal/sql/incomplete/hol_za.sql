-- South Africa

BEGIN;

UPDATE dim_calendar
SET hol_za = FALSE;


-- 1 January	New Year's Day	1910
UPDATE dim_calendar
SET hol_za = TRUE
WHERE EXTRACT( DAY   FROM calendar_date ) = 1
AND   EXTRACT( MONTH FROM calendar_date ) = 1
AND   EXTRACT( YEAR  FROM calendar_date ) >= 1910
;


-- 21 March	Human Rights Day	1990[2]
UPDATE dim_calendar
SET hol_za = TRUE
WHERE EXTRACT( DAY   FROM calendar_date ) = 21
AND   EXTRACT( MONTH FROM calendar_date ) = 3
AND   EXTRACT( YEAR  FROM calendar_date ) >= 1990
;


-- The Friday before Easter Sunday	Good Friday	1910
UPDATE dim_calendar
SET hol_za = TRUE
WHERE calc_western_good_fri = TRUE
AND   EXTRACT( YEAR  FROM calendar_date ) >= 1910
;


-- The Monday following Easter Sunday	Family Day	1910
UPDATE dim_calendar
SET hol_za = TRUE
WHERE calc_western_easter_mon = TRUE
AND   EXTRACT( YEAR  FROM calendar_date ) >= 1910
;


-- 27 April	Freedom Day	1994[2]
UPDATE dim_calendar
SET hol_za = TRUE
WHERE EXTRACT( DAY   FROM calendar_date ) = 24
AND   EXTRACT( MONTH FROM calendar_date ) = 4
AND   EXTRACT( YEAR  FROM calendar_date ) >= 1994
;


-- 1 May	Workers' Day	1910[3]
UPDATE dim_calendar
SET hol_za = TRUE
WHERE EXTRACT( DAY   FROM calendar_date ) = 1
AND   EXTRACT( MONTH FROM calendar_date ) = 5
AND   EXTRACT( YEAR  FROM calendar_date ) >= 1910
;


-- 16 June	Youth Day	1995[4]
UPDATE dim_calendar
SET hol_za = TRUE
WHERE EXTRACT( DAY   FROM calendar_date ) = 16
AND   EXTRACT( MONTH FROM calendar_date ) = 6
AND   EXTRACT( YEAR  FROM calendar_date ) >= 1995
;


-- 9 August	National Women's Day	1995[5]
UPDATE dim_calendar
SET hol_za = TRUE
WHERE EXTRACT( DAY   FROM calendar_date ) = 9
AND   EXTRACT( MONTH FROM calendar_date ) = 8
AND   EXTRACT( YEAR  FROM calendar_date ) >= 1995
;


-- 24 September	Heritage Day	1995[6]
UPDATE dim_calendar
SET hol_za = TRUE
WHERE EXTRACT( DAY   FROM calendar_date ) = 24
AND   EXTRACT( MONTH FROM calendar_date ) = 9
AND   EXTRACT( YEAR  FROM calendar_date ) >= 1995
;


-- 16 December	Day of Reconciliation	1995 / Dingaan's Day /Day of the Covenant /Day of the Vow/ Day of Reconciliation
UPDATE dim_calendar
SET hol_za = TRUE
WHERE EXTRACT( DAY   FROM calendar_date ) = 16
AND   EXTRACT( MONTH FROM calendar_date ) = 12
AND   EXTRACT( YEAR  FROM calendar_date ) >= 1910
;


-- 25 December	Christmas Day	1910
UPDATE dim_calendar
SET hol_za = TRUE
WHERE calc_western_christmas = TRUE
AND   EXTRACT( YEAR  FROM calendar_date ) >= 1910
;


-- 26 December	Day of Goodwill (formerly Boxing Day)	1910
UPDATE dim_calendar
SET hol_za = TRUE
WHERE EXTRACT( DAY   FROM calendar_date ) = 26
AND   EXTRACT( MONTH FROM calendar_date ) = 12
AND   EXTRACT( YEAR  FROM calendar_date ) >= 1910
;


-- The Public Holidays Act (Act No 36 of 1994)[7] states that whenever a public holiday falls on a Sunday, 
-- the Monday following it will be a public holiday.
WITH cte AS (
    SELECT calendar_date AS sunday_hol,
           calendar_date + INTERNVAL '1 DAY' as following_mon
           FROM dim_calendar AS dc2
           WHERE hol_za = TRUE
           AND EXTRACT(YEAR FROM calendar_date) >= 1994
           AND EXTRACT(DOW FROM calendar_date) = 1
)
UPDATE dim_calendar
SET hol_za = TRUE
FROM cte
WHERE dim_calendar.calendar_date = cte.following_mon
;


-- Since 1994 election days have been declared ad hoc public holidays:

-- National and provincial government elections – 2 June 1999[8]
UPDATE dim_calendar
SET hol_za = TRUE
WHERE EXTRACT( DAY   FROM calendar_date ) = 2
AND   EXTRACT( MONTH FROM calendar_date ) = 6
AND   EXTRACT( YEAR  FROM calendar_date ) = 1999
;


-- National and provincial government elections – 14 April 2004[9]
UPDATE dim_calendar
SET hol_za = TRUE
WHERE EXTRACT( DAY   FROM calendar_date ) = 14
AND   EXTRACT( MONTH FROM calendar_date ) = 4
AND   EXTRACT( YEAR  FROM calendar_date ) = 2004
;


-- Local government elections – 1 March 2006[10]
UPDATE dim_calendar
SET hol_za = TRUE
WHERE EXTRACT( DAY   FROM calendar_date ) = 1
AND   EXTRACT( MONTH FROM calendar_date ) = 3
AND   EXTRACT( YEAR  FROM calendar_date ) = 2006
;


-- National and provincial government elections – 22 April 2009[11]
UPDATE dim_calendar
SET hol_za = TRUE
WHERE EXTRACT( DAY   FROM calendar_date ) = 22
AND   EXTRACT( MONTH FROM calendar_date ) = 4
AND   EXTRACT( YEAR  FROM calendar_date ) = 2009
;


-- Local government elections – 18 May 2011[12]
UPDATE dim_calendar
SET hol_za = TRUE
WHERE EXTRACT( DAY   FROM calendar_date ) = 18
AND   EXTRACT( MONTH FROM calendar_date ) = 5
AND   EXTRACT( YEAR  FROM calendar_date ) = 2011
;


-- National and provincial government elections – 7 May 2014[13]
UPDATE dim_calendar
SET hol_za = TRUE
WHERE EXTRACT( DAY   FROM calendar_date ) = 7
AND   EXTRACT( MONTH FROM calendar_date ) = 5
AND   EXTRACT( YEAR  FROM calendar_date ) = 2014
;


-- Local government elections – 3 August 2016[14]
UPDATE dim_calendar
SET hol_za = TRUE
WHERE EXTRACT( DAY   FROM calendar_date ) = 3
AND   EXTRACT( MONTH FROM calendar_date ) = 8
AND   EXTRACT( YEAR  FROM calendar_date ) = 2016
;


-- 31 December 1999 and 2 January 2000 were declared public holidays to accommodate the Y2K changeover, 
-- and 3 January 2000 was automatically a public holiday because the previous holiday was a Sunday.[15]
UPDATE dim_calendar
SET hol_za = TRUE
WHERE EXTRACT( DAY   FROM calendar_date ) = 31
AND   EXTRACT( MONTH FROM calendar_date ) = 12
AND   EXTRACT( YEAR  FROM calendar_date ) = 1999
;
UPDATE dim_calendar
SET hol_za = TRUE
WHERE EXTRACT( DAY   FROM calendar_date ) IN (2,3)
AND   EXTRACT( MONTH FROM calendar_date ) = 1
AND   EXTRACT( YEAR  FROM calendar_date ) = 2000
;


-- 2 May 2008 was declared a public holiday when Human Rights Day and Good Friday coincided on 21 March 2008.[16]
UPDATE dim_calendar
SET hol_za = TRUE
WHERE EXTRACT( DAY   FROM calendar_date ) = 2
AND   EXTRACT( MONTH FROM calendar_date ) = 5
AND   EXTRACT( YEAR  FROM calendar_date ) = 2008
;


-- 27 December 2011 was declared a holiday by (acting) president Kgalema Motlanthe
UPDATE dim_calendar
SET hol_za = TRUE
WHERE EXTRACT( DAY   FROM calendar_date ) = 27
AND   EXTRACT( MONTH FROM calendar_date ) = 12
AND   EXTRACT( YEAR  FROM calendar_date ) = 2011
;


-- Historical public holidays
-- 1 January	New Year's Day	1910–present
-- The Friday before Easter Sunday	Good Friday	1910–present
-- The Monday following Easter Sunday	Easter Monday / Family Day 1910–1979 / 1980–present
-- 6 April	Van Riebeeck's Day
UPDATE dim_calendar
SET hol_za = TRUE
WHERE EXTRACT( DAY   FROM calendar_date ) = 6
AND   EXTRACT( MONTH FROM calendar_date ) = 5
AND   EXTRACT( YEAR  FROM calendar_date ) BETWEEN 1952 AND 1974
;
-- Founder's Day
UPDATE dim_calendar
SET hol_za = TRUE
WHERE EXTRACT( DAY   FROM calendar_date ) = 6
AND   EXTRACT( MONTH FROM calendar_date ) = 5
AND   EXTRACT( YEAR  FROM calendar_date ) BETWEEN 1982 AND 1994
;


-- 1st Friday in May	Workers' Day	1987–1989
WITH cte AS (
    SELECT EXTRACT(YEAR FROM dc2.calendar_date) AS yr,
           MIN(calendar_date) AS first_fri_may
           FROM dim_calendar AS dc2
           WHERE EXTRACT(MONTH FROM calendar_date) = 5
           AND   EXTRACT(DOW   FROM calendar_date) = 5
           AND   EXTRACT(YEAR  FROM calendar_date) BETWEEN 1987 AND 1989
           GROUP BY EXTRACT(YEAR FROM dc2.calendar_date)
)
UPDATE dim_calendar
SET hol_za = TRUE
FROM cte
WHERE dim_calendar.calendar_date = cte.first_fri_may
;


-- 1 May	Workers' Day	1990–present

-- 40th day after Easter	Ascension Day	1910–1993
UPDATE dim_calendar
SET hol_za = TRUE
WHERE calc_western_ascension_thu = TRUE
AND   EXTRACT( YEAR  FROM calendar_date ) BETWEEN 1910 AND 1993
;

-- 24 May	Victoria Day / Empire Day	1910–1951
UPDATE dim_calendar
SET hol_za = TRUE
WHERE EXTRACT( DAY   FROM calendar_date ) = 24
AND   EXTRACT( MONTH FROM calendar_date ) = 5
AND   EXTRACT( YEAR  FROM calendar_date ) BETWEEN 1910 AND 1951
;


-- 31 May	Union Day / Republic Day
UPDATE dim_calendar
SET hol_za = TRUE
WHERE EXTRACT( DAY   FROM calendar_date ) = 31
AND   EXTRACT( MONTH FROM calendar_date ) = 5
AND   EXTRACT( YEAR  FROM calendar_date ) BETWEEN 1910 AND 1993
;


-- 2nd Monday in July	Queen's Birthday	1952–1960
WITH cte AS (
    SELECT EXTRACT(YEAR FROM dc2.calendar_date) AS yr,
           MIN(calendar_date) AS second_mon_jul
           FROM dim_calendar AS dc2
           WHERE EXTRACT(MONTH FROM calendar_date) = 7
           AND EXTRACT( DAY FROM calendar_date ) > 7
           AND EXTRACT( DOW FROM calendar_date) = 1
           AND EXTRACT( YEAR FROM calendar_date) BETWEEN 1952 AND 1960
           GROUP BY EXTRACT(YEAR FROM dc2.calendar_date)
)
UPDATE dim_calendar
SET hol_za = TRUE
FROM cte
WHERE dim_calendar.calendar_date = cte.second_mon_jul
;


-- 10 July	Family Day	1961–1974
UPDATE dim_calendar
SET hol_za = TRUE
WHERE EXTRACT( DAY   FROM calendar_date ) = 10
AND   EXTRACT( MONTH FROM calendar_date ) = 7
AND   EXTRACT( YEAR  FROM calendar_date ) BETWEEN 1961 AND 1974
;


-- 1st Monday in August	King's Birthday	1910–1951
WITH cte AS (
    SELECT EXTRACT(YEAR FROM dc2.calendar_date) AS yr,
           MIN(calendar_date) AS first_mon_aug
           FROM dim_calendar AS dc2
           WHERE EXTRACT(MONTH FROM calendar_date) = 8
           AND   EXTRACT(DOW   FROM calendar_date) = 1
           AND   EXTRACT(YEAR  FROM calendar_date) BETWEEN 1910 AND 1951
           GROUP BY EXTRACT(YEAR FROM dc2.calendar_date)
)
UPDATE dim_calendar
SET hol_za = TRUE
FROM cte
WHERE dim_calendar.calendar_date = cte.first_mon_aug
;


-- 1st Monday in September	Settlers' Day	1952–1979
WITH cte AS (
    SELECT EXTRACT(YEAR FROM dc2.calendar_date) AS yr,
           MIN(calendar_date) AS first_mon_sep
           FROM dim_calendar AS dc2
           WHERE EXTRACT(MONTH FROM calendar_date) = 9
           AND   EXTRACT(DOW   FROM calendar_date) = 1
           AND   EXTRACT(YEAR  FROM calendar_date) BETWEEN 1952 AND 1979
           GROUP BY EXTRACT(YEAR FROM dc2.calendar_date)
)
UPDATE dim_calendar
SET hol_za = TRUE
FROM cte
WHERE dim_calendar.calendar_date = cte.first_mon_sep
;


-- 10 October	Kruger Day	1952–1993
UPDATE dim_calendar
SET hol_za = TRUE
WHERE EXTRACT( DAY   FROM calendar_date ) = 10
AND   EXTRACT( MONTH FROM calendar_date ) = 10
AND   EXTRACT( YEAR  FROM calendar_date ) BETWEEN 1952 AND 1993
;


-- 16 December	Dingaan's Day /Day of the Covenant /Day of the Vow/ Day of Reconciliation

-- 25 December	Christmas Day	1910–present

-- 26 December	Boxing Day / Day of Goodwill

COMMIT;
