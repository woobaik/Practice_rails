class User < ApplicationRecord

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
