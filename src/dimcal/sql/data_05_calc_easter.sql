-- Easter
BEGIN;

UPDATE dim_calendar
SET calc_western_good_fri = FALSE,
    calc_western_easter_mon = FALSE
;

-- From http://www.maa.mhn.de/StarDate/publ_holidays.html
UPDATE dim_calendar SET calc_western_good_fri = TRUE WHERE calendar_date = '1970-03-27';
UPDATE dim_calendar SET calc_western_good_fri = TRUE WHERE calendar_date = '1971-04-09';
UPDATE dim_calendar SET calc_western_good_fri = TRUE WHERE calendar_date = '1972-03-31';
UPDATE dim_calendar SET calc_western_good_fri = TRUE WHERE calendar_date = '1973-04-20';
UPDATE dim_calendar SET calc_western_good_fri = TRUE WHERE calendar_date = '1974-04-12';
UPDATE dim_calendar SET calc_western_good_fri = TRUE WHERE calendar_date = '1975-03-28';
UPDATE dim_calendar SET calc_western_good_fri = TRUE WHERE calendar_date = '1976-04-16';
UPDATE dim_calendar SET calc_western_good_fri = TRUE WHERE calendar_date = '1977-04-08';
UPDATE dim_calendar SET calc_western_good_fri = TRUE WHERE calendar_date = '1978-03-24';
UPDATE dim_calendar SET calc_western_good_fri = TRUE WHERE calendar_date = '1979-04-13';
UPDATE dim_calendar SET calc_western_good_fri = TRUE WHERE calendar_date = '1980-04-04';
UPDATE dim_calendar SET calc_western_good_fri = TRUE WHERE calendar_date = '1981-04-17';
UPDATE dim_calendar SET calc_western_good_fri = TRUE WHERE calendar_date = '1982-04-09';
UPDATE dim_calendar SET calc_western_good_fri = TRUE WHERE calendar_date = '1983-04-01';
UPDATE dim_calendar SET calc_western_good_fri = TRUE WHERE calendar_date = '1984-04-20';
UPDATE dim_calendar SET calc_western_good_fri = TRUE WHERE calendar_date = '1985-04-05';
UPDATE dim_calendar SET calc_western_good_fri = TRUE WHERE calendar_date = '1986-03-28';
UPDATE dim_calendar SET calc_western_good_fri = TRUE WHERE calendar_date = '1987-04-17';
UPDATE dim_calendar SET calc_western_good_fri = TRUE WHERE calendar_date = '1988-04-01';
UPDATE dim_calendar SET calc_western_good_fri = TRUE WHERE calendar_date = '1989-03-24';
UPDATE dim_calendar SET calc_western_good_fri = TRUE WHERE calendar_date = '1990-04-13';
UPDATE dim_calendar SET calc_western_good_fri = TRUE WHERE calendar_date = '1991-03-29';
UPDATE dim_calendar SET calc_western_good_fri = TRUE WHERE calendar_date = '1992-04-17';
UPDATE dim_calendar SET calc_western_good_fri = TRUE WHERE calendar_date = '1993-04-09';
UPDATE dim_calendar SET calc_western_good_fri = TRUE WHERE calendar_date = '1994-04-01';
UPDATE dim_calendar SET calc_western_good_fri = TRUE WHERE calendar_date = '1995-04-14';
UPDATE dim_calendar SET calc_western_good_fri = TRUE WHERE calendar_date = '1996-04-05';
UPDATE dim_calendar SET calc_western_good_fri = TRUE WHERE calendar_date = '1997-03-28';
UPDATE dim_calendar SET calc_western_good_fri = TRUE WHERE calendar_date = '1998-04-10';
UPDATE dim_calendar SET calc_western_good_fri = TRUE WHERE calendar_date = '1999-04-02';
UPDATE dim_calendar SET calc_western_good_fri = TRUE WHERE calendar_date = '2000-04-21';
UPDATE dim_calendar SET calc_western_good_fri = TRUE WHERE calendar_date = '2001-04-13';
UPDATE dim_calendar SET calc_western_good_fri = TRUE WHERE calendar_date = '2002-03-29';
UPDATE dim_calendar SET calc_western_good_fri = TRUE WHERE calendar_date = '2003-04-18';
UPDATE dim_calendar SET calc_western_good_fri = TRUE WHERE calendar_date = '2004-04-09';
UPDATE dim_calendar SET calc_western_good_fri = TRUE WHERE calendar_date = '2005-03-25';
UPDATE dim_calendar SET calc_western_good_fri = TRUE WHERE calendar_date = '2006-04-14';
UPDATE dim_calendar SET calc_western_good_fri = TRUE WHERE calendar_date = '2007-04-06';
UPDATE dim_calendar SET calc_western_good_fri = TRUE WHERE calendar_date = '2008-03-21';
UPDATE dim_calendar SET calc_western_good_fri = TRUE WHERE calendar_date = '2009-04-10';
UPDATE dim_calendar SET calc_western_good_fri = TRUE WHERE calendar_date = '2010-04-02';
UPDATE dim_calendar SET calc_western_good_fri = TRUE WHERE calendar_date = '2011-04-22';
UPDATE dim_calendar SET calc_western_good_fri = TRUE WHERE calendar_date = '2012-04-06';
UPDATE dim_calendar SET calc_western_good_fri = TRUE WHERE calendar_date = '2013-03-29';
UPDATE dim_calendar SET calc_western_good_fri = TRUE WHERE calendar_date = '2014-04-18';
UPDATE dim_calendar SET calc_western_good_fri = TRUE WHERE calendar_date = '2015-04-03';
UPDATE dim_calendar SET calc_western_good_fri = TRUE WHERE calendar_date = '2016-03-25';
UPDATE dim_calendar SET calc_western_good_fri = TRUE WHERE calendar_date = '2017-04-14';
UPDATE dim_calendar SET calc_western_good_fri = TRUE WHERE calendar_date = '2018-03-30';
UPDATE dim_calendar SET calc_western_good_fri = TRUE WHERE calendar_date = '2019-04-19';
UPDATE dim_calendar SET calc_western_good_fri = TRUE WHERE calendar_date = '2020-04-10';
UPDATE dim_calendar SET calc_western_good_fri = TRUE WHERE calendar_date = '2021-04-02';
UPDATE dim_calendar SET calc_western_good_fri = TRUE WHERE calendar_date = '2022-04-15';
UPDATE dim_calendar SET calc_western_good_fri = TRUE WHERE calendar_date = '2023-04-07';
UPDATE dim_calendar SET calc_western_good_fri = TRUE WHERE calendar_date = '2024-03-29';
UPDATE dim_calendar SET calc_western_good_fri = TRUE WHERE calendar_date = '2025-04-18';
UPDATE dim_calendar SET calc_western_good_fri = TRUE WHERE calendar_date = '2026-04-03';
UPDATE dim_calendar SET calc_western_good_fri = TRUE WHERE calendar_date = '2027-03-26';
UPDATE dim_calendar SET calc_western_good_fri = TRUE WHERE calendar_date = '2028-04-14';
UPDATE dim_calendar SET calc_western_good_fri = TRUE WHERE calendar_date = '2029-03-30';
UPDATE dim_calendar SET calc_western_good_fri = TRUE WHERE calendar_date = '2030-04-19';
UPDATE dim_calendar SET calc_western_good_fri = TRUE WHERE calendar_date = '2031-04-11';
UPDATE dim_calendar SET calc_western_good_fri = TRUE WHERE calendar_date = '2032-03-26';
UPDATE dim_calendar SET calc_western_good_fri = TRUE WHERE calendar_date = '2033-04-15';
UPDATE dim_calendar SET calc_western_good_fri = TRUE WHERE calendar_date = '2034-04-07';
UPDATE dim_calendar SET calc_western_good_fri = TRUE WHERE calendar_date = '2035-03-23';
UPDATE dim_calendar SET calc_western_good_fri = TRUE WHERE calendar_date = '2036-04-11';
UPDATE dim_calendar SET calc_western_good_fri = TRUE WHERE calendar_date = '2037-04-03';

UPDATE dim_calendar SET calc_western_easter_mon = TRUE WHERE calendar_date = '1970-03-29'::DATE + INTERVAL '1 DAY';
UPDATE dim_calendar SET calc_western_easter_mon = TRUE WHERE calendar_date = '1971-04-11'::DATE + INTERVAL '1 DAY';
UPDATE dim_calendar SET calc_western_easter_mon = TRUE WHERE calendar_date = '1972-04-02'::DATE + INTERVAL '1 DAY';
UPDATE dim_calendar SET calc_western_easter_mon = TRUE WHERE calendar_date = '1973-04-22'::DATE + INTERVAL '1 DAY';
UPDATE dim_calendar SET calc_western_easter_mon = TRUE WHERE calendar_date = '1974-04-14'::DATE + INTERVAL '1 DAY';
UPDATE dim_calendar SET calc_western_easter_mon = TRUE WHERE calendar_date = '1975-03-30'::DATE + INTERVAL '1 DAY';
UPDATE dim_calendar SET calc_western_easter_mon = TRUE WHERE calendar_date = '1976-04-18'::DATE + INTERVAL '1 DAY';
UPDATE dim_calendar SET calc_western_easter_mon = TRUE WHERE calendar_date = '1977-04-10'::DATE + INTERVAL '1 DAY';
UPDATE dim_calendar SET calc_western_easter_mon = TRUE WHERE calendar_date = '1978-03-26'::DATE + INTERVAL '1 DAY';
UPDATE dim_calendar SET calc_western_easter_mon = TRUE WHERE calendar_date = '1979-04-15'::DATE + INTERVAL '1 DAY';
UPDATE dim_calendar SET calc_western_easter_mon = TRUE WHERE calendar_date = '1980-04-06'::DATE + INTERVAL '1 DAY';
UPDATE dim_calendar SET calc_western_easter_mon = TRUE WHERE calendar_date = '1981-04-19'::DATE + INTERVAL '1 DAY';
UPDATE dim_calendar SET calc_western_easter_mon = TRUE WHERE calendar_date = '1982-04-11'::DATE + INTERVAL '1 DAY';
UPDATE dim_calendar SET calc_western_easter_mon = TRUE WHERE calendar_date = '1983-04-03'::DATE + INTERVAL '1 DAY';
UPDATE dim_calendar SET calc_western_easter_mon = TRUE WHERE calendar_date = '1984-04-22'::DATE + INTERVAL '1 DAY';
UPDATE dim_calendar SET calc_western_easter_mon = TRUE WHERE calendar_date = '1985-04-07'::DATE + INTERVAL '1 DAY';
UPDATE dim_calendar SET calc_western_easter_mon = TRUE WHERE calendar_date = '1986-03-30'::DATE + INTERVAL '1 DAY';
UPDATE dim_calendar SET calc_western_easter_mon = TRUE WHERE calendar_date = '1987-04-19'::DATE + INTERVAL '1 DAY';
UPDATE dim_calendar SET calc_western_easter_mon = TRUE WHERE calendar_date = '1988-04-03'::DATE + INTERVAL '1 DAY';
UPDATE dim_calendar SET calc_western_easter_mon = TRUE WHERE calendar_date = '1989-03-26'::DATE + INTERVAL '1 DAY';
UPDATE dim_calendar SET calc_western_easter_mon = TRUE WHERE calendar_date = '1990-04-15'::DATE + INTERVAL '1 DAY';
UPDATE dim_calendar SET calc_western_easter_mon = TRUE WHERE calendar_date = '1991-03-31'::DATE + INTERVAL '1 DAY';
UPDATE dim_calendar SET calc_western_easter_mon = TRUE WHERE calendar_date = '1992-04-19'::DATE + INTERVAL '1 DAY';
UPDATE dim_calendar SET calc_western_easter_mon = TRUE WHERE calendar_date = '1993-04-11'::DATE + INTERVAL '1 DAY';
UPDATE dim_calendar SET calc_western_easter_mon = TRUE WHERE calendar_date = '1994-04-03'::DATE + INTERVAL '1 DAY';
UPDATE dim_calendar SET calc_western_easter_mon = TRUE WHERE calendar_date = '1995-04-16'::DATE + INTERVAL '1 DAY';
UPDATE dim_calendar SET calc_western_easter_mon = TRUE WHERE calendar_date = '1996-04-07'::DATE + INTERVAL '1 DAY';
UPDATE dim_calendar SET calc_western_easter_mon = TRUE WHERE calendar_date = '1997-03-30'::DATE + INTERVAL '1 DAY';
UPDATE dim_calendar SET calc_western_easter_mon = TRUE WHERE calendar_date = '1998-04-12'::DATE + INTERVAL '1 DAY';
UPDATE dim_calendar SET calc_western_easter_mon = TRUE WHERE calendar_date = '1999-04-04'::DATE + INTERVAL '1 DAY';
UPDATE dim_calendar SET calc_western_easter_mon = TRUE WHERE calendar_date = '2000-04-23'::DATE + INTERVAL '1 DAY';
UPDATE dim_calendar SET calc_western_easter_mon = TRUE WHERE calendar_date = '2001-04-15'::DATE + INTERVAL '1 DAY';
UPDATE dim_calendar SET calc_western_easter_mon = TRUE WHERE calendar_date = '2002-03-31'::DATE + INTERVAL '1 DAY';
UPDATE dim_calendar SET calc_western_easter_mon = TRUE WHERE calendar_date = '2003-04-20'::DATE + INTERVAL '1 DAY';
UPDATE dim_calendar SET calc_western_easter_mon = TRUE WHERE calendar_date = '2004-04-11'::DATE + INTERVAL '1 DAY';
UPDATE dim_calendar SET calc_western_easter_mon = TRUE WHERE calendar_date = '2005-03-27'::DATE + INTERVAL '1 DAY';
UPDATE dim_calendar SET calc_western_easter_mon = TRUE WHERE calendar_date = '2006-04-16'::DATE + INTERVAL '1 DAY';
UPDATE dim_calendar SET calc_western_easter_mon = TRUE WHERE calendar_date = '2007-04-08'::DATE + INTERVAL '1 DAY';
UPDATE dim_calendar SET calc_western_easter_mon = TRUE WHERE calendar_date = '2008-03-23'::DATE + INTERVAL '1 DAY';
UPDATE dim_calendar SET calc_western_easter_mon = TRUE WHERE calendar_date = '2009-04-12'::DATE + INTERVAL '1 DAY';
UPDATE dim_calendar SET calc_western_easter_mon = TRUE WHERE calendar_date = '2010-04-04'::DATE + INTERVAL '1 DAY';
UPDATE dim_calendar SET calc_western_easter_mon = TRUE WHERE calendar_date = '2011-04-24'::DATE + INTERVAL '1 DAY';
UPDATE dim_calendar SET calc_western_easter_mon = TRUE WHERE calendar_date = '2012-04-08'::DATE + INTERVAL '1 DAY';
UPDATE dim_calendar SET calc_western_easter_mon = TRUE WHERE calendar_date = '2013-03-31'::DATE + INTERVAL '1 DAY';
UPDATE dim_calendar SET calc_western_easter_mon = TRUE WHERE calendar_date = '2014-04-20'::DATE + INTERVAL '1 DAY';
UPDATE dim_calendar SET calc_western_easter_mon = TRUE WHERE calendar_date = '2015-04-05'::DATE + INTERVAL '1 DAY';
UPDATE dim_calendar SET calc_western_easter_mon = TRUE WHERE calendar_date = '2016-03-27'::DATE + INTERVAL '1 DAY';
UPDATE dim_calendar SET calc_western_easter_mon = TRUE WHERE calendar_date = '2017-04-16'::DATE + INTERVAL '1 DAY';
UPDATE dim_calendar SET calc_western_easter_mon = TRUE WHERE calendar_date = '2018-04-01'::DATE + INTERVAL '1 DAY';
UPDATE dim_calendar SET calc_western_easter_mon = TRUE WHERE calendar_date = '2019-04-21'::DATE + INTERVAL '1 DAY';
UPDATE dim_calendar SET calc_western_easter_mon = TRUE WHERE calendar_date = '2020-04-12'::DATE + INTERVAL '1 DAY';
UPDATE dim_calendar SET calc_western_easter_mon = TRUE WHERE calendar_date = '2021-04-04'::DATE + INTERVAL '1 DAY';
UPDATE dim_calendar SET calc_western_easter_mon = TRUE WHERE calendar_date = '2022-04-17'::DATE + INTERVAL '1 DAY';
UPDATE dim_calendar SET calc_western_easter_mon = TRUE WHERE calendar_date = '2023-04-09'::DATE + INTERVAL '1 DAY';
UPDATE dim_calendar SET calc_western_easter_mon = TRUE WHERE calendar_date = '2024-03-31'::DATE + INTERVAL '1 DAY';
UPDATE dim_calendar SET calc_western_easter_mon = TRUE WHERE calendar_date = '2025-04-20'::DATE + INTERVAL '1 DAY';
UPDATE dim_calendar SET calc_western_easter_mon = TRUE WHERE calendar_date = '2026-04-05'::DATE + INTERVAL '1 DAY';
UPDATE dim_calendar SET calc_western_easter_mon = TRUE WHERE calendar_date = '2027-03-28'::DATE + INTERVAL '1 DAY';
UPDATE dim_calendar SET calc_western_easter_mon = TRUE WHERE calendar_date = '2028-04-16'::DATE + INTERVAL '1 DAY';
UPDATE dim_calendar SET calc_western_easter_mon = TRUE WHERE calendar_date = '2029-04-01'::DATE + INTERVAL '1 DAY';
UPDATE dim_calendar SET calc_western_easter_mon = TRUE WHERE calendar_date = '2030-04-21'::DATE + INTERVAL '1 DAY';
UPDATE dim_calendar SET calc_western_easter_mon = TRUE WHERE calendar_date = '2031-04-13'::DATE + INTERVAL '1 DAY';
UPDATE dim_calendar SET calc_western_easter_mon = TRUE WHERE calendar_date = '2032-03-28'::DATE + INTERVAL '1 DAY';
UPDATE dim_calendar SET calc_western_easter_mon = TRUE WHERE calendar_date = '2033-04-17'::DATE + INTERVAL '1 DAY';
UPDATE dim_calendar SET calc_western_easter_mon = TRUE WHERE calendar_date = '2034-04-09'::DATE + INTERVAL '1 DAY';
UPDATE dim_calendar SET calc_western_easter_mon = TRUE WHERE calendar_date = '2035-03-25'::DATE + INTERVAL '1 DAY';
UPDATE dim_calendar SET calc_western_easter_mon = TRUE WHERE calendar_date = '2036-04-13'::DATE + INTERVAL '1 DAY';
UPDATE dim_calendar SET calc_western_easter_mon = TRUE WHERE calendar_date = '2037-04-05'::DATE + INTERVAL '1 DAY';

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