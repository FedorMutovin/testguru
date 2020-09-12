Category.destroy_all
Test.destroy_all
Question.destroy_all
Answer.destroy_all
TestPassage.destroy_all
Badge.destroy_all
categories = Category.create([{ title: 'Ruby' }, { title: 'Ruby on Rails' }])
tests = Test.create([{ title: 'Основы Руби', author: users.first,
                       category: categories.first },
                     { title: 'Мастер Руби', author: users.first,
                       category: categories.first },
                     { title: 'Rails-модели', level: 6, author: users.first,
                       category: categories.last },
                     { title: 'Rails-контроллеры', level: 6, author: users.first,
                       category: categories.last }])
questions = Question.create([{ body: 'Как вычисляется квадратный корень?',
                               test: tests[0] },
                             { body: 'Какая команда генерирует модель?',
                               test: tests[2] },
                             { body: 'Как добавить новый элемент в массив?',
                               test: tests[0] },
                             { body: 'Что из перечисленного является коллбеком модели?',
                               test: tests[2] },
                             { body: 'Выберите верный вариант отображение интерполяции строки?',
                               test: tests[1] },
                             { body: 'Краткая запись обьекта proc?',
                               test: tests[1] },
                             { body: 'Что из перечисленного является колбэком контроллера?',
                               test: tests[3] },
                             { body: 'Укажите верный способ,
                               с помощью которого можно обратиться к параметру запроса?',
                               test: tests[3] }])
Answer.create([{ body: 'Math.sqrt', correct: true, question: questions[0] },
               { body: 'Sqrt.math', correct: false, question: questions[0] },
               { body: 'bin/rails g migration', correct: false, question: questions[1] },
               { body: 'bin/rails g modulation', correct: false, question: questions[1] },
               { body: 'bin/rails g mutation', correct: false, question: questions[1] },
               { body: 'bin/rails g model', correct: true, question: questions[1] },
               { body: 'array.push()', correct: true, question: questions[2] },
               { body: 'array << something', correct: true, question: questions[2] },
               { body: 'array <> something', correct: false, question: questions[2] },
               { body: 'before_validation', correct: true, question: questions[3] },
               { body: 'before congratulations', correct: false, question: questions[3] },
               { body: 'after kill', correct: false, question: questions[3] },
               { body: 'after_commit', correct: true, question: questions[3] },
               { body: '#{}', correct: true, question: questions[4] },
               { body: '{##', correct: false, question: questions[4] },
               { body: '(&..)', correct: true, question: questions[5] },
               { body: '[&...]', correct: false, question: questions[5] },
               { body: '#{&...}#', correct: false, question: questions[5] },
               { body: '--=', correct: false, question: questions[5] },
               { body: 'before_action', correct: true, question: questions[6] },
               { body: 'before_satisfaction', correct: true, question: questions[6] },
               { body: 'after_satisfaction', correct: false, question: questions[6] },
               { body: 'params[:id]', correct: true, question: questions[7] },
               { body: 'pararams[:id]', correct: false, question: questions[7] },
               { body: '{id:}', correct: false, question: questions[8] },
               { body: 'парамс', correct: false, question: questions[8] }])
Badge.create([{ name: 'Ruby Master',
                file: 'https://vignette.wikia.nocookie.net/rustarwars/images/c/c3/Yoda_TPM_RotS.png/revision/latest?cb=20180125074723',
                reason: 'Выдается после прохождения всех тестов в категории Ruby' },
              { name: 'Rails Master',
                file: 'https://p7.hiclipart.com/preview/582/97/199/chewbacca-han-solo-star-wars-sequel-trilogy-wookiee-chewbacca-thumbnail.jpg',
                reason: 'Выдается после прохождения всех тестов в категории Rails' },
              { name: 'On The First Try',
                file: 'https://www.meme-arsenal.com/memes/dc4131594a8f353268afb152599eea71.jpg',
                reason: 'Выдается после прохождения любого из тестов с первой попытки' },
              { name: 'Test Guru Master',
                file: 'https://c7.hotpng.com/preview/162/512/983/5bbc4f05bdba3.jpg',
                reason: 'Выдается после прохождения всех тестов' }])
