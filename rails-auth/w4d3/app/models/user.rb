class User < ApplicationRecord
  has_secure_password


  validates :username, presence: true, length: { minimum: 6 }
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: :true



  def self.find_by_credentials(username, password)
    user = User.find_by(username: username)
    return user if user && user.authenticate(password)


  end




end
