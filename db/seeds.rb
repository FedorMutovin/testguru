# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Category.destroy_all
Test.destroy_all
Question.destroy_all
Answer.destroy_all
TestsUser.destroy_all

user = User.create([{ name: 'Bill Murray' }, { name: 'Ghost Buster' }])
category = Category.create([{ title: 'Ruby' }, { title: 'Ruby on Rails' }])
test = Test.create([{ title: 'Основы Руби', author: user.last,
                      category: category.first },
                    { title: 'Rails-модели', level: 2, author: user.last,
                      category: category.last }])
question = Question.create([{ body: 'Как вычисляется квадратный корень',
                              test: test.first },
                            { body: 'Какая команда генерирует модель?',
                              test: test.last }])
Answer.create([{ body: 'Math.sqrt', correct: true,
                 question: question.first },
               { body: 'bin/rails g migration', correct: false,
                 question: question.last }])
TestsUser.create(test_id: test.last.id, user_id: user.last.id)
