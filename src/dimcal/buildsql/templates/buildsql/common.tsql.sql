-- Common T-SQL

BEGIN;

DELETE FROM
dim_calendar;

INSERT
INTO
dim_calendar(dim_calendar_pk, calendar_date)
SELECT
CAST(to_char(calendar_date, 'yyyymmdd')
AS
INT), calendar_date
FROM
generate_series('1970-01-01'::timestamp, '2038-01-19'::timestamp, '1 day'::interval) calendar_date
;

COMMIT;

