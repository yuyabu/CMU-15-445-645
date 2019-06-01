with dates(val) as (
  -- we only calculate the average bike utilization for the date
  -- that has been either a start or an end date of a trip. 
  select date(start_time) from trip where bike_id <= 100
  union 
  select date(end_time) from trip where bike_id <= 100
)



select val,ROUND(sum(sec/86400.0)/count(*),4) utilization_rate from (
  select val,strftime('%s',second)-strftime('%s',first) as sec,bike_id from(
    select 
    trip.id,
    dates.val as val,
    trip.start_time,
    trip.end_time,  
    datetime(val),
    datetime(strftime('%Y-%m-%d',val) || ' 24:00'),

    case
      when trip.start_time < datetime(val)
      then datetime(val) else trip.start_time
    end as first,
    case
      when trip.end_time > datetime(strftime('%Y-%m-%d',val) || ' 24:00')
      then datetime(strftime('%Y-%m-%d',val) || ' 24:00')
      else trip.end_time
    end as second,
    trip.bike_id

   from dates
   join trip on(

    -- only the interval that overlaps with date D 
    -- (from 0:00 to 24:00) will be counted 
    -- when calculating the average bike utilization of date D
    dates.val >= date(trip.start_time)
    and 
    dates.val  <= date(trip.end_time)
    
    and trip.bike_id <= 100
    

    )
  )
)group by val
order by utilization_rate desc limit 10;

