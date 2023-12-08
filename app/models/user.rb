class User < ApplicationRecord
    has_secure_password
    validates :email, uniqueness: true
    has_one :object, class_name: "object", foreign_key: "object_id"
end