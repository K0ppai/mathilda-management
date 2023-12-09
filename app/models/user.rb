class User < ApplicationRecord
  has_secure_password
  validates :email, uniqueness: true
  has_one :student
  has_one :teacher
end
