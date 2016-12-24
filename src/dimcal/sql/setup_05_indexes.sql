-- Retro syntax to support older versions
DO $$
BEGIN

IF to_regclass('public.idx_dim_calendar_calendar_date') IS NULL THEN
    CREATE INDEX idx_dim_calendar_calendar_date ON public.dim_calendar (calendar_date);
END IF;

END$$;