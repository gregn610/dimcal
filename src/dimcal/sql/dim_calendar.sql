/* PostgreSQL Dialect */

CREATE TABLE IF NOT EXISTS dim_calendar (
     dim_calendar_pk INTEGER PRIMARY KEY
    ,calendar_date             DATE NOT NULL
    --
    ,calc_full_moon            BOOLEAN DEFAULT FALSE
    --
    ,calc_western_epiphany          BOOLEAN DEFAULT FALSE
    ,calc_western_clean_mon         BOOLEAN DEFAULT FALSE
    ,calc_western_annunciation      BOOLEAN DEFAULT FALSE
    ,calc_western_ash_wed           BOOLEAN DEFAULT FALSE
    ,calc_western_palm_sun          BOOLEAN DEFAULT FALSE
    ,calc_western_holy_thu          BOOLEAN DEFAULT FALSE
    ,calc_western_good_fri          BOOLEAN DEFAULT FALSE
    ,calc_western_easter_sat        BOOLEAN DEFAULT FALSE
    ,calc_western_easter_sun        BOOLEAN DEFAULT FALSE
    ,calc_western_easter_mon        BOOLEAN DEFAULT FALSE
    ,calc_western_all_saints        BOOLEAN DEFAULT FALSE
    ,calc_western_immaculate_con    BOOLEAN DEFAULT FALSE
    ,calc_western_christmas_eve     BOOLEAN DEFAULT FALSE
    ,calc_western_christmas         BOOLEAN DEFAULT FALSE
    ,calc_western_ascension_thu     BOOLEAN DEFAULT FALSE
    ,calc_western_assumption        BOOLEAN DEFAULT FALSE
    ,calc_western_whit_sun          BOOLEAN DEFAULT FALSE
    ,calc_western_whit_mon          BOOLEAN DEFAULT FALSE
    ,calc_western_corpuschristi_thu BOOLEAN DEFAULT FALSE
    --
    ,hol_at                     BOOLEAN DEFAULT FALSE
    ,hol_be                     BOOLEAN DEFAULT FALSE
    ,hol_bg                     BOOLEAN DEFAULT FALSE
    ,hol_ca_ab                  BOOLEAN DEFAULT FALSE
    ,hol_ca_bc                  BOOLEAN DEFAULT FALSE
    ,hol_ca_fed                 BOOLEAN DEFAULT FALSE
    ,hol_ca_mb                  BOOLEAN DEFAULT FALSE
    ,hol_ca_nat                 BOOLEAN DEFAULT FALSE
    ,hol_ca_nb                  BOOLEAN DEFAULT FALSE
    ,hol_ca_nl                  BOOLEAN DEFAULT FALSE
    ,hol_ca_ns                  BOOLEAN DEFAULT FALSE
    ,hol_ca_nt                  BOOLEAN DEFAULT FALSE
    ,hol_ca_nu                  BOOLEAN DEFAULT FALSE
    ,hol_ca_on                  BOOLEAN DEFAULT FALSE
    ,hol_ca_pe                  BOOLEAN DEFAULT FALSE
    ,hol_ca_qc                  BOOLEAN DEFAULT FALSE
    ,hol_ca_sk                  BOOLEAN DEFAULT FALSE
    ,hol_ca_yt                  BOOLEAN DEFAULT FALSE
    ,hol_cy                     BOOLEAN DEFAULT FALSE
    ,hol_cz                     BOOLEAN DEFAULT FALSE
    ,hol_dk                     BOOLEAN DEFAULT FALSE
    ,hol_ee                     BOOLEAN DEFAULT FALSE
    ,hol_es_nat                 BOOLEAN DEFAULT FALSE
    ,hol_fi                     BOOLEAN DEFAULT FALSE
    ,hol_fr                     BOOLEAN DEFAULT FALSE
    ,hol_gb_eng_wls             BOOLEAN DEFAULT FALSE
    ,hol_gb_sct                 BOOLEAN DEFAULT FALSE
    ,hol_gb_nir                 BOOLEAN DEFAULT FALSE
    ,hol_gr                     BOOLEAN DEFAULT FALSE
    ,hol_hr                     BOOLEAN DEFAULT FALSE
    ,hol_hu                     BOOLEAN DEFAULT FALSE
    ,hol_ie                     BOOLEAN DEFAULT FALSE
    ,hol_it                     BOOLEAN DEFAULT FALSE
    ,hol_lt                     BOOLEAN DEFAULT FALSE
    ,hol_lu                     BOOLEAN DEFAULT FALSE
    ,hol_lv                     BOOLEAN DEFAULT FALSE
    ,hol_mg                     BOOLEAN DEFAULT FALSE
    ,hol_mt                     BOOLEAN DEFAULT FALSE
    ,hol_nl                     BOOLEAN DEFAULT FALSE
    ,hol_pa                     BOOLEAN DEFAULT FALSE
    ,hol_pl                     BOOLEAN DEFAULT FALSE
    ,hol_pt                     BOOLEAN DEFAULT FALSE
    ,hol_ro                     BOOLEAN DEFAULT FALSE
    ,hol_si                     BOOLEAN DEFAULT FALSE
    ,hol_sk                     BOOLEAN DEFAULT FALSE
    ,hol_st                     BOOLEAN DEFAULT FALSE
    ,hol_us_fed                 BOOLEAN DEFAULT FALSE
    ,hol_za                     BOOLEAN DEFAULT FALSE
);


