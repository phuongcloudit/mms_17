class Team < ApplicationRecord
  belongs_to :leader, class_name: User.name, foreign_key: :leader_id
  has_many :users

  validates :name, presence: true
  validates :description, presence: true

  scope :newest, ->{order(created_at: :desc)}

end
