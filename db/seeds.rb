# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Answer.destroy_all
Question.destroy_all
Test.destroy_all
Category.destroy_all
User.destroy_all


(1..5).each do |index|
  User.create(firstname: "Lion#{index}", lastname: "Di", age: rand(18..88), id: index)
  Category.create(title: "Ruby", id: index)
  Test.create(title:"Ruby", level: rand(1..3), id: index, author_id: index,
              category_id: index)
  Question.create(title:"What is object in Ruby", test_id: index, id: index)
  Answer.create(correct: true, id: index, question_id: index, 
                body: "Object is the default root of all Ruby objects. 
                Object inherits from BasicObject which allows creating alternate object hierarchies.
                Methods on Object are available to all classes unless explicitly overridden.")
end

