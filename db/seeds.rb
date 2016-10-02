# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#users

alice = User.create(first_name: "Alice", last_name: "Kallaugher")
jake = User.create(first_name: "Jake", last_name: "Dowd")
gentian = User.create(first_name: "Gentian", last_name: "Bardhoshi")
cliff = User.create(first_name: "Cliff", last_name: "Regis")
daniella = User.create(first_name: "Daniella", last_name: "Penn")

a_decree = alice.decrees.create(content: "What is your favorite superpower?", current: true)

j_response = jake.responses.create(content: "Invisibility")
c_response = cliff.responses.create(content: "Flying")
a_decree.responses << [j_response, c_response]

g_decree = gentian.decrees.create(content: "What is your favorite color?")
a_response = alice.responses.create(content: "Banana blue")
d_response = daniella.responses.create(content: "Salamander silver")
g_decree.responses << [a_response, d_response]


alice.votes.create(response: j_response)
