class AddMathildaClassRefToStudents < ActiveRecord::Migration[7.0]
  def change
    add_reference :students, :mathilda_class, null: false, foreign_key: true
  end
end
