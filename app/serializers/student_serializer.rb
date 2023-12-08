class StudentSerializer < ActiveModel::Serializer
  attributes :id, :name, :age, :is_external
  has_one :user
end
