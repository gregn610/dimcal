-- England and Wales

BEGIN;

UPDATE dim_calendar
SET hol_gb_eng_wls = FALSE
;




-- New Years day 01 Jan
-- Wikipedia says
--   1 January	New Year's Day	from 1974, by Royal Proclamation.
--   Currently not proclaimed if 1 January falls on Saturday or Sunday.[1][2][3][4]
UPDATE dim_calendar
SET hol_gb_eng_wls = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 1
AND   EXTRACT( MONTH FROM calendar_date) = 1
AND   EXTRACT( YEAR  FROM calendar_date) >= 1974
AND   EXTRACT( DOW   FROM calendar_date) BETWEEN 1 AND 5 -- Sunday (0) to Saturday (6)
;


-- New Years day 02 Jan
-- Wikipedia says
--   2 January	not named	By Royal Proclamation, only in a year in which 1 January is Sunday.
UPDATE dim_calendar
SET hol_gb_eng_wls = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 2
AND   EXTRACT( MONTH FROM calendar_date) = 1
AND   EXTRACT( YEAR  FROM calendar_date) >= 1974
AND   EXTRACT( DOW   FROM calendar_date) = 1 -- Mon yyyy/01/02
;




-- New Years day 03 Jan
-- Wikipedia says
--   3 January	not named	By Royal Proclamation, only in a year in which 1 January is Saturday.
UPDATE dim_calendar
SET hol_gb_eng_wls = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 3
AND   EXTRACT( MONTH FROM calendar_date) = 1
AND   EXTRACT( YEAR  FROM calendar_date) >= 1974
AND   EXTRACT( DOW   FROM calendar_date) = 1 -- Mon yyyy/01/03
;



-- Good Friday
-- Wikipedia says
--    variable	Good Friday	Traditional common law holiday[1][2][3][4]
UPDATE dim_calendar
SET hol_gb_eng_wls = TRUE
WHERE calc_western_good_fri = TRUE
;


-- Easter Monday
-- Wikipedia says
--    Easter Monday	Statutory bank holiday, defined by name.[12]
UPDATE dim_calendar
SET hol_gb_eng_wls = TRUE
WHERE calc_western_easter_mon = TRUE
;


-- May Day Bank Holiday
-- Wikipedia says
-- First Monday in May from 1978, by Royal Proclamation annually[1][2][3][4]
WITH cte AS (
    SELECT EXTRACT(YEAR FROM dc2.calendar_date) AS yr,
           MIN(calendar_date) AS first_mon_may
           FROM dim_calendar AS dc2
           WHERE EXTRACT(MONTH FROM calendar_date) = 5
           AND EXTRACT(DOW FROM calendar_date) = 1
           GROUP BY EXTRACT(YEAR FROM dc2.calendar_date)
)
UPDATE dim_calendar
SET hol_gb_eng_wls = TRUE
FROM cte
WHERE dim_calendar.calendar_date = cte.first_mon_may
AND EXTRACT(YEAR FROM calendar_date) >= 1978
AND EXTRACT(YEAR FROM calendar_date) != 1995
;

--In 1995 the May Day bank holiday was moved to 8 May as it was the 50th anniversary of VE Day
UPDATE dim_calendar
SET hol_gb_eng_wls = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 08
AND   EXTRACT( MONTH FROM calendar_date) = 05
AND   EXTRACT( YEAR FROM calendar_date) = 1995
;



-- Spring Bank Holiday
-- Wikipedia says
--    Last Monday in May Statutory bank holiday from 1971,[12] following a trial period from 1965 to 1970.
--    Replaced Whit Monday, which was formerly a public holiday whose date varied according to the date of Easter.[12][13][14]
--    The legislation does not specify a name for the holiday, merely when it occurs.
WITH cte AS (
    SELECT EXTRACT(YEAR FROM dc2.calendar_date) AS yr,
           MAX(calendar_date) AS last_mon_may
           FROM dim_calendar AS dc2
           WHERE EXTRACT(MONTH FROM calendar_date) = 5
           AND EXTRACT(DOW FROM calendar_date) = 1
           GROUP BY EXTRACT(YEAR FROM dc2.calendar_date)
)
UPDATE dim_calendar
SET hol_gb_eng_wls = TRUE
FROM cte
WHERE dim_calendar.calendar_date = cte.last_mon_may
AND EXTRACT(YEAR FROM calendar_date) >= 1965
AND EXTRACT(YEAR FROM calendar_date) != 2002
AND EXTRACT(YEAR FROM calendar_date) != 2012
;
-- The Spring Bank Holiday was moved from 27 May to 4 June to make it a four-day weekend
UPDATE dim_calendar
SET hol_gb_eng_wls = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 04
AND   EXTRACT( MONTH FROM calendar_date) = 06
AND   EXTRACT( YEAR   FROM calendar_date) = 2002
;
-- to make it a four-day weekend, the Spring Bank Holiday that would usually have occurred at the end of May was delayed
-- until Monday, 4 June 2012.[21]
UPDATE dim_calendar
SET hol_gb_eng_wls = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 04
AND   EXTRACT( MONTH FROM calendar_date) = 06
AND   EXTRACT( YEAR  FROM calendar_date) = 2012
;



-- Last Monday in August
-- Wikipedia says
--    Late Summer Bank Holiday Statutory bank holiday from 1971,[12] following a trial period from 1965 to 1970.
--    Replaced the first Monday in August (formerly commonly known as "August Bank Holiday".[1][4][12]
--    The legislation does not specify a name for the holiday, merely when it occurs.
WITH cte AS (
    SELECT EXTRACT(YEAR FROM dc2.calendar_date) AS yr,
           MAX(calendar_date) AS last_mon_aug
           FROM dim_calendar AS dc2
           WHERE EXTRACT(MONTH FROM calendar_date) = 8
           AND EXTRACT(DOW FROM calendar_date) = 1
           GROUP BY EXTRACT(YEAR FROM dc2.calendar_date)
)
UPDATE dim_calendar
SET hol_gb_eng_wls = TRUE
FROM cte
WHERE dim_calendar.calendar_date = cte.last_mon_aug
AND EXTRACT(YEAR FROM calendar_date) >= 1965
;



-- Christmas day 25 Dec
-- Wikipedia says
--   25 December	Christmas Day	Traditional common law holiday[1][2][3][4]
UPDATE dim_calendar
SET hol_gb_eng_wls = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 25
AND   EXTRACT( MONTH FROM calendar_date) = 12
;

-- Outside Scotland, if Christmas Day is a Sunday there is an additional statutory holiday on 27 December.
-- By Royal Proclamation, if Christmas Day is a Saturday there is a substitute holiday on 28 December
UPDATE dim_calendar
SET hol_gb_eng_wls = TRUE
WHERE EXTRACT( MONTH FROM calendar_date) = 12
AND (
    (EXTRACT( DAY   FROM calendar_date) = 27 AND
     EXTRACT( DOW   FROM calendar_date) = 2 -- Tue yyyy/12/27 )
    ) OR (
     EXTRACT( DAY   FROM calendar_date) = 28 AND
     EXTRACT( DOW   FROM calendar_date) = 2 -- Tue yyyy/12/8 )
    )
)
;



-- Boxing day
-- Wikipedia says
--   26 December (see Notes)	Boxing Day	Statutory bank holiday.
--   Legislation does not name the holiday, but states that it falls on "26th December, if it be not a Sunday."[12]
UPDATE dim_calendar
SET hol_gb_eng_wls = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 26
AND   EXTRACT( MONTH FROM calendar_date) = 12
AND   EXTRACT( DOW   FROM calendar_date) != 0 -- Sun yyyy/12/26 )
;

-- Silver Jubilee of Elizabeth II
-- Wikpedia Says 7 June 1977 was made a special bank holiday as part of the Silver Jubilee of Elizabeth II
UPDATE dim_calendar
SET hol_gb_eng_wls = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 7
AND   EXTRACT( MONTH FROM calendar_date) = 6
AND   EXTRACT( YEAR  FROM calendar_date) = 1977
;


-- The wedding of Charles, Prince of Wales, and Lady Diana Spencer on 29 July 1981 resulted in an extra bank holiday
UPDATE dim_calendar
SET hol_gb_eng_wls = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 29
AND   EXTRACT( MONTH FROM calendar_date) = 7
AND   EXTRACT( YEAR  FROM calendar_date) = 1981
;

-- 31 December 1999 was a one-off bank holiday as part of the Millennium celebrations
UPDATE dim_calendar
SET hol_gb_eng_wls = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 31
AND   EXTRACT( MONTH FROM calendar_date) = 12
AND   EXTRACT( YEAR  FROM calendar_date) = 1999
;


-- In 2002, there was a special holiday on Monday, 3 June, to celebrate the Golden Jubilee of Elizabeth II.
UPDATE dim_calendar
SET hol_gb_eng_wls = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 03
AND   EXTRACT( MONTH FROM calendar_date) = 06
AND   EXTRACT( YEAR  FROM calendar_date) = 2002
;

--There was a special holiday on Friday, 29 April 2011 to celebrate the wedding of Prince William and Catherine Middleton
UPDATE dim_calendar
SET hol_gb_eng_wls = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 29
AND   EXTRACT( MONTH FROM calendar_date) = 04
AND   EXTRACT( YEAR  FROM calendar_date) = 2011
;


-- In 2012, there was a special holiday on Tuesday, 5 June, to celebrate the Diamond Jubilee of Elizabeth II. Therefore,
-- to make it a four-day weekend, the Spring Bank Holiday that would usually have occurred at the end of May was delayed
-- until Monday, 4 June 2012.[21]
UPDATE dim_calendar
SET hol_gb_eng_wls = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 05
AND   EXTRACT( MONTH FROM calendar_date) = 06
AND   EXTRACT( YEAR  FROM calendar_date) = 2012
;



COMMIT;