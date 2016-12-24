#!/usr/bin/env python3
# Thanks : http://stackoverflow.com/a/19222808/266387
import requests
import lxml.html

root = 'http://localhost:8000/dim_calendar'
dom = lxml.html.fromstring(requests.get(root).content)

all_links = [x for x in dom.xpath('//a/@href') if 'github.com' not in x ]

[print(root + l ) for l in all_links]
