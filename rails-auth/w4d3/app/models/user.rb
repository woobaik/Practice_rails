class User < ApplicationRecord
  has_secure_password


  validates :username, presence: true, length: { minimum: 6 }
  validates :password_digest, presence: true, length: { minimum: 6 }



  def self.find_by_credentials(username, password)
    user = User.find_by(username: username)
    return user if user && user.authenticate(password)


  end


  def self.how_long_to_find_users_in_ms
    start = Time.now
    User.where(username: "haram").to_a
    (Time.now - start) * 1000
  end

  def self.find_time_pass
    start = Time.now
    User.where(password_digest: "kjsflkjslkdjflksfj" ).to_a
    (Time.now - start ) * 1000
  end

  def time
    Time.now

  end

end
