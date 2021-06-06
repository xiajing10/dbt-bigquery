SELECT
  min(start_station_name) AS start_station_name,
  start_station_id,
  sum(tripduration) AS total_duration,
  count(tripduration) AS total_trips
FROM
  `bigquery-public-data.new_york_citibike.citibike_trips` 
  where date(starttime) between '2018-05-24' and '2018-05-31'
GROUP BY 
    start_station_id
UNION all
SELECT
  min(start_station_name) AS start_station_name,
  start_station_id,
  sum(duration_minutes) AS total_duration,
  count(trip_id) AS total_trips
FROM
  `bigquery-public-data.austin_bikeshare.bikeshare_trips`
    where date(start_time) between '2018-05-24' and '2018-05-31'

GROUP BY 
    start_station_id
ORDER BY 
    total_duration DESC
limit 20