-- Table MYSQL

CREATE TABLE IF NOT EXISTS dim_calendar (
     dim_calendar_pk INTEGER PRIMARY KEY
    ,calendar_date             DATE NOT NULL

    -- Optional calculation columns {% for calc in calcs %}
    ,calc_{{ calc }}           BOOLEAN DEFAULT FALSE {% endfor %}

    -- Pick and choose countries {% for country in countries %}
    ,hol_{{ country }}         BOOLEAN DEFAULT FALSE {% endfor %}
);

-- Thanks: http://dba.stackexchange.com/a/62997/4083
select if (
    exists(
        select distinct index_name from information_schema.statistics
        where table_name = 'dim_calendar' and index_name like 'idx_dim_calendar_calendar_date'
    )
    ,'select ''index index_1 exists'' _______;'
    ,'create index idx_dim_calendar_calendar_date on dim_calendar(calendar_date)') into @a;
PREPARE stmt1 FROM @a;
EXECUTE stmt1;
DEALLOCATE PREPARE stmt1;