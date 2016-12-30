-- Common MYSQL

BEGIN;

DELETE FROM
dim_calendar;


-- Thanks: http://stackoverflow.com/a/15224720/266387
-- No loops or variables for max compatability

INSERT INTO dim_calendar(dim_calendar_pk, calendar_date)
SELECT CAST(DATE_FORMAT(a.Date, '%Y%m%d') AS UNSIGNED), a.Date
FROM
  (SELECT '2038-01-19' - INTERVAL (a.a + (10 * b.a) + (100 * c.a) + (1000 * d.a) + (10000 * e.a)) DAY AS Date
   FROM
     (SELECT 0 AS a
      UNION ALL SELECT 1
      UNION ALL SELECT 2
      UNION ALL SELECT 3
      UNION ALL SELECT 4
      UNION ALL SELECT 5
      UNION ALL SELECT 6
      UNION ALL SELECT 7
      UNION ALL SELECT 8
      UNION ALL SELECT 9) AS a CROSS
   JOIN
     (SELECT 0 AS a
      UNION ALL SELECT 1
      UNION ALL SELECT 2
      UNION ALL SELECT 3
      UNION ALL SELECT 4
      UNION ALL SELECT 5
      UNION ALL SELECT 6
      UNION ALL SELECT 7
      UNION ALL SELECT 8
      UNION ALL SELECT 9) AS b CROSS
   JOIN
     (SELECT 0 AS a
      UNION ALL SELECT 1
      UNION ALL SELECT 2
      UNION ALL SELECT 3
      UNION ALL SELECT 4
      UNION ALL SELECT 5
      UNION ALL SELECT 6
      UNION ALL SELECT 7
      UNION ALL SELECT 8
      UNION ALL SELECT 9) AS c CROSS
   JOIN
     (SELECT 0 AS a
      UNION ALL SELECT 1
      UNION ALL SELECT 2
      UNION ALL SELECT 3
      UNION ALL SELECT 4
      UNION ALL SELECT 5
      UNION ALL SELECT 6
      UNION ALL SELECT 7
      UNION ALL SELECT 8
      UNION ALL SELECT 9) AS d CROSS
   JOIN
     (SELECT 0 AS a
      UNION ALL SELECT 1
      UNION ALL SELECT 2
      UNION ALL SELECT 3
      UNION ALL SELECT 4
      UNION ALL SELECT 5
      UNION ALL SELECT 6
      UNION ALL SELECT 7
      UNION ALL SELECT 8
      UNION ALL SELECT 9) AS e) a
WHERE a.Date BETWEEN '1970-01-01' AND '2038-01-19'
ORDER BY a.Date
;



COMMIT;



