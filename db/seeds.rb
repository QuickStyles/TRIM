# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
RANDOM_BOOLEAN = [true, false]
GENDER = ['male', 'female']
CREATE_50_USERS = [*1..50]
CREATE_50_PROVIDERS = [*1..50]
CREATE_200_CUSTOMERS = [*1..200]
CREATE_10_SERVICES = [*1..10]
CREATE_30_BOOKINGS = [*1..30]

CREATE_50_PROVIDERS.each do |number|
  Provider.create
  puts "building provider ##{number}"
  User.create(first_name: "ProviderFName #{number}",
              last_name:  "ProviderLName #{number}",
              email: "ProviderEmail#{number}@gmail.com",
              phone_number: '7783334444',
              gender: GENDER.sample,
              password: '123456',
              password_confirmation: '123456',
              person: Provider.find(number))
  CREATE_10_SERVICES.each do |snumber|
    Service.create(name: "P#{number}Service#{snumber}",
                   rate: rand(1..125),
                   certified: RANDOM_BOOLEAN.sample,
                   location: Faker::Address.street_address,
                   duration: rand(1..15),
                   provider_id: Provider.find(number).id)
    puts "building service ##{snumber}"
  end
end

CREATE_200_CUSTOMERS.each do |number|
  Customer.create
  User.create(first_name: "CustomerFName #{number}",
              last_name:  "CustomerLName #{number}",
              email: "CustomerEmail#{number}@gmail.com",
              phone_number: '7783334444',
              gender: GENDER.sample,
              password: '123456',
              password_confirmation: '123456',
              person: Customer.find(number))
  puts "building customer -----------------------------------------##{number}"
  CREATE_30_BOOKINGS.each do |bnumber|
    RANDOM_TIME_STAMP = Faker::Time.between(DateTime.now - 720, DateTime.now + 360)
    RANDOM_SERVICE = rand(1..500)
    Booking.create(time_start: RANDOM_TIME_STAMP,
                   time_end: RANDOM_TIME_STAMP + 1.hour,
                   service_id: Service.find(RANDOM_SERVICE).id,
                   customer_id: Customer.find(number).id)
    puts "building bookings ##{bnumber}"
    Review.create(rating: rand(1..5),
                  body: "Review for booking ##{bnumber}",
                  booking_id: Booking.last.id,
                  customer_id: Customer.find(number).id)
    puts "building review ##{bnumber}"
  end
end
