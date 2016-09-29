class Prompt < ApplicationRecord
  belongs_to :king, :class_name => "User", optional: true
  has_many :responses
  has_many :users, through: :responses
end
