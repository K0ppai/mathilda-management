class MathildaClass < ApplicationRecord
  has_many :students, dependent: :destroy
  has_many :subjects, dependent: :destroy
end
