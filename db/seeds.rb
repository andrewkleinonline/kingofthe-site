# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#users

andrew = User.create(name: "Andrew")
jake = User.create(name: "Jake")
a_decree = andrew.decrees.create(content: "Fav superpower?")

j_response = jake.responses.create(content: "Invisibility")
a_decree.responses << j_response

andrew.votes.create(response: j_response)
