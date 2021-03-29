# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#To delete all previous records before executing rake db:seed command from terminal
Airport.delete_all
Flight.delete_all

#Defining just SFO & NYC airports in the beginning
airport_1=Airport.new(:code => 'SFO')
airport_2=Airport.new(:code => 'NYC')
#airport_3=Airport.new(:code => 'ANKK')

airport_1.id=1
airport_2.id=2
#airport_3.id=3
airport_1.save!
airport_2.save!
#airport_3.save!

#Generating 10 random flights; 5 per each terminal
50.times do
    flight_type_a=Flight.new(:from_airport => Airport.all.find(1), :to_airport => Airport.all.find(2), :date_of_flight => DateTime.new(2021,3,rand(1..28),rand(1...24),rand(1...60)), :duration => rand(1..10))
    flight_type_a.save!
end

50.times do
    flight_type_a=Flight.new(:from_airport => Airport.all.find(2), :to_airport => Airport.all.find(1), :date_of_flight => DateTime.new(2021,3,rand(1..28),rand(1...24),rand(1...60)), :duration => rand(1..10))
    flight_type_a.save!
end

#5.times do
#    flight_type_a=Flight.new(:from_airport => Airport.all.find(3), :to_airport => Airport.all.find(1), :date_of_flight => DateTime.new(2021,3,rand(1..28),rand(1...24),rand(1...60)), :duration => rand(1..10))
#    flight_type_a.save!
#end
