class Subject < ApplicationRecord
  belongs_to :mathilda_class

  validates :name, presence: true
  validates :mathilda_class_id, presence: true
end
