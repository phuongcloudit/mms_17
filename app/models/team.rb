class Team < ApplicationRecord
  belongs_to :leader, class_name: User.name, foreign_key: :leader_id
  validates :name, presence: true
  validates :description, presence: true
  has_many :users

  scope :newest, ->{order(created_at: :desc)}

end
