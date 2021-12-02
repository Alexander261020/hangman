class Game
  # Количество допустимых ошибок
  TOTAL_ERRORS_ALLOWED = 7

  # Конструктор класса Game на вход получает строку с загаданным словом.
  #
  # В конструкторе инициализируем две переменные экземпляра: массив букв
  # загаданного слова и пустой массив для дальнейшего сбора в него вводимых
  # букв.
  def initialize(word)
    @letters = word.upcase.chars
    @user_guesses = []
  end

  # Возвращает массив букв, введенных пользователем, но отсутствующих в
  # загаданном слове (ошибочные буквы)
  def errors
    @user_guesses - letters_normalize
  end

  # Возвращает количество ошибок, сделанных пользователем
  def amount_errors
    errors.length
  end

  # Отнимает от допустимого количества ошибок число сделанных ошибок и
  # возвращает оставшееся число допустимых ошибок
  def errors_allowed
    TOTAL_ERRORS_ALLOWED - amount_errors
  end

  # Возвращает массив с уже отгаданными буквами, вместо неотгаданных букв в
  # массиве на соответствующем месте находится nil. Этот массив нужен методу
  # экземпляра класса ConsoleInterface для вывода слова на игровом табло.
  def letters_to_guess
    @letters.map { |letter| letter if @user_guesses.include?(normalize_letter(letter)) }
  end

  # Возвращает true, если у пользователя не осталось ошибок, т.е. игра проиграна
  def lost?
    errors_allowed == 0
  end

  def letters_normalize
    @letters.map { |letter| normalize_letter(letter) }
  end

  def normalize_letter(letter)
    case letter
    when "Ё" then "Е"
    when "Й" then "И"
    else letter
    end
  end

  # Возвращает true, если игра закончена (проиграна или выиграна)
  def over?
    won? || lost?
  end

  # По сути, это основной игровой метод, типа "сыграть букву".
  #
  # Если игра не закончена и передаваемая буква отсутствует в массиве
  # введённых букв, то закидывает передаваемую букву в массив "попыток".
  def play!(letter)
    norm_letter = normalize_letter(letter)

    if !over? && !@user_guesses.include?(norm_letter)
      @user_guesses << norm_letter
    end
  end

  # Возвращает true, если не осталось неотгаданных букв (пользователь выиграл)
  def won?
    (letters_normalize - @user_guesses).empty?
  end

  # Возвращает загаданное слово, склеивая его из загаданных букв
  def word
    @letters.join
  end
end
