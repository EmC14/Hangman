def draw_man(missed_words)

  a = "_________"
  b = "|      "
  b1 = "|   |    "
  c = "|       "
  c1 = "|   O"
  d = "|    "
  d1 = "|   |"
  d2 = "|  /|"
  d3 = "|  /|\\"
  e = "|      "
  e1 = "|   |"
  f = "|    "
  f1 = "|  /"
  f2 = "|  / \\"
  g = "|        "
  h = "|--------"

  if missed_words == 0
    puts a, b, c, d, e, f, g, h
  elsif missed_words == 1
    puts a, b1, c, d, e, f, g, h
  elsif missed_words == 2
    puts a, b1, c1, d, e, f, g, h
  elsif missed_words == 3
    puts a, b1, c1, d1, e, f, g, h
  elsif missed_words == 4
    puts a, b1, c1, d2, e, f, g, h
  elsif missed_words == 5
    puts a, b1, c1, d3, e, f, g, h
  elsif missed_words == 6
    puts a, b1, c1, d3, e1, f, g, h
  elsif missed_words == 7
    puts a, b1, c1, d3, e1, f1, g, h
  elsif missed_words == 8
    puts a, b1, c1, d3, e1, f2, g, h
    puts "Game Over"
    puts "the word was " + $selected_word
    exit
    end
end
outcome = nil
$guesses = []
$wrong_guesses = 0
f = File.new("english_dictionary", "r")
words = f.read
f.close
list = words.split
$selected_word = list.sample
$word_selected = $selected_word.split("")
$array = []
$word_selected.each do |s|
  $word_selected = "_"
  $array.push $word_selected.split("")
end
$word_selected = $selected_word.split("")
puts $array.join(" ")
def next_guess
  puts "Do you want to guess letter or word? (l/w)"
  answer = gets.chomp.downcase
  if answer == "l"
    puts "letter?"
    letter = gets.chomp.downcase
    if $word_selected.include?(letter) == true
        matchLocations = $word_selected.map.with_index{|x, i| i if x == letter}.compact
        matchLocations.each { |x|
                     $array.fill(letter, x, 1)
                  }
        puts $array.join(", ")
        if $array == $word_selected
          puts "you win"
          outcome = "victory"
          exit
        end
    else

    $wrong_guesses = $wrong_guesses + 1
    $guesses.push letter
    puts "you have guessed" + $guesses.to_s

  end
end

  if answer == "w"
    puts "What is your guess?"
    word_guess = gets.to_s.downcase.chomp
    array_of_word = word_guess.split("")
    if array_of_word == $word_selected
puts " the word is" + $word_selected.join("")
      puts "YOU WON!"
      outcome = "victory"
    else
      $wrong_guesses = $wrong_guesses + 1
    end
  end

draw_man($wrong_guesses)

end


until outcome == "victory"
next_guess
end













