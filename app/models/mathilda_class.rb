class MathildaClass < ApplicationRecord
  has_many :students, dependent: :destroy
  has_many :subjects, dependent: :destroy
  has_and_belongs_to_many :teachers, dependent: :destroy

  validate :validate_class_size
  validates :name, presence: true

  def validate_class_size
    errors.add(:base, 'Class size exceeds maximum limit') if students.size > 500
  end
end
