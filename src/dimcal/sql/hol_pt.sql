-- Portugal

BEGIN;

UPDATE dim_calendar
SET hol_pt = FALSE
;


-- 1 January	Solemnity of Mary, Mother of God	Solenidade de Santa Maria, Mãe de Deus		Yes	Yes
UPDATE dim_calendar
SET hol_pt = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 1
AND   EXTRACT( MONTH FROM calendar_date) = 1
;


-- moveable	Carnival	Carnaval	Carnival in Portugal is an annual festival, that ends on Shrove Tuesday (called
-- Fat Tuesday in Madeira - Terça-feira Gorda in Portuguese) the day before Ash Wednesday (first day of Lent).
-- This is an optional holiday, although it is usually observed. 
-- 47 days before Easter Sunday.	Yes	Yes
WITH cte AS (
    SELECT ( calendar_date  - INTERVAL '48 DAYS'   ) AS easter_mon_minus_48
    FROM dim_calendar 
    WHERE calc_western_easter_mon = TRUE
)
UPDATE dim_calendar
SET hol_pt = TRUE
FROM cte
WHERE dim_calendar.calendar_date = cte.easter_mon_minus_48
; 


-- moveable	Good Friday	Sexta-feira Santa	Friday before Easter Sunday	Yes	Yes
UPDATE dim_calendar
SET hol_pt = TRUE
WHERE calc_western_good_fri = TRUE
; 


-- moveable	Easter	Domingo de Páscoa	Sunday, date varies. *	Yes	Yes
UPDATE dim_calendar
SET hol_pt = TRUE
WHERE calc_western_easter_sun = TRUE
; 


-- 25 April	Freedom Day	Dia da Liberdade	Celebrates the 1974 coup d'état that ended the Dictatorship and started
-- Democracy	Yes	Yes
UPDATE dim_calendar
SET hol_pt = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 25
AND   EXTRACT( MONTH FROM calendar_date) = 4
; 


-- 1 May	Labour Day	Dia do Trabalhador	Similar to Labor Day celebrated worldwide.	Yes	Yes
UPDATE dim_calendar
SET hol_pt = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 1
AND   EXTRACT( MONTH FROM calendar_date) = 5
; 


-- moveable	Corpus Christi (feast)	Corpo de Deus	Thursday, date varies. 60 days after Easter Sunday.
-- It is religion based.	Yes	Yes
UPDATE dim_calendar
SET hol_pt = TRUE
WHERE calc_western_corpuschristi_thu = TRUE
AND ((EXTRACT( YEAR  FROM calendar_date) < 2013)
  OR (EXTRACT( YEAR  FROM calendar_date) > 2015)
  )
;


-- -- 1 June	Azores Day	Dia dos Açores
-- -- Celebrated in Azores		Yes
-- UPDATE dim_calendar
-- SET hol_pt = TRUE
-- WHERE EXTRACT( DAY   FROM calendar_date) = 1
-- AND   EXTRACT( MONTH FROM calendar_date) = 6
-- ;


-- 10 June	Portugal Day	Dia de Portugal, de Camões e das Comunidades Portuguesas	National Day	Yes	Yes
UPDATE dim_calendar
SET hol_pt = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 10
AND   EXTRACT( MONTH FROM calendar_date) = 6
; 


-- -- 1 July	Madeira Day	Dia da Madeira	Celebrated in Madeira Island	Yes
-- UPDATE dim_calendar
-- SET hol_pt = TRUE
-- WHERE EXTRACT( DAY   FROM calendar_date) = 1
-- AND   EXTRACT( MONTH FROM calendar_date) = 7
-- ;


-- 15 August	Assumption	Assunção de Nossa Senhora	A religious account of the taking up of Mary into heaven.
UPDATE dim_calendar
SET hol_pt = TRUE
WHERE calc_western_assumption = TRUE
; 


-- 5 October	Republic Day	Implantação da República	Celebrates the end of Monarchy and the beginning of the
-- Portuguese Republic	Yes	Yes
UPDATE dim_calendar
SET hol_pt = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 5
AND   EXTRACT( MONTH FROM calendar_date) = 10
AND ((EXTRACT( YEAR  FROM calendar_date) < 2013)
  OR (EXTRACT( YEAR  FROM calendar_date) > 2015)
  )
; 


-- 1 November	All Saints Day	Dia de Todos-os-Santos	In terms of Western Christian theology, the feast commemorates
-- all those who have attained the beatific vision in heaven.	Yes	Yes
UPDATE dim_calendar
SET hol_pt = TRUE
WHERE calc_western_all_saints = TRUE
AND ((EXTRACT( YEAR  FROM calendar_date) < 2013)
  OR (EXTRACT( YEAR  FROM calendar_date) > 2015)
  )
;



-- 1 December	Restoration of Independence	Restauração da Independência	Celebrates the end of the Philippine
-- Dynasty (1580–1640)	Yes	Yes
UPDATE dim_calendar
SET hol_pt = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 1
AND   EXTRACT( MONTH FROM calendar_date) = 12
AND ((EXTRACT( YEAR  FROM calendar_date) < 2013)
  OR (EXTRACT( YEAR  FROM calendar_date) > 2015)
  )
; 


-- 8 December	Immaculate Conception	Imaculada Conceição	According to Roman Catholic Dogma, the conception of the
-- Virgin Mary without any stain of original sin	Yes	Yes
UPDATE dim_calendar
SET hol_pt = TRUE
WHERE calc_western_immaculate_con = TRUE
; 


-- 25 December	Christmas Day	Natal		Yes	Yes
UPDATE dim_calendar
SET hol_pt = TRUE
WHERE calc_western_christmas = TRUE
; 


-- -- 26 December	Boxing Day	Segunda Oitava	"Segunda Oitava" is part of Madeira's centuries old Christmas
-- -- celebrations which has been recognized as bank holiday[1] by the Regional Government of Madeira.	Yes
-- UPDATE dim_calendar
-- SET hol_pt = TRUE
-- WHERE EXTRACT( DAY   FROM calendar_date) = 26
-- AND   EXTRACT( MONTH FROM calendar_date) = 12
-- ;




COMMIT;
