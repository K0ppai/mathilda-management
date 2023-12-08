class SubjectSerializer < ActiveModel::Serializer
  attributes :id, :name
  has_one :mathilda_class
end
