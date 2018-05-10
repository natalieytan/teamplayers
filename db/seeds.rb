require 'csv'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Some sports to populate the database
# sports = Sport.create!([
#   {name: "soccer" }, 
#   {name: "futsal"}, 
#   {name: "netball"}, 
#   {name: "basketball"}, 
#   {name: "rugby"},
#   {name: "volleyball"}, 
#   {name: "dodgeball"}, 
#   {name: "cricket"},
#   {name: "football"}, 
# ])

# Days, Gender & Skills
# days = Day.create!([
#   {name: "Monday"},
#   {name: "Tuesday"},
#   {name: "Wednesday"},
#   {name: "Thursday"},
#   {name: "Friday"},
#   {name: "Saturday"},
#   {name: "Sunday"}
# ])

# genders = Gender.create!([
#   {name: "Male"},
#   {name: "Female"},
#   {name: "Mixed"}
# ])

# skill = Skill.create!([
#   {name: "Beginner"},
#   {name: "Casual"},
#   {name: "Intermediate"},
#   {name: "Advanced"},
#   {name: "Professional"}
# ])

# seed some organisations
# organisations = CSV.open("db/organisations.csv", headers: :first_row).map(&:to_h)
# Organisation.create!(organisations)

# # seed some data for futsalHQ
# futsalhq = CSV.open("db/futsalhq.csv", headers: :first_row).map(&:to_h)
# League.create!(futsalhq)

#users = CSV.open("db/people.csv", headers: :first_row).map(&:to_h)

# seed some users
# 99.times do |n|
#   email = "example-#{n+1}@teamplayers.com"
#   password = "verysecurepassword"
#   User.create!(
#       email: email,
#       password: password)
#   end


# seed somer profiles
profiles = Profile.last(99)
prng = Random.new
profiles.each do |profile|
  profile.update(
    {
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      birth_date: Faker::Date.between(80.year.ago, 12.years.ago),
      gender: prng.rand(1..2),
      city:Faker::Address.city,
      description: Faker::MostInterestingManInTheWorld.quote,
      state: Faker::Address.state,
      country:Faker::Address.country,
      postcode: Faker::Address.postcode,
      latitude: Faker::Address.latitude,
      longitude:Faker::Address.longitude
    }
  )
end