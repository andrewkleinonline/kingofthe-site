class Response < ApplicationRecord
  belongs_to :prompt, optional: true
  belongs_to :user, optional: true
  has_many :votes

end
