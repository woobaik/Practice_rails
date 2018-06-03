class User < ApplicationRecord
  has_many :articles
  has_secure_password
  validates :password_digest, presence: true, length: { minimum: 4 }

  VALID_EMAIL_REGEX = /\A([\w+\-]\.?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX}
end
