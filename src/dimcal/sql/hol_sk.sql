-- Slovakia

BEGIN;

UPDATE dim_calendar
SET hol_sk = FALSE
;


-- 1 January (1993)	Day of the Establishment of the Slovak Republic	Deň vzniku Slovenskej republiky
-- Czechoslovakia split into the Czech Republic and Slovakia
UPDATE dim_calendar
SET hol_sk = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 1
AND   EXTRACT( MONTH FROM calendar_date) = 1
-- AND   EXTRACT( YEAR FROM calendar_date) >= 1993
; 


-- 6 January	Epiphany (The Three Magi and Christmas Day of Orthodox Christians)	Zjavenie Pána (Traja králi a vianočný sviatok pravoslávnych kresťanov)	
UPDATE dim_calendar
SET hol_sk = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 6
AND   EXTRACT( MONTH FROM calendar_date) = 1
; 


-- March, April	Good Friday	Veľkonočný piatok	
UPDATE dim_calendar
SET hol_sk = TRUE
WHERE calc_western_good_fri = TRUE
; 


-- March, April	Easter Monday	Veľkonočný pondelok	See also Dyngus Day
UPDATE dim_calendar
SET hol_sk = TRUE
WHERE calc_western_easter_mon = TRUE
; 


-- 1 May (1886)	International Workers' Day	Sviatok práce	
UPDATE dim_calendar
SET hol_sk = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 1
AND   EXTRACT( MONTH FROM calendar_date) = 5
; 


-- 8 May (1945)	Day of victory over fascism	Deň víťazstva nad fašizmom	The end of World War II in Europe; initially celebrated one day later
UPDATE dim_calendar
SET hol_sk = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 8
AND   EXTRACT( MONTH FROM calendar_date) = 5
; 


-- 5 July (863)	St. Cyril and Methodius Day	Sviatok svätého Cyrila a Metoda	Slavic missionaries Cyril (Constantine) and Metod (Methodius) came to Great Moravia (see also Glagolitic alphabet)
UPDATE dim_calendar
SET hol_sk = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 5
AND   EXTRACT( MONTH FROM calendar_date) = 7
; 


-- 29 August (1944)	Slovak National Uprising anniversary	Výročie Slovenského národného povstania	The Slovaks rose up against Nazi Germany
UPDATE dim_calendar
SET hol_sk = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 29
AND   EXTRACT( MONTH FROM calendar_date) = 8
; 


-- 1 September (1992)	Day of the Constitution of the Slovak Republic	Deň Ústavy Slovenskej republiky	The constitution of (future) independent Slovakia was adopted in Bratislava
UPDATE dim_calendar
SET hol_sk = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 1
AND   EXTRACT( MONTH FROM calendar_date) = 9
; 


-- 15 September	Day of Our Lady of the Seven Sorrows, patron saint of Slovakia	Sviatok Panny Márie Sedembolestnej, patrónky Slovenska	The Patron saint of Slovakia is Our Lady of the Seven Sorrows
UPDATE dim_calendar
SET hol_sk = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 15
AND   EXTRACT( MONTH FROM calendar_date) = 9
; 


-- 1 November	All Saints’ Day	Sviatok všetkých svätých	Cemeteries are visited on or around this day
UPDATE dim_calendar
SET hol_sk = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 1
AND   EXTRACT( MONTH FROM calendar_date) = 11
; 


-- 17 November (1989/1939)	Struggle for Freedom and Democracy Day	Deň boja za slobodu a demokraciu	Commemorating the student demonstration against Nazi occupation in 1939, and 
-- especially the demonstration in 1989 in Bratislava and Prague considered to mark the beginning of the Velvet Revolution.
UPDATE dim_calendar
SET hol_sk = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 17
AND   EXTRACT( MONTH FROM calendar_date) = 11
; 


-- 24 December	Christmas Eve	Štedrý deň	In Slovakia, Christmas presents are opened in the evening on Christmas Eve
UPDATE dim_calendar
SET hol_sk = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 24
AND   EXTRACT( MONTH FROM calendar_date) = 12
; 


-- 25 December	Christmas Day	Prvý sviatok vianočný	Literally, First Christmas Holiday
UPDATE dim_calendar
SET hol_sk = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 25
AND   EXTRACT( MONTH FROM calendar_date) = 12
; 


-- 26 December	St. Stephen's Day	Druhý sviatok vianočný	Literally, Second Christmas Holiday
UPDATE dim_calendar
SET hol_sk = TRUE
WHERE EXTRACT( DAY   FROM calendar_date) = 26
AND   EXTRACT( MONTH FROM calendar_date) = 12
; 



COMMIT;
