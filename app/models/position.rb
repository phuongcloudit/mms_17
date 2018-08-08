class Position < ApplicationRecord
  validates :name,  presence: true, length: {maximum: 50},
                    uniqueness: {case_sensitive: false}
  validates :short_name,  presence: true, length: {maximum: 5},
                    uniqueness: {case_sensitive: false}
  has_many :user
end
