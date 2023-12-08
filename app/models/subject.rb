class Subject < ApplicationRecord
  belongs_to :mathilda_class
  has_and_belongs_to_many :teachers, dependent: :destroy
end
