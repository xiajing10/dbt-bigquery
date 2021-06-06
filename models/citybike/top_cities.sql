SELECT
    'New York' AS city, sum(tripduration) as total_duration, count(tripduration) as duration_count
FROM
  `bigquery-public-data.new_york_citibike.citibike_trips` 
where date(starttime) between '2018-05-01' and '2018-05-31'

UNION all
SELECT
    'Austin' AS city, sum(duration_minutes) as total_duration, count(duration_minutes) as duration_count
FROM
  `bigquery-public-data.austin_bikeshare.bikeshare_trips`
where date(start_time) between '2018-05-01' and '2018-05-31'
