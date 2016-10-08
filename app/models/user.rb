class User < ApplicationRecord
  has_many :responses
  has_many :decrees, :foreign_key => 'king_id', :class_name => 'Prompt'
  has_many :prompts, through: :responses
  has_many :votes
  has_many :liked_responses, through: :votes, :source => :response


  def first_name_and_last_initial
    "#{first_name} #{last_name[0]}."
  end

  def self.find_or_create_from_omniauth(auth)
    user = self.find_or_create_by(facebook_user_id: auth[:uid])
    user.first_name = auth[:info][:first_name]
    user.last_name = auth[:info][:last_name]
    user.email = auth[:info][:email]
    #user.profile_picture_url = auth[:info][:image]
    user.save
  end

  def self.current_king
    self.find_by(king: true)
  end

  def already_voted?(response_id)
    self.liked_response_ids.include?(response_id)
  end

  def crown
    User.current_king.update(king: false)
    self.update(king: true)
  end


  def vote_button_text(response)
    response.voter_ids.include?(self.id) ? "Unvote" : "Vote"
  end

end
