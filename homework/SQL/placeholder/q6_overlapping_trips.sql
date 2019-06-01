with trips as (
  select * from trip t1 where bike_id between 100 and 200
)
select 
  t1.bike_id,
  t1.id,t1.start_time,t1.end_time,
  t2.id,t2.start_time,t2.end_time
from trips t1
join trips t2
on (
  t1.bike_id = t2.bike_id
  and t1.id < t2.id
)
where
  not(
  --t1 first
  t1.end_time <= t2.start_time
  or 
  --t2 first
  t1.start_time >= t2.end_time)
;

