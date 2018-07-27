class Team < ApplicationRecord
  has_many :users
  validates :name, presence: true,
                  length: {maximum: Settings.team.name.max_length},
                  uniqueness: {case_sensitive: false}

  scope :newest, ->{order(created_at: :desc)}
end
