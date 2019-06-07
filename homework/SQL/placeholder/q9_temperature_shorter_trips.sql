select avg(
    case when strftime('%s',end_time) - strftime('%s',start_time)  <= 60
    then weather.mean_temp
    else null
    end
    ) ,
    avg(
    case when strftime('%s',end_time) - strftime('%s',start_time)  <= 60
    then null
    else weather.mean_temp
    end
    ) 
    from trip 
join station on station_id = trip.start_station_id
join weather on date(trip.start_time) = weather.date
    and weather.zip_code = station.zip_code

--result
--60.9390595009597|61.2227063447501
