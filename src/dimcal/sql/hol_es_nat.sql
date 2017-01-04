-- Spain National

BEGIN;

UPDATE dim_calendar
SET hol_es_nat = FALSE
;




-- January 1	New Year's Day (national holiday)	Año Nuevo	Yes	Yes	Yes	Yes	Yes	Yes	Yes	Yes	Yes	Yes	Yes	Yes	Yes	Yes	Yes	Yes	Yes	Yes
UPDATE dim_calendar
SET hol_es_nat = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 1
AND   EXTRACT( MONTH FROM calendar_date) = 1
;


-- January 6	Epiphany (national holiday)	Día de Reyes / Epifanía del Señor	Yes	Yes	Yes	Yes	Yes	Yes	Yes	Yes	Yes	Yes	Yes	Yes	Yes	Yes	Yes	Yes	Yes	Yes
UPDATE dim_calendar
SET hol_es_nat = TRUE
WHERE calc_western_epiphany = TRUE
;


-- February 28	Regional Holiday	Día de Andalucía	Yes

-- March 1	Regional Holiday	Dia de les Illes Balears										Yes

-- March 19	St. Joseph's Day	San José			ML	Yes	Yes			Yes	Yes		Yes	Yes	Yes	Yes				Yes

-- March or April	Maundy Thursday	Jueves Santo	Yes	Yes	Yes	Yes	Yes	Yes		Yes	Yes	Yes	Yes	Yes	Yes	Yes	Yes	Yes	Yes
-- Good Friday (national holiday)	Viernes Santo	Yes	Yes	Yes	Yes	Yes	Yes	Yes	Yes	Yes	Yes	Yes	Yes	Yes	Yes	Yes	Yes	Yes	Yes
UPDATE dim_calendar
SET hol_es_nat = TRUE
WHERE calc_western_good_fri = TRUE
;


-- Easter Monday	Lunes de Pascua							Yes			Yes				Yes		Yes		Yes

-- April 23	Regional Holiday	San Jorge (Día de Aragón)		Yes

-- Día de Castilla y León				Yes
-- May 1	Labour Day (national holiday)	Día del Trabajador	Yes	Yes	Yes	Yes	Yes	Yes	Yes	Yes	Yes	Yes	Yes	Yes	Yes	Yes	Yes	Yes	Yes	Yes
UPDATE dim_calendar
SET hol_es_nat = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 1
AND   EXTRACT( MONTH FROM calendar_date) = 5
;


-- May 2	Regional Holiday	Fiesta de la Comunidad de Madrid												Yes

-- May 17	Regional Holiday (Galician Literature Day)	Día das Letras Galegas									Yes

-- May 30	Regional Holiday	Día de Canarias						Yes

-- May 31	Regional Holiday	Día de la Región Castilla-La Mancha					Yes

-- May or June	Corpus Christi	Corpus Christi												Yes

-- June 9	Regional Holiday	Día de la Región de Murcia													Yes

-- Día de La Rioja											Yes

-- June 24	St. John's Day	Sant Joan							Yes

-- July 25	Saint James	Santiago Apóstol									Yes

-- August 15	Assumption (national holiday)	Asunción	Yes	Yes	Yes	Yes	Yes	Yes	Yes	Yes	Yes	Yes	Yes	Yes	Yes	Yes	Yes	Yes	Yes	Yes
UPDATE dim_calendar
SET hol_es_nat = TRUE
WHERE calc_western_assumption = TRUE
;


-- September 2	Municipal Holiday	Día de Ceuta			CE

-- September 8	Regional Holiday	Día de Asturias															Yes

-- Día de Extremadura								Yes

-- September 11	National Day of Catalonia	Diada Nacional de Catalunya							Yes
-- UPDATE dim_calendar
-- SET hol_es_nat = TRUE
-- WHERE EXTRACT( DAY   FROM calendar_date) = 11
-- AND   EXTRACT( MONTH FROM calendar_date) = 9
-- ;


-- September 15	Regional Holiday	Día de Cantabria																	Yes

-- October 9	Regional Holiday	Dia de la Comunitat Valenciana																		Yes

-- October 12	Fiesta Nacional de España (national holiday)	Fiesta Nacional de España	Yes	Yes	Yes	Yes	Yes	Yes	Yes	Yes	Yes	Yes	Yes	Yes	Yes	Yes	Yes	Yes	Yes	Yes
UPDATE dim_calendar
SET hol_es_nat = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 12
AND   EXTRACT( MONTH FROM calendar_date) = 10
;


-- October 25	Regional Holiday (from 2011)	Euskadi Eguna																Yes[4]

-- November 1	All Saints Day (national holiday)	Día de todos los Santos	Yes	Yes	Yes	Yes	Yes	Yes	Yes	Yes	Yes	Yes	Yes	Yes	Yes	Yes	Yes	Yes	Yes	Yes
UPDATE dim_calendar
SET hol_es_nat = TRUE
WHERE calc_western_all_saints = TRUE
;



-- December 6	Constitution Day (national holiday)	Día de la Constitución	Yes	Yes	Yes	Yes	Yes	Yes	Yes	Yes	Yes	Yes	Yes	Yes	Yes	Yes	Yes	Yes	Yes	Yes
UPDATE dim_calendar
SET hol_es_nat = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 6
AND   EXTRACT( MONTH FROM calendar_date) = 12
;


-- December 8	Immaculate Conception (national holiday)	Inmaculada Concepción	Yes	Yes	Yes	Yes	Yes	Yes	Yes	Yes	Yes	Yes	Yes	Yes	Yes	Yes	Yes	Yes	Yes	Yes
UPDATE dim_calendar
SET hol_es_nat = TRUE
WHERE calc_western_immaculate_con = TRUE
;


-- December 25	Christmas Day (national holiday)	Navidad	Yes	Yes	Yes	Yes	Yes	Yes	Yes	Yes	Yes	Yes	Yes	Yes	Yes	Yes	Yes	Yes	Yes	Yes
UPDATE dim_calendar
SET hol_es_nat = TRUE
WHERE calc_western_christmas = TRUE
;


-- December 26	St. Stephen's Day	Sant Esteve							Yes			Yes

-- Variable Islamic	Feast of the Sacrifice or Eid al-Adha	Celebración del Sacrificio			Yes


COMMIT;