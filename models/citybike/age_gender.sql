SELECT  
gender, (extract(year from current_date) - birth_year) as age, count(*) as number_of_trips
FROM `bigquery-public-data.new_york_citibike.citibike_trips`
where starttime >= '2018-05-01'
group by gender, age
order by gender, age