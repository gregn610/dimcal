#!/usr/bin/env python3
# Thanks : http://stackoverflow.com/a/19222808/266387
import requests
import lxml.html
import sys

server = 'http://localhost:8000'
root = 'dim_calendar'
dom = lxml.html.fromstring(requests.get(server +'/'+ root).content)

all_links = [x for x in dom.xpath('//a/@href') if 'github.com' not in x ]

[print(server + l ) for l in all_links]

if all_links:
    sys.exit(0)
else:
    sys.exit(1)