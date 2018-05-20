class User < ApplicationRecord
  before_save {self.email = self.email.downcase}
  validates :name, presence: true,
                   length: { maximum: 50}
  VALID_EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

  validates :email, presence: true,
                    length: { maximum: 255},
                    format: { with: VALID_EMAIL_REGEX},
                    uniqueness: { case_sensitive: false }

  has_secure_password

  validates :password, presence: true,
                       length: { minimum: 6 }


  def self.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ?
           BCrtpt::Engine::MIN_COST : BCrypt::Engine.cost
           BCrypt::Password.create(string, cost: cost)

  end

end
