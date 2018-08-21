class Skill < ApplicationRecord
  validates :name,  presence: true, length: {maximum: 50},
                    uniqueness: {case_sensitive: false}

  include PublicActivity::Model
    tracked owner: ->(controller, model) { controller&.current_user }
end
