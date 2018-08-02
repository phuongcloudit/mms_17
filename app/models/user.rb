class User < ApplicationRecord
  has_many :project_users, dependent: :destroy
  has_many :project, through: :project_users
  accepts_nested_attributes_for :project_users, allow_destroy: true

  before_save :downcase_email
  validates :name, presence: true, length: {maximum: 50}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: 50},
                    format: {with: VALID_EMAIL_REGEX},
                    uniqueness: {case_sensitive: false}
  validates :password, presence: true,
            length: {minimum: 6}, allow_nil: true
  validate :avatar_size
  has_secure_password

  scope :newest, ->{order(created_at: :desc)}
  mount_uploader :avatar, PictureUploader

  def downcase_email
    self.email = email.downcase
  end

  private

  def avatar_size
    if avatar.size > 5.megabytes
      errors.add(:avatar, "should be less than 5MB")
    end
  end
end
