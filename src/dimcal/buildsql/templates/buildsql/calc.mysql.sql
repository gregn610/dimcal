-- Optional calc columns MYSQL

BEGIN;

UPDATE dim_calendar
SET
{% for cc, cc_dates in calculations_dict.items %}    {{ cc }} = False{% if forloop.last is False %},
{%endif%}{% endfor%}
;

{% for cc, cc_dates in calculations_dict.items %}
UPDATE dim_calendar
SET {{ cc }} = True
WHERE calendar_date IN ({% for cd in cc_dates %}
    '{{ cd|date:"Y-m-d" }}'{% if forloop.last is False %}, {%endif%}{% endfor%}
);

{% endfor %}

COMMIT;