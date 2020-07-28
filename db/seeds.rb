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

users = User.create([{ name: 'Bill Murray', email: 'b@m.ru' },
                     { name: 'Ghost Buster', email: 'g@b.ru' }])
categories = Category.create([{ title: 'Ruby' }, { title: 'Ruby on Rails' }])
tests = Test.create([{ title: 'Основы Руби', author: users.last,
                       category: categories.first },
                     { title: 'Rails-модели', level: 6, author: users.last,
                       category: categories.last }])
questions = Question.create([{ body: 'Как вычисляется квадратный корень?',
                               test: tests.first },
                             { body: 'Какая команда генерирует модель?',
                               test: tests.last }])
Answer.create([{ body: 'Math.sqrt', correct: true,
                 question: questions.first },
               { body: 'bin/rails g migration', correct: false,
                 question: questions.last },
               { body: 'bin/rails g modulation', correct: false,
                 question: questions.last },
               { body: 'bin/rails g mutation', correct: false,
                 question: questions.last },
               { body: 'bin/rails g model', correct: true,
                 question: questions.last }])
TestsUser.create(test: tests.last, user: users.last)
