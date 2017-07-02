# Dim Calendar Holidays.

A collection of public holiday data in SQL format, to use in a data warehouse. 

Now available for PL/pgSQL and MySQL

[![Build Status](https://travis-ci.org/gregn610/dimcal.svg?branch=master)](https://travis-ci.org/gregn610/dimcal)

## How to use dim_calendar
 * Wait for release v1.0.0. Pre-releases are working but not yet extensively tested.
 * Download and extract the release tarball [dim_calendar.tar.gz](https://github.com/gregn610/dimcal/releases)
 * Create the __dim_calendar__ table with `table.sql`. You can add and remove any columns except for __calendar_date__
 * Populate dim_calendar primary keys with `common.sql`
 * Optionally, apply `calculations.sql` if those columns are of interest
 * Apply the `data.sql` files for the countries you choose


## European Union Countries
 * Austria
 * Belgium
 * Bulgaria
 * Croatia
 * Cyprus
 * Czech Republic
 * Denmark
 * Estonia
 * Finland
 * France
 * Germany - BW
 * Germany - BY
 * Germany - BE
 * Germany - BB
 * Germany - GDR
 * Germany - HB
 * Germany - HH
 * Germany - HE
 * Germany - MV
 * Germany - NI
 * Germany - NW
 * Germany - RP
 * Germany - SL
 * Germany - SN
 * Germany - ST
 * Germany - SH
 * Germany - TH
 * Greece
 * Hungary
 * Ireland
 * Italy
 * Latvia
 * Lithuania
 * Luxembourg
 * Malta
 * Netherlands
 * Poland
 * Portugal
 * Romania
 * Slovenia
 * Slovakia
 * Spain - National
 * Sweden
 * United Kingdom - England &amp; Wales
 * United Kingdom - Northern Ireland
 * United Kingdom - Scotland



## More Countries
 * Canada - AB
 * Canada - BC
 * Canada - FED
 * Canada - MB
 * Canada - NAT
 * Canada - NB
 * Canada - NL
 * Canada - NS
 * Canada - NT
 * Canada - NU
 * Canada - ON
 * Canada - PE
 * Canada - QC
 * Canada - SK
 * Canada - YT
 * Madagascar
 * Panama 
 * South Africa 
 * Uruguay 
 * United States of America - Federal 
