# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
user = User.create(email:'1@gmail.com',password_digest:'123',role:'student')
class1 = MathildaClass.create(name: 'classA')
student = Student.create(user:,name: 'pai', age: 12, is_external: true, mathilda_class: class1)
subject = Subject.create(name: 'ruby', mathilda_class: class1)
teacher = Teacher.create(name: 'Lymda', age: 30,user:)