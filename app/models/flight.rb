class Flight < ApplicationRecord
  belongs_to :from_airport, :class_name => "Airport"
  belongs_to :to_airport, :class_name => "Airport"

  has_many :bookings

  def self.search(search)
    if search
      flights=Flight.all
      flights=flights.where(from_airport_id: search[:":from_airport_id"])
      flights=flights.where(to_airport_id: search[:":to_airport_id"])
      flights=flights.where(date_of_flight: DateTime.strptime(search[:":date_of_flight"],'%Y-%m-%d').beginning_of_day..DateTime.strptime(search[:":date_of_flight"],'%Y-%m-%d').end_of_day)
      return flights
    else
      #return Flight.all
    end
  end

  def self.get_flight_dates
    #flight_dates = Flight.find_by_sql("select distinct date_of_flight from flights where date_of_flight is not null order by date_of_flight desc") #ayni tarihler iki kez geliyor (saat farkindan dolayi) DUZELTmeli
    flight_dates=Flight.pluck(:date_of_flight).map {|a| [a.strftime("%d/%m/%Y"), a.to_date]}.uniq
  end

end


#DateTime.strptime('2001 05 6 04 05 06 +7', '%Y %W %u %H %M %S %z')