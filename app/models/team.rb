class Team < ApplicationRecord
  has_many :users

  validates :name, presence: true
  validates :description, presence: true

  scope :newest, ->{order(created_at: :desc)}

end
