class BookingsController < ApplicationController

    def index
        @bookings = Booking.all
      end

    def new
        @booking=Booking.new
        @flight=Flight.find_by_id(params[:flight_id])
        begin
            @departureairport=Airport.find_by_id(@flight.from_airport_id)
            @arrivalairport=Airport.find_by_id(@flight.to_airport_id)
        rescue
            flash[:notice] = "Flight cannot be found!!!"
            redirect_to :controller => 'flights', :action => 'index'
        end
        

        params[:number_of_passengers].to_i.times do
            @booking.passengers.build
        end     
    end

    def show
        @booking = Booking.find(params[:id])
        @flight=Flight.find_by_id(@booking.flight_id)
        @departureairport=Airport.find_by_id(@flight.from_airport_id)
        @arrivalairport=Airport.find_by_id(@flight.to_airport_id)
    end

    def create
        @booking=Booking.new(booking_params)
        if @booking.save
            @booking.passengers.each do |passenger|
                PassengerMailer.thank_you_email(passenger).deliver_later
            end
            redirect_to @booking, :notice => "Successfully created booking!"
          else
            #redirect_to new_booking_path(request.parameters)
            flash[:notice] = "Please fill all details completely for all passengers!!!"
            redirect_to :controller => 'bookings', :action => 'new', number_of_passengers: params[:booking][:passengers_attributes].to_enum.to_h.length, flight_id: params[:booking][:flight_id]
            #render :action => 'new'
          end
    end

    
    def booking_params
        params.require(:booking).permit(:flight_id, :passengers_attributes =>  [:name,:email])
    end
end


