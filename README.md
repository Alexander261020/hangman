# Игра "Виселица".
[Описание в викепедии](https://ru.wikipedia.org/wiki/%D0%92%D0%B8%D1%81%D0%B5%D0%BB%D0%B8%D1%86%D0%B0_(%D0%B8%D0%B3%D1%80%D0%B0))

## Правила игры:
Пользователю предлагается угадать загаданное слово, вводя по 1 букве. 
Если в загаданном слове присутствует указанная буква, то она открывается, если же нет тогда засчитывается ошибка и выводится изображение 
частично повешенного человека (всего 7 попыток). Цель игры отгадать слово пока не кончились попытки (до того как Вас полностью повешают). 

## Дополнительные слова
Добавить свои слова можно в файле: 
```
data/words.txt. 
```
Каждое слово с новой строки и в верхнем регистре.

## Запуск игры
Запускается из консоли в корне программы командой:
```
ruby main.rb
```
