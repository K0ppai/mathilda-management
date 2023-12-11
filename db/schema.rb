# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 20_231_211_051_247) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'mathilda_classes', force: :cascade do |t|
    t.string 'name'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'mathilda_classes_teachers', id: false, force: :cascade do |t|
    t.bigint 'mathilda_class_id', null: false
    t.bigint 'teacher_id', null: false
    t.index %w[mathilda_class_id teacher_id], name: 'index_mathilda_classes_teachers'
    t.index %w[teacher_id mathilda_class_id], name: 'index_teachers_mathilda_classes'
  end

  create_table 'students', force: :cascade do |t|
    t.string 'name'
    t.integer 'age'
    t.boolean 'is_external'
    t.bigint 'user_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.bigint 'mathilda_class_id', null: false
    t.index ['mathilda_class_id'], name: 'index_students_on_mathilda_class_id'
    t.index ['user_id'], name: 'index_students_on_user_id'
  end

  create_table 'subjects', force: :cascade do |t|
    t.string 'name'
    t.bigint 'mathilda_class_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['mathilda_class_id'], name: 'index_subjects_on_mathilda_class_id'
  end

  create_table 'subjects_teachers', id: false, force: :cascade do |t|
    t.bigint 'teacher_id', null: false
    t.bigint 'subject_id', null: false
    t.index %w[subject_id teacher_id], name: 'index_subjects_teachers_on_subject_id_and_teacher_id'
    t.index %w[teacher_id subject_id], name: 'index_subjects_teachers_on_teacher_id_and_subject_id'
  end

  create_table 'teachers', force: :cascade do |t|
    t.string 'name'
    t.integer 'age'
    t.bigint 'user_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['user_id'], name: 'index_teachers_on_user_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'email'
    t.string 'password_digest'
    t.string 'role'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  add_foreign_key 'students', 'mathilda_classes'
  add_foreign_key 'students', 'users'
  add_foreign_key 'subjects', 'mathilda_classes'
  add_foreign_key 'teachers', 'users'
end
