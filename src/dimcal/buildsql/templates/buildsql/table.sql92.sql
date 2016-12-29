-- Table SQL92

CREATE TABLE dim_calendar (
     dim_calendar_pk INTEGER PRIMARY KEY
    ,calendar_date             DATE NOT NULL

    -- Optional calculation columns {% for calc in calcs %}
    ,calc_{{ calc }}           BOOLEAN DEFAULT FALSE {% endfor %}

    -- Pick and choose countries {% for country in countries %}
    ,hol_{{ country }}         BOOLEAN DEFAULT FALSE {% endfor %}
);

CREATE UNIQUE INDEX idx_dim_calendar_calendar_date ON dim_calendar (calendar_date);

