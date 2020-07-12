# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.delete_all
Category.delete_all
Test.delete_all
Question.delete_all
Answer.delete_all

User.create(name: 'Bill Murray')
categories = Category.create([{ title: 'Ruby' }, { title: 'Ruby on Rails' }])
tests = Test.create([{ title: 'Основы Руби',
                       category_id: categories.first.id },
                     { title: 'Rails-модели', level: 2,
                       category_id: categories.last.id }])
questions = Question.create([{ body: 'Как вычисляется квадратный корень',
                               test_id: tests.first.id },
                             { body: 'Какая команда генерирует модель?',
                               test_id: tests.last.id }])
Answer.create([{ body: 'Math.sqrt', correct: true,
                 question_id: questions.first },
               { body: 'bin/rails g migration', correct: false,
                 question_id: questions.last }])
TestsUser.create(test_id: Test.last.id, user_id: User.last.id)