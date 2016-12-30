-- Table PL/pgSQL

CREATE TABLE IF NOT EXISTS dim_calendar (
     dim_calendar_pk INTEGER PRIMARY KEY
    ,calendar_date             DATE NOT NULL

    -- Optional calculation columns {% for calc in calcs %}
    ,calc_{{ calc }}           BOOLEAN DEFAULT FALSE {% endfor %}

    -- Pick and choose countries {% for country in countries %}
    ,hol_{{ country }}         BOOLEAN DEFAULT FALSE {% endfor %}
);

-- Retro syntax to support older versions
DO $$
BEGIN

IF to_regclass('public.idx_dim_calendar_calendar_date') IS NULL THEN
    CREATE INDEX idx_dim_calendar_calendar_date ON public.dim_calendar (calendar_date);
END IF;

END$$;
