-- São Tomé and Príncipe

BEGIN;

UPDATE dim_calendar
SET hol_st = FALSE
;


-- January 1	New Year's Day	Ano Novo
UPDATE dim_calendar
SET hol_st = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 1
AND   EXTRACT( MONTH FROM calendar_date) = 1 
;


-- February 3	Martyrs' Day	Dia dos Mártires
UPDATE dim_calendar
SET hol_st = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 3
AND   EXTRACT( MONTH FROM calendar_date) = 2 
;


-- May 1	Labour Day	Dia do trabalhador
UPDATE dim_calendar
SET hol_st = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 1
AND   EXTRACT( MONTH FROM calendar_date) = 5 
;


-- July 12	Independence Day	Dia da Independência
UPDATE dim_calendar
SET hol_st = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 12
AND   EXTRACT( MONTH FROM calendar_date) = 7 
;


-- September 6	Armed Forces Day	Dia das Forças Armadas
UPDATE dim_calendar
SET hol_st = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 6
AND   EXTRACT( MONTH FROM calendar_date) = 9 
;


-- September 30	Agricultural Reform Day	Dia da Reforma Agrária
UPDATE dim_calendar
SET hol_st = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 30
AND   EXTRACT( MONTH FROM calendar_date) = 9 
;


-- November 1	All Saints Day	Todos os santos
UPDATE dim_calendar
SET hol_st = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 1
AND   EXTRACT( MONTH FROM calendar_date) = 11 
;


-- December 21	São Tomé Day	
UPDATE dim_calendar
SET hol_st = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 21
AND   EXTRACT( MONTH FROM calendar_date) = 12 
;


-- December 25	Christmas Day	Natal
UPDATE dim_calendar
SET hol_st = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 25
AND   EXTRACT( MONTH FROM calendar_date) = 12 
;



COMMIT;
