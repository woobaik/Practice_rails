class User < ApplicationRecord

  before_validation :ensure_session_token

  validates :username, :session_token, presence: true
  validates :password_digest, presence: true, { message: "Password, can'be blank!"}
  validates :password, length: { minumum : 6, allow_nil: true },





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
