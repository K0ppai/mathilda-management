class CreateJoinTableTeacherSubject < ActiveRecord::Migration[7.0]
  def change
    create_join_table :teachers, :subjects, table_name: :teacher_assignments do |t|
      t.index [:teacher_id, :subject_id]
      t.index [:subject_id, :teacher_id]
    end
  end
end
