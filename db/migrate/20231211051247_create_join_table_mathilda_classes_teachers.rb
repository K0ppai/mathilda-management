class CreateJoinTableMathildaClassesTeachers < ActiveRecord::Migration[7.0]
  def change
    create_join_table :mathilda_classes, :teachers do |t|
      t.index %i[mathilda_class_id teacher_id], name: 'index_mathilda_classes_teachers'
      t.index %i[teacher_id mathilda_class_id], name: 'index_teachers_mathilda_classes'
    end
  end
end
