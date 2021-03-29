class FlightsController < ApplicationController
    def index
        @airports=Airport.all
        @flights=Flight.search(params[:flight])
        @dates=Flight.get_flight_dates
      end


end


#Parameters: {"utf8"=>"✓", "flight"=>{":from_airport_id"=>{","=>"1"}, ":to_airport_id"=>{","=>"2"}}}