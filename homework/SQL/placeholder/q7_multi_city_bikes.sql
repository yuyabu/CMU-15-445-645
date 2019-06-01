with bike_stations as (
  select bike_id,start_station_id station_id from trip
  union 
  select bike_id,end_station_id from trip
),bike_citys as (
  select bike_id,s.city from bike_stations bs
  join  station s
  on bs.station_id = s.station_id
)

select bike_id,count(distinct city) cnt  from bike_citys
group by bike_id having count(distinct city) > 1
order by cnt desc,bike_id asc
