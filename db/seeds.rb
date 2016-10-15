# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#users

test_users = FactoryGirl.create_list(:user, 100)

20.times do
  new_prompt = FactoryGirl.create(:prompt, king: test_users.sample) #create a prompt

  test_users.sample(20).each do |user| #select 20 distinct random users to create responses
    FactoryGirl.create(:response, user: user, prompt: new_prompt) #create a response
  end

  new_prompt.responses.each do |response| #for each response...
    test_users.sample(rand(40)).each do |voter| #select up to 40 distinct random users to vote
      Vote.create(response: response, user: voter) #create a vote
    end
  end

end

Prompt.last.update(current: true, remaining_votes: 2) #set the last prompt as current
Prompt.last.king.update(king: true) #set the king of that prompt as the current king
