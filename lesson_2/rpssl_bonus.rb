VALID_CHOICES = %w(rock paper scissors spock lizard)

scores = { "player" => 0, "computer" => 0 }

def prompt(message)
  Kernel.puts("=> #{message}")
end

def type_saver(str)
  case str
  when "r"
    str = "rock"
  when "p"
    str = "paper"
  when "s"
    str = "scissors"
  when "S"
    str = "spock"
  when "l"
    str = "lizard"
  else
    str
  end
end

def win?(first, second)
  (first == 'rock' && (second == 'scissors' || second == 'lizard')) ||
    (first == 'paper' && (second == 'rock' || second == 'spock')) ||
    (first == 'scissors' && (second == 'paper' || second == 'lizard')) ||
    (first == 'spock' && (second == 'rock' || second == 'scissors')) ||
    (first == 'lizard' && (second == 'paper' || second == 'spock'))
end

def display_results(player, computer)
  if win?(player, computer)
    prompt("You Won!")
  elsif win?(computer, player)
    prompt("Computer won!")
  else
    prompt("It's a tie!")
  end
end

loop do
  choice = ''
  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}")
    choice = Kernel.gets().chomp()

    choice = type_saver(choice)

    if VALID_CHOICES.include?(choice)
      break
    else
      prompt("That's not a valid choice.")
    end
  end

  computer_choice = VALID_CHOICES.sample

  if win?(choice, computer_choice)
    scores["player"] += 1
  elsif win?(computer_choice, choice)
    scores["computer"] += 1
  end

  prompt("You chose: #{choice}; Computer chose: #{computer_choice}")

  display_results(choice, computer_choice)

  prompt("#{scores['player']} #{scores['computer']}")

  if scores["player"] == 5 || scores["computer"] == 5
    break
  end
end

prompt("Thank you for playing, Good bye!")
