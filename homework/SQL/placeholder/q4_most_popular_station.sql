select 
  s.city,
  s.station_name,
  max(cnt)
from (

  select station_id,count(1) cnt
  from(
    select id,start_station_id as station_id
    from trip 
    union
    select id,end_station_id
    from trip
  )group by station_id
)tmp join station s 
on
  tmp.station_id = s.station_id
group by s.city order by s.city

/*result

Mountain View|Mountain View Caltrain Station          |12735
Palo Alto    |Palo Alto Caltrain Station              |3534
Redwood City |Redwood City Caltrain Station           |2654
San Francisco|San Francisco Caltrain (Townsend at 4th)|111738
San Jose     |San Jose Diridon Caltrain Station       |18782

 */

