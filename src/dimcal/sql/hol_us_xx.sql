BEGIN;

UPDATE dim_calendar
SET hol_us_xx = FALSE
;

-- New Years Day
-- January 1 (Fixed)
-- Observed by the state governments of all 50 states
UPDATE dim_calendar
SET hol_us_xx = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 1
AND   EXTRACT( MONTH FROM calendar_date) = 1
AND   EXTRACT( DOW   FROM calendar_date) BETWEEN 1 AND 5 -- Sunday (0) to Saturday (6)
;

-- New Years day 02 Jan
UPDATE dim_calendar
SET hol_us_xx = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 2
AND   EXTRACT( MONTH FROM calendar_date) = 1
AND   EXTRACT( DOW   FROM calendar_date) = 1 -- Mon yyyy/01/02
;
-- New Years day 03 Jan
UPDATE dim_calendar
SET hol_us_xx = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 3
AND   EXTRACT( MONTH FROM calendar_date) = 1
AND   EXTRACT( DOW   FROM calendar_date) = 1 -- Mon yyyy/01/03
;



-- Birthday of Martin Luther King, Jr.
-- January 15–21 (Floating Monday)
-- It was officially observed in all 50 states for the first time in 2000 UT
-- Wyoming was the first state to observe in 1990
UPDATE dim_calendar
SET hol_us_xx = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) BETWEEN 15 AND 21
AND   EXTRACT( MONTH FROM calendar_date) = 1
AND   EXTRACT( DOW   FROM calendar_date) = 1 -- Mon yyyy/01/15
AND   EXTRACT( YEAR FROM calendar_date) >= 1996
;


-- Fast Day NH YEAR <= 1991
-- Fast Day as the 4th Monday in April (Chapter 270, Laws of 1949)


-- Inauguration Day
-- January 20 or 21
-- Wikipedia says:
--   While this is a federal holiday, this is not a "public holiday".
--   Only federal employees in the Washington, D.C. Area observe this day





-- Washington's Birthday
-- February 15–21 (Floating Monday)
UPDATE dim_calendar
SET hol_us_xx = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) BETWEEN 15 AND 21
AND   EXTRACT( MONTH FROM calendar_date) = 2
AND   EXTRACT( DOW   FROM calendar_date) = 1 -- Mon yyyy/01/15
;


-- Lincoln's birthday
-- February 12, 1809. Arizona, California,[1] Connecticut,[2] Illinois,[3] Indiana,[4] Missouri, and New York
-- New Jersey observed the holiday until September 29, 2008
-- Connecticut, Illinois, Missouri, New Jersey, and New York



-- Good Friday
-- Observed by Connecticut, Delaware, Guam, Hawaii, Indiana, Kentucky, Louisiana, New Jersey, North Carolina, North Dakota, Puerto Rico, and Tennessee.
UPDATE dim_calendar
SET hol_us_xx = TRUE
WHERE calc_western_good_fri = TRUE
;


-- Confederate Memorial Day
-- Alabama	Last Monday in April[4]	A state paid holiday. State offices are closed.
-- Florida	April 26 [5][6]	When April 26 is a Sunday, it is recognized the following Monday.[7]
-- Georgia	Last Monday in April [8]	A state paid holiday. State offices are closed.[9]
-- Kentucky	June 3[10]	Jefferson Davis's birthday.
-- Louisiana	June 3 [11][12]	Jefferson Davis's birthday. Set by state law, Louisiana Revised Statutes 1:55
-- Mississippi	Last Monday in April[13][14]	A state paid holiday. State offices may be closed, at the discretion of the state agency or department heads.[15][16]
-- North Carolina	May 10 [11]	
-- South Carolina	May 10 [17]	The observed date shifts to Friday if it falls on Saturday, and to Monday if it falls on Sunday.
-- Tennessee	June 3[11]	
-- Texas	January 19[11]	Confederate Heroes Day. In 1973, the Texas legislature combined the previously official state holidays of Robert E. Lee's and Jefferson Davis's birthdays into a single "Confederate Heroes Day" to honor all who had served the Southern Cause. 



-- Memorial Day
-- May 25–31 (Floating Monday)
-- Observed by the state governments of all 50 states
UPDATE dim_calendar
SET hol_us_xx = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) BETWEEN 25 AND 31
AND   EXTRACT( MONTH FROM calendar_date) = 5
AND   EXTRACT( DOW   FROM calendar_date) = 1 -- Mon yyyy/01/15
;


-- Independence Day
-- July 4 (Fixed)
-- Observed by the state governments of all 50 states
UPDATE dim_calendar
SET hol_us_xx = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 4
AND   EXTRACT( MONTH FROM calendar_date) = 7
;


-- Victory Day
-- Third Monday of August
-- Celebrated the U.S. victory against Japan in the conclusion of World War II. Was in place 1948 to 1975.
UPDATE dim_calendar
SET hol_us_xx = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) BETWEEN 15 AND 21
AND   EXTRACT( MONTH FROM calendar_date) = 8
AND   EXTRACT( DOW   FROM calendar_date) = 1 -- Mon yyyy/01/15
AND   EXTRACT( YEAR FROM calendar_date) <= 1975
;



-- Labour Day
-- September 1–7 (Floating Monday)
-- Observed by the state governments of all 50 states
UPDATE dim_calendar
SET hol_us_xx = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) BETWEEN 1 AND 7
AND   EXTRACT( MONTH FROM calendar_date) = 9
AND   EXTRACT( DOW   FROM calendar_date) = 1 -- Mon yyyy/01/15
;


-- Columbus Day /  Discoverers' Day / Native American Day
-- October 8–14 (Floating Monday). 
-- Since 1970 (Oct. 12), the holiday has been fixed to the second Monday in October,
-- Fewer than half the states recognize Columbus Day.
-- Hawaii, Alaska, Oregon, South Dakota, and Vermont do not recognize Columbus Day at all
UPDATE dim_calendar
SET hol_us_xx = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) BETWEEN 8 AND 14
AND   EXTRACT( MONTH FROM calendar_date) = 10
AND   EXTRACT( DOW   FROM calendar_date) = 1 -- Mon yyyy/01/15
;


-- Veterans Day
-- November 11 (Fixed)
-- Observed by the state governments of all 50 states
UPDATE dim_calendar
SET hol_us_xx = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 11
AND   EXTRACT( MONTH FROM calendar_date) = 11
;



-- Thanksgiving Day
-- November 22–28 (Floating Thursday)
-- Observed by the state governments of all 50 states
UPDATE dim_calendar
SET hol_us_xx = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) BETWEEN 22 AND 28
AND   EXTRACT( MONTH FROM calendar_date) = 11
AND   EXTRACT( DOW   FROM calendar_date) = 4 -- Thu yyyy/01/15
;


-- Election day
-- the Tuesday next after the first Monday in the month of November
-- Observed by Delaware, Hawaii, Illinois, Indiana, Montana, New Jersey, New York, Pennsylvania, and Rhode Island

-- Day after Thankgiving
-- Observed by Delaware, Florida, Iowa, Kansas, Kentucky, Maryland, Michigan, Nebraska, New Hampshire, New Mexico, North Carolina, Pennsylvania, South Carolina, Texas, Vermont, Virginia, Washington, and West Virginia.



-- Christmas Eve	
-- Observed by Arkansas, Georgia, Indiana, Kentucky, Michigan, North Carolina, South Carolina, Tennessee, Texas, Virginia, West Virginia, Wisconsin
UPDATE dim_calendar
SET hol_us_xx = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 24
AND   EXTRACT( MONTH FROM calendar_date) = 12
;


-- Christmas Day
-- December 25 (Fixed)
-- Observed by the state governments of all 50 states
UPDATE dim_calendar
SET hol_us_xx = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 25
AND   EXTRACT( MONTH FROM calendar_date) = 12
;

-- Day after Christmas	
-- Observed by Kentucky, Michigan, North Carolina, South Carolina, and the US Virgin Islands.
UPDATE dim_calendar
SET hol_us_xx = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 26
AND   EXTRACT( MONTH FROM calendar_date) = 12
;


-- New Year's Eve	
-- Observed by Kentucky, Michigan, West Virginia, and Wisconsin.
UPDATE dim_calendar
SET hol_us_xx = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 31
AND   EXTRACT( MONTH FROM calendar_date) = 12
;




COMMIT;
