class User < ApplicationRecord
  has many :articles
  has_secure_password
end
