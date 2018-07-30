class Project < ApplicationRecord
  has_many :users
  validates :name, presence: true
  belongs_to :leader, class_name: User.name, foreign_key: :leader_id
  belongs_to :team, foreign_key: :team_id

end
