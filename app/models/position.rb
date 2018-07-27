class Position < ApplicationRecord
  validates :name, presence: true,
                  length: {maximum: Settings.position_name_max},
                  uniqueness: {case_sensitive: false}
  validates :short_name, presence: true,
                         length: {maximum: Settings.position_sname_max},
                         uniqueness: {case_sensitive: false}
end
