class Teacher < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :subjects, dependent: :destroy
  has_and_belongs_to_many :mathilda_classes, dependent: :destroy

  validates :name, presence: true
  validates :age, presence: true
  validates :user, presence: true
end
