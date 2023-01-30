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
Test.create!(title:"Ruby", level: 1, author_id: User.ids.at(0), category_id: Category.ids.at(0))
Test.create!(title:"HTML", level: 2, author_id: User.ids.at(1), category_id: Category.ids.at(1))
Test.create!(title:"SQL", level: 2, author_id: User.ids.at(2), category_id: Category.ids.at(2))
Question.create!(title:"What is object in Ruby", test_id: Test.ids.at(0))
Question.create!(title:"What is teg <li>", test_id: Test.ids.at(1))
Question.create!(title:"How to multi merge tables", test_id: Test.ids.at(2))
Answer.create!(question_id: Question.ids.at(0),
              body: "Object is the default root of all Ruby objects. 
              Object inherits from BasicObject which allows creating alternate object hierarchies.
              Methods on Object are available to all classes unless explicitly overridden.")
Answer.create!(correct: false, question_id: Question.ids.at(0), body: "Class")
Answer.create!(correct: false, question_id: Question.ids.at(0), body: "All except Class")
Answer.create!(question_id: Question.ids.at(1), body: "List item")
Answer.create!(correct: false, question_id: Question.ids.at(1), body: "link")
Answer.create!(correct: false, question_id: Question.ids.at(1), body: "Create sort list")
Answer.create!(question_id: Question.ids.at(2), body: "Usege JOIN  after constructions JOIN ON")
Answer.create!(correct: false, question_id: Question.ids.at(2), body: "One usege JOIN and listing tables")
Answer.create!(correct: false, question_id: Question.ids.at(2), body: "INNER JOIN")
