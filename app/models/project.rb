class Project < ApplicationRecord
  validates :name, presence: true
  has_many :project_users, dependent: :destroy
  has_many :user, through: :project_users
  accepts_nested_attributes_for :project_users, allow_destroy: true

end
