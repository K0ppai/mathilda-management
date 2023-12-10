class User < ApplicationRecord
  has_secure_password
  validates :email, uniqueness: true, presence: true
  validates :role, presence: true

  has_one :student
  has_one :teacher
end
