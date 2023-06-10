# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
TestPassage.destroy_all
Answer.destroy_all
Question.destroy_all
Test.destroy_all
Category.destroy_all
User.destroy_all
Admin.destroy_all

users = User.create!([{ firstname: 'Lion', lastname: 'Di', age: 18, email: "test@user1", password: 123456 },
                      { firstname: 'Tod', lastname: 'Darck', age: 48, email: "test@user2", password: 123456 },
                      { firstname: 'Joi', lastname: 'Brain', age: 27, email: "test@user3", password: 123456 }])
categorys = Category.create!([{ title: 'Ruby' },
                              { title: 'HTML' },
                              { title: 'SQL' }])
tests = Test.create!([{ title: 'Ruby', level: 1, author: users[0], category: categorys[0] },
                      { title: 'HTML', level: 2, author: users[1], category: categorys[1] },
                      { title: 'SQL', level: 2, author: users[2], category: categorys[2] }])
questions = Question.create!([{ title: 'What is object in Ruby', test: tests[0] },
                              { title: 'What is teg <li>', test: tests[1] },
                              { title: 'How to multi merge tables', test: tests[2] },
                              { title: '1+1', test: tests[0] },
                              { title: '2+2', test: tests[1] },
                              { title: '3+3', test: tests[2] }])
Answer.create!(question: questions[0],
               body: "Object is the default root of all Ruby objects.
              Object inherits from BasicObject which allows creating alternate object hierarchies.
              Methods on Object are available to all classes unless explicitly overridden.")
Answer.create!(correct: false, question: questions[0], body: 'Class')
Answer.create!(correct: false, question: questions[0], body: 'All except Class')
Answer.create!(question: questions[1], body: 'List item')
Answer.create!(correct: false, question: questions[1], body: 'link')
Answer.create!(correct: false, question: questions[1], body: 'Create sort list')
Answer.create!(question: questions[2], body: 'Usege JOIN  after constructions JOIN ON')
Answer.create!(correct: false, question: questions[2], body: 'One usege JOIN and listing tables')
Answer.create!(correct: false, question: questions[2], body: 'INNER JOIN')
Answer.create!(question: questions[3], body: 2)
Answer.create!(correct: false, question: questions[3], body: 3)
Answer.create!(question: questions[4], body: 4)
Answer.create!(correct: false, question: questions[4], body: 3)
Answer.create!(question: questions[5], body: 6)
Answer.create!(correct: false, question: questions[5], body: 3)

Admin.create!(firstname: 'Tobi', email: 'asd@ya.ru', password: 'admin123')

Badge.create!(name: "Completed all tests category: Ruby",
              img: "https://c8.alamy.com/comp/ERDGH5/vector-illustration-of-green-completed-stamp-on-white-background-ERDGH5.jpg",
              conditions: "completed_all_category_tests",
              conditions_params: categorys[0].id)
Badge.create!(name: "Completed all tests category: HTML",
              img: "https://c8.alamy.com/comp/ERDGH5/vector-illustration-of-green-completed-stamp-on-white-background-ERDGH5.jpg",
              conditions: "completed_all_category_tests",
              conditions_params: categorys[1].id)
Badge.create!(name: "Completed all tests category: SQL",
              img: "https://c8.alamy.com/comp/ERDGH5/vector-illustration-of-green-completed-stamp-on-white-background-ERDGH5.jpg",
              conditions: "completed_all_category_tests",
              conditions_params: categorys[2].id)
Badge.create!(name: "Completed all tests level: 1",
              img: "https://c8.alamy.com/comp/ERDGH5/vector-illustration-of-green-completed-stamp-on-white-background-ERDGH5.jpg",
              conditions: "completed_all_level_tests",
              conditions_params: 1)
Badge.create!(name: "Completed all tests level: 2",
              img: "https://c8.alamy.com/comp/ERDGH5/vector-illustration-of-green-completed-stamp-on-white-background-ERDGH5.jpg",
              conditions: "completed_all_level_tests",
              conditions_params: 2)
Badge.create!(name: "Completed all tests level: 3",
              img: "https://c8.alamy.com/comp/ERDGH5/vector-illustration-of-green-completed-stamp-on-white-background-ERDGH5.jpg",
              conditions: "completed_all_level_tests",
              conditions_params: 3)
Badge.create!(name: "Passage test in first try",
              img: "https://cdn1.vectorstock.com/i/1000x1000/37/15/completed-rubber-stamp-vector-12423715.jpg",
              conditions: "pasage_in_first_try")


