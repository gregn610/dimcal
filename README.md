# Dim Calendar Holidays.

A collection of public holiday data in SQL format, to use in a data warehouse.

[![Build Status](https://travis-ci.org/gregn610/dimcal.svg?branch=master)](https://travis-ci.org/gregn610/dimcal)

<h2>How to use dim_calendar</h2>
 * Wait for <a href="./releases/">Release 1.0</a>
 * Create the <a href="./tree/master/src/dimcal/sql/dim_calendar.sql">dim_calendar</a> table, complete with all of the calc_* columns
 * Apply all of the <a href="./tree/master/src/dimcal/sql/">calc_*.sql</a> columns in numerical order
 * Apply the <a href="./tree/master/src/dimcal/sql/">hol_*.sql</a> files for the countries you choose
 * Optionally, drop the calc_* columns

<h2>Countries List</h2>
<h3>Europe</h3>
 * AT
 * BE
 * BG
 * CY
 * CZ
 * DK
 * EE
 * ES_NAT
 * FI
 * FR
 * GB_ENG_WLS
 * GB_SCT
 * GB_NIR
 * GR
 * HR
 * HU
 * IE
 * IT
 * LT
 * LU
 * LV
 * MT
 * NL
 * PL
 * PT
 * RO
 * SI
 * SK

<h3>North America</h3>
 * CA_AB
 * CA_BC
 * CA_FED
 * CA_MB
 * CA_NAT
 * CA_NB
 * CA_NL
 * CA_NS
 * CA_NT
 * CA_NU
 * CA_ON
 * CA_PE
 * CA_QC
 * CA_SK
 * CA_YT
 * US_FED

<h3>Africa</h3>
 * MG
 * ST
 * ZA

