{% macro test_column() %}

    {%- set query -%}

        select true as bool, 1 as id, 0 as bk_customer, 'asdf' as load_dts, 'cads' as rec_src
        
    {%- endset -%}

    {%- set list_test=['LOAD_', 'BK_', 'HSH_DIFF', 'REC_SRC'] -%}
    {%- set valid=[] -%}

    {%- if execute -%}
        {%- set results=run_query(query).columns.keys() -%}
        {{ log('SQL results ' ~ results, info=True) }}

        {%- for col in results -%}
        
            {%- if list_test[0] not in col and list_test[1] not in col and list_test[2] not in col and list_test[3] not in col -%}

                {%- do valid.append(col) %}

            {% endif %}

        {%- endfor -%}
        
    {% endif %}
    {{valid}}
    
{% endmacro %}

{{test_column()}}