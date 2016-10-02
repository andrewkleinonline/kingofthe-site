class Response < ApplicationRecord
  belongs_to :prompt, optional: true
  belongs_to :user, optional: true
  has_many :votes
  has_many :voters, through: :votes, :source => :user
end
