select 
s.city,
round(
  sum(
    case when ss.city = es.city 
      and t.start_station_id <> t.end_station_id
    then
      0.5
    else
      1
    end
  ) / (select count(*) from trip)
  ,4
) as ratio

from trip t join station s on
  t.start_station_id = s.station_id or 
  t.end_station_id = s.station_id
join station ss on
  t.start_station_id = ss.station_id
join station es on
  t.end_station_id = es.station_id
group by s.city
order by ratio, s.city 
;

/*result

Redwood City |0.0052
Palo Alto    |0.0109
Mountain View|0.0278
San Jose     |0.0566
San Francisco|0.9011
 */
