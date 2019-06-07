select 
station.zip_code,
station.station_name,
station.station_id,
count(*)

from trip 
join station 
    on trip.start_station_id = station.station_id 
join weather
    on weather.zip_code = station.zip_code
    and date(trip.start_time) = weather.date
where weather.events = 'Rain-Thunderstorm'
group by station.station_id
order by station.zip_code desc


/** result
94107|Powell Street BART|39|36
94107|Clay at Battery|41|30
94107|Davis at Jackson|42|23
94107|Commercial at Montgomery|45|28
94107|Washington at Kearney|46|16
94107|Post at Kearney|47|19
94107|Embarcadero at Vallejo|48|17
94107|Spear at Folsom|49|21
94107|Harry Bridges Plaza (Ferry Building)|50|84
94107|Embarcadero at Folsom|51|35
94107|Embarcadero at Bryant|54|44
94107|Temporary Transbay Terminal (Howard at Beale)|55|72
94107|Beale at Market|56|28
94107|5th at Howard|57|37
94107|San Francisco City Hall|58|10
94107|Golden Gate at Polk|59|15
94107|Embarcadero at Sansome|60|91
94107|2nd at Townsend|61|62
94107|2nd at Folsom|62|35
94107|Howard at 2nd|63|26
94107|2nd at South Park|64|37
94107|Townsend at 7th|65|51
94107|South Van Ness at Market|66|25
94107|Market at 10th|67|51
94107|Yerba Buena Center of the Arts (3rd @ Howard)|68|25
94107|San Francisco Caltrain 2 (330 Townsend)|69|107
94107|San Francisco Caltrain (Townsend at 4th)|70|114
94107|Powell at Post (Union Square)|71|35
94107|Civic Center BART (7th at Market)|72|41
94107|Grant Avenue at Columbus Avenue|73|44
94107|Steuart at Market|74|57
94107|Mechanics Plaza (Market at Battery)|75|27
94107|Market at 4th|76|54
94107|Market at Sansome|77|36
94107|Broadway St at Battery St|82|42
*/