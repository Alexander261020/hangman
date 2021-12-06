class ConsoleInterface
  FIGURES =
    Dir["#{__dir__}/../data/figures/*.txt"].
    sort.
    map { |file_name| File.read(file_name) }

  def initialize(game)
    @game = game
  end

  def print_out
    puts <<~INTERFACE
      #{"Слово: #{word_to_show}".colorize(:blue)}
      #{figure.colorize(:yellow)}
      #{"Ошибки (#{@game.amount_errors}): #{errors_to_show}".colorize(:red)}
      У вас осталось ошибок: #{@game.errors_allowed}
    INTERFACE

    if @game.won?
      puts "Поздравляем, вы выиграли!".colorize(:blue)
    elsif @game.lost?
      puts "Вы проиграли, загаданное слово: #{@game.word}".colorize(:red)
    end
  end

  # Возвращает ту фигуру из массива FIGURES, которая соответствует количеству
  # ошибок, сделанных пользователем на данный момент (число ошибок берем у
  # экземпляра класса Game)
  def figure
    FIGURES[@game.amount_errors]
  end

  # Метод, который готовит слово для вывода "на игровом табло".
  #
  # Получает на вход массив: каждый элемент массива соответствует одной букве в
  # загаданном слове. Но на позиции отгаданной буквы — сама эта буква (строка из
  # одного символа), а на позиции неотгаданной буквы — nil.
  #
  # Метод трансформирует массив (записывает вместо nil два подчеркивания),
  # и склеивает в строку, разделяя элементы пробелами. Получается как-то так:
  #
  # На вход передали: ["К", "О", nil, "О", nil, nil],
  # на выходе будет: "К О __ О __ __"
  def word_to_show
    @game.letters_to_guess.map { |letter| letter || "__" }.join(" ")
  end

  # Получает массив ошибочных букв и склеивает их в строку вида "Х, У"
  def errors_to_show
    @game.errors.join(", ")
  end

  # Получает букву из пользовательского ввода, приводит её к верхнему регистру
  # и возвращает её
  def get_input
    print "Введите следующую букву: "
  
    while (user_input = gets.strip.upcase).empty?
      print "Вы не ввели букву. Повторите ввод: "
    end
  
    user_input[0]
  end
end
