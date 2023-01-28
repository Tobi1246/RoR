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

User.create!(firstname: "Lion", lastname: "Di", age: 18)
User.create!(firstname: "Tod", lastname: "Darck", age: 48)
User.create!(firstname: "Joi", lastname: "Brain", age: 27)
Category.create!(title: "Ruby")
Category.create!(title: "HTML")
Category.create!(title: "SQL")
Test.create!(title:"Ruby", level: 1, author_id: 1, category_id: 1)
Test.create!(title:"HTML", level: 2, author_id: 2, category_id: 2)
Test.create!(title:"SQL", level: 2, author_id: 3, category_id: 3)
Question.create!(title:"What is object in Ruby", test_id: 1)
Question.create!(title:"What is teg <li>", test_id: 2)
Question.create!(title:"How to multi merge tables", test_id: 2)
Answer.create!(question_id: 1,
              body: "Object is the default root of all Ruby objects. 
              Object inherits from BasicObject which allows creating alternate object hierarchies.
              Methods on Object are available to all classes unless explicitly overridden.")
Answer.create!(question_id: 2, body: "List item")
Answer.create!(question_id: 3, body: "Usege JOIN  after constructions JOIN ON")
