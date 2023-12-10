class Subject < ApplicationRecord
  belongs_to :mathilda_class
  has_and_belongs_to_many :teachers, dependent: :destroy

  validates :name, presence: true
  validates :mathilda_class_id, presence: true
end
