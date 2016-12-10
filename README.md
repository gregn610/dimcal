# Dim Calendar Holidays.

A collection of public holiday data in SQL format, to use in a data warehouse.

[![Build Status](https://travis-ci.org/gregn610/dimcal.svg?branch=master)](https://travis-ci.org/gregn610/dimcal)

<h2>How to use dim_calendar</h2>
 * Wait for [Release 1.0](https://github.com/gregn610/dimcal/releases)
 * Create the [dim_calendar](./src/dimcal/sql/dim_calendar.sql) table, complete with all of the calc_* columns
 * Apply all of the [calc_*.sql](./src/dimcal/sql/) columns in numerical order
 * Apply the [hol_*.sql](./src/dimcal/sql/) files for the countries you choose
 * Optionally, drop the calc_* columns


<h2>Countries List</h2>
 * [Austria](./src/dimcal/sql/hol_at.sql)
 * [Belgium](./src/dimcal/sql/hol_be.sql)
 * [Bulgaria](./src/dimcal/sql/hol_bg.sql)
 * [Canada - AB](./src/dimcal/sql/hol_ca_ab.sql)
 * [Canada - BC](./src/dimcal/sql/hol_ca_bc.sql)
 * [Canada - FED](./src/dimcal/sql/hol_ca_fed.sql)
 * [Canada - MB](./src/dimcal/sql/hol_ca_mb.sql)
 * [Canada - NAT](./src/dimcal/sql/hol_ca_na.sql)
 * [Canada - NB](./src/dimcal/sql/hol_ca_nb.sql)
 * [Canada - NL](./src/dimcal/sql/hol_ca_nl.sql)
 * [Canada - NS](./src/dimcal/sql/hol_ca_ns.sql)
 * [Canada - NT](./src/dimcal/sql/hol_ca_nt.sql)
 * [Canada - NU](./src/dimcal/sql/hol_ca_nu.sql)
 * [Canada - ON](./src/dimcal/sql/hol_ca_on.sql)
 * [Canada - PE](./src/dimcal/sql/hol_ca_pe.sql)
 * [Canada - QC](./src/dimcal/sql/hol_ca_qc.sql)
 * [Canada - SK](./src/dimcal/sql/hol_ca_sk.sql)
 * [Canada - YT](./src/dimcal/sql/hol_ca_yt.sql)
 * [Croatia](./src/dimcal/sql/hol_hr.sql)
 * [Cyprus](./src/dimcal/sql/hol_cy.sql)
 * [Czech Republic](./src/dimcal/sql/hol_cz.sql)
 * [Denmark](./src/dimcal/sql/hol_dk.sql)
 * [Estonia](./src/dimcal/sql/hol_ee.sql)
 * [Finland](./src/dimcal/sql/hol_fi.sql)
 * [France](./src/dimcal/sql/hol_fr.sql)
 * [Greece](./src/dimcal/sql/hol_gr.sql)
 * [Hungary](./src/dimcal/sql/hol_hu.sql)
 * [Ireland](./src/dimcal/sql/hol_ie.sql)
 * [Italy](./src/dimcal/sql/hol_it.sql)
 * [Lithuania](./src/dimcal/sql/hol_lt.sql)
 * [Luxembourg](./src/dimcal/sql/hol_lu.sql)
 * [Madagascar](./src/dimcal/sql/hol_mg.sql)
 * [Malta](./src/dimcal/sql/hol_mt.sql)
 * [Netherlands](./src/dimcal/sql/hol_nl.sql)
 * [Panama](./src/dimcal/sql/hol_pa.sql)
 * [Poland](./src/dimcal/sql/hol_pl.sql)
 * [Portugal](./src/dimcal/sql/hol_pt.sql)
 * [Romania](./src/dimcal/sql/hol_ro.sql)
 * [Slovenia](./src/dimcal/sql/hol_si.sql)
 * [Slovakia](./src/dimcal/sql/hol_sk.sql)
 * [South Africa](./src/dimcal/sql/hol_za.sql)
 * [Spain](./src/dimcal/sql/hol_es_nat.sql)
 * [United Kingdom - England &amp; Wales](./src/dimcal/sql/hol_gb_eng_wls.sql)
 * [United Kingdom - Northern Ireland](./src/dimcal/sql/hol_gb_nir.sql)
 * [United Kingdom - Scotland](./src/dimcal/sql/hol_gb_sct.sql)
 * [United States of America - Federal](./src/dimcal/sql/hol_us_fed.sql)
 * 