class Student < ApplicationRecord
  belongs_to :user
  belongs_to :mathilda_class

  validates :name, presence: true
  validates :age, presence: true
  validates :user_id, presence: true
  validates :mathilda_class_id, presence: true

  def update_external_students
    # change with actual external system endpoint
    response = RestClient.get 'http://localhost:3001/students'
    students = JSON.parse response

    students.each do |student|
      RestClient.patch "http://localhost:3000/students/#{student['id']}", {
        student: {
          name: student['name'],
          age: student['age'],
          mathilda_class_id: student['mathilda_class_id'],
          is_external: true
        }
      }.to_json, { content_type: :json, accept: :json }
    end
  end
end
