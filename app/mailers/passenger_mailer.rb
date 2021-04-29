class PassengerMailer < ApplicationMailer
    def thank_you_email(passenger)
        @passenger=passenger
        @url=booking_url(@passenger.booking)
        mail(to: @passenger.email, subject: 'Successful booking confirmation !!!')
    end
end
