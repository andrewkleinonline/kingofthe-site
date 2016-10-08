class Prompt < ApplicationRecord
  belongs_to :king, :class_name => "User", optional: true
  has_many :responses
  has_many :users, through: :responses


  def self.current
    self.find_by(current: true)
  end

  def make_current
    Prompt.current.update(current: false)
    self.update(current: true)
  end
end
