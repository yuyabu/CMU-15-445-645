select
    city,
    count(distinct station_id) as stations
from
    station
group by
    city
order by
    stations,
    city

;

/**result

Palo Alto|5
Mountain View|7
Redwood City|7
San Jose|16
San Francisco|35

**/
