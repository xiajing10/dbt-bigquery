with cte as (select 
extract(year from start_time) as year, subscriber_type, sum(duration_minutes) as total_duration
from `bigquery-public-data.austin_bikeshare.bikeshare_trips`
group by year, subscriber_type)
select  year, subscriber_type from(
select  year, subscriber_type, total_duration,
ROW_NUMBER() OVER (
    PARTITION BY year
    ORDER BY total_duration desc
) rn
from cte )
where rn = 1
order by year desc


