SELECT AREA_NAME, count(*) as area_count
from crime_data_from_2020_to_present
group by AREA_NAME
order by area_count desc