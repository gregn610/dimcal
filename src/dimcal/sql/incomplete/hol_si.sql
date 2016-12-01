-- Slovenia

BEGIN;

WIP 




UPDATE dim_calendar
SET hol_si = FALSE
;


-- 1 January	New Year	novo leto	State holiday, work-free.[2][3]
UPDATE dim_calendar
SET hol_si = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 1
AND   EXTRACT( MONTH FROM calendar_date) = 1
; 


-- 8 February	Prešeren Day, the Slovenian Cultural Holiday	Prešernov dan, slovenski kulturni praznik	State holiday, work-free. Anniversary of the death of Slovenian poet France Prešeren, established as the national cultural day in 1944, work-free since 1991.[4]
UPDATE dim_calendar
SET hol_si = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 8
AND   EXTRACT( MONTH FROM calendar_date) = 2
; 

-- -	Easter Sunday and Monday	velikonočna nedelja in ponedeljek, velika noč	Work-free days, in March or April (date varies).

-- 27 April	Day of Uprising Against Occupation	dan upora proti okupatorju	State holiday, work-free. 
UPDATE dim_calendar
SET hol_si = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 27
AND   EXTRACT( MONTH FROM calendar_date) = 4
; 


-- 1 May – 2 May	May Day Holiday	praznik dela	State holiday, work-free from 1949.[3]
UPDATE dim_calendar
SET hol_si = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) IN (1, 2)
AND   EXTRACT( MONTH FROM calendar_date) = 5
; 


-- -	Whit Sunday	binkoštna nedelja, binkošti	Work-free day (it is always on Sunday), in May or June, fifty days after the Easter (date varies).

-- 8 June	Primož Trubar Day	dan Primoža Trubarja	State holiday, 
-- not work-free. Established in 2010.[5]

-- 25 June	Statehood Day	dan državnosti	State holiday, work-free. Commemorates the act of independence in 1991.
UPDATE dim_calendar
SET hol_si = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 25
AND   EXTRACT( MONTH FROM calendar_date) = 6
AND   EXTRACT(YEAR FROM calendar_date) >= 1991
; 


-- 15 August	Assumption Day	Marijino vnebovzetje (veliki šmaren)	Work-free day since 1992.[6]
UPDATE dim_calendar
SET hol_si = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 15
AND   EXTRACT( MONTH FROM calendar_date) = 8
AND   EXTRACT(YEAR FROM calendar_date) >= 1992
; 



-- 17 August	Day of Slovenes in Prekmurje Incorporated into the Mother Nation	združitev prekmurskih Slovencev z matičnim narodom	State holiday since 2006, not work-free.[7]
UPDATE dim_calendar
SET hol_si = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 17
AND   EXTRACT( MONTH FROM calendar_date) = 8
; 


-- 15 September	Day of Restoration of the Littoral Region to the Motherland	vrnitev Primorske k matični domovini	
-- State holiday since 2005, not work-free.[8]

-- 25 October	Sovereignty Day	dan suverenosti	State holiday since 2015, not work-free.[9]

-- 31 October	Reformation Day	dan reformacije	State holiday since 1992, work-free day.[10]
UPDATE dim_calendar
SET hol_si = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 31
AND   EXTRACT( MONTH FROM calendar_date) = 10
; 


-- 1 November	Day (of Remembrance) of the Dead	dan spomina na mrtve or dan mrtvih	State holiday, work-free. 
-- Before 1991, in the time of the Socialist Republic of Slovenia, it was named dan mrtvih ('day of the dead').[11]
UPDATE dim_calendar
SET hol_si = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 1
AND   EXTRACT( MONTH FROM calendar_date) = 11
; 


-- 23 November	Rudolf Maister Day	dan Rudolfa Maistra	State holiday since 2005, not work-free.[12]
UPDATE dim_calendar
SET hol_si = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 23
AND   EXTRACT( MONTH FROM calendar_date) = 11
AND   EXTRACT(YEAR FROM calendar_date) >= 2005
; 


-- 25 December	Christmas	božič	Work-free day. Abolished in 1953 and re-instituted in 1991.[3]
UPDATE dim_calendar
SET hol_si = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 25
AND   EXTRACT( MONTH FROM calendar_date) = 12
AND   EXTRACT(YEAR FROM calendar_date) NOT BETWEEN 1953 AND 1991
; 


-- 26 December	Independence and Unity Day	dan samostojnosti in enotnosti	State holiday, work free. 
--Commemorates the proclamation of the independence plebiscite results in 1990.
UPDATE dim_calendar
SET hol_si = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 26
AND   EXTRACT( MONTH FROM calendar_date) = 6
AND   EXTRACT(YEAR FROM calendar_date) >= 1991
; 




COMMIT;
