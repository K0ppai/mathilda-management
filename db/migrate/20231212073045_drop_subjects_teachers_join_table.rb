class DropSubjectsTeachersJoinTable < ActiveRecord::Migration[7.0]
  def change
    drop_table :subjects_teachers
  end
end
