select TIME_OCC, count(*) as count from crime_data_from_2020_to_present
group by TIME_OCC 
order by count desc