{{ 
    dbt_utils.date_spine(
        datepart="day",
        start_date="to_date('01/01/2018', 'dd/mm/yyyy')",
        end_date="dateadd(week, 1, current_date)"
    )
}}