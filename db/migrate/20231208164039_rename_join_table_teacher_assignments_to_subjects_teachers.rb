class RenameJoinTableTeacherAssignmentsToSubjectsTeachers < ActiveRecord::Migration[7.0]
  def change
    rename_table :teacher_assignments, :subjects_teachers
  end
end
