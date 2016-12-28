-- {{ country }} T-SQL

BEGIN;

UPDATE dim_calendar
SET {{ country_col }} = False
;

{% for yr, object_list in year_dict.items %}
UPDATE dim_calendar
SET {{ country_col }} = True
WHERE calendar_date IN ({% for dc in object_list %}'{{ dc.calendar_date|date:"Y-m-d" }}'{% if forloop.last is False %}, {%endif%}{% endfor%}
);

{% endfor %}

COMMIT;
