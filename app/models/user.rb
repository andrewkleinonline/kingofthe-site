class User < ApplicationRecord
  has_many :responses
  has_many :decrees, :foreign_key => 'king_id', :class_name => "Prompt"
  has_many :prompts, through: :responses
  has_many :votes


  def first_name_and_last_initial
    "#{first_name} #{last_name[0]}."
  end
end
