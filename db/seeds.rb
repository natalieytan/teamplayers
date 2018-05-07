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

days = Day.create!([
  {name: "Monday"},
  {name: "Tuesday"},
  {name: "Wednesday"},
  {name: "Thursday"},
  {name: "Friday"},
  {name: "Saturday"},
  {name: "Sunday"}
])

genders = Gender.create!([
  {name: "Male"},
  {name: "Female"},
  {name: "Mixed"}
])

skill = Skill.create!([
  {name: "Beginner"},
  {name: "Casual"},
  {name: "Intermediate"},
  {name: "Advanced"},
  {name: "Professional"}
])