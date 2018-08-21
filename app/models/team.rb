class Team < ApplicationRecord
  has_many :users
  validates :name, presence: true, length: {maximum: Settings.team_name_max},
                                   uniqueness: {case_sensitive: false}

  scope :newest, ->{order(created_at: :desc)}

  include PublicActivity::Model
    tracked owner: ->(controller, model) { controller&.current_user }
end
