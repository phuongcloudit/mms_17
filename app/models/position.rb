class Position < ApplicationRecord
  validates :name, presence: true,
                  length: {maximum: Settings.position.name.max_length},
                  uniqueness: {case_sensitive: false}
  validates :short_name, presence: true,
                         length: {maximum: Settings.position.sname.max_length},
                         uniqueness: {case_sensitive: false}
end
