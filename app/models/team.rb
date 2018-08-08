class Team < ApplicationRecord
  has_many :users
  belongs_to :leader, class_name: "User"
  validates :name, presence: true, length: {maximum: Settings.team_name_max},
                                   uniqueness: {case_sensitive: false}

  scope :newest, ->{order(created_at: :desc)}
end
