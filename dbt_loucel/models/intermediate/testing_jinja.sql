{# comment #}

-- comment quoi


{% set my_long_variable %}

    SELECT 1 AS my_col

{% endset %}

{% set my_list = ['user_id', 'created_at'] %}


SELECT 
{% for item in my_list %}
    {{ item }} {% if not loop.last %}, {% endif %}
{% endfor %}


