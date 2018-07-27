class User < ApplicationRecord
  belongs_to :team
  before_save :downcase_email
  validates :name, presence: true,
                    length: {maximum: Settings.user.name.max_length}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,
                    length: {maximum: Settings.user.email.max_length},
                    format: {with: VALID_EMAIL_REGEX},
                    uniqueness: {case_sensitive: false}
  validates :password, presence: true,
            length: {minimum: Settings.user.password.min_length},
            allow_nil: true
  has_secure_password

  scope :newest, ->{order(created_at: :desc)}

  def downcase_email
    email.downcase!
  end
end
