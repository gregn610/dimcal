-- England and Wales
UPDATE dim_calendar
SET hol_gb_eng_wls = 0
;




-- New Years day 01 Jan
UPDATE dim_calendar
SET hol_gb_eng_wls = 1
WHERE strftime('%d', calendar_date)  = '01'
AND   strftime('%m', calendar_date)    = '01'
AND   CAST(strftime('%m', calendar_date)  AS INTEGER) >= 1974
AND ... Monday rule ...
;


-- Christmas day 25 Dec
UPDATE dim_calendar
SET hol_gb_eng_wls = 1
WHERE strftime('%d', calendar_date)  = '25'
AND   strftime('%m', calendar_date)    = '12'
;
