puts "Hi! Welcome to the Mortgage and Auto Loan Calculator."
puts "Please enter your first name."
name = gets.chomp
puts "Great #{name}! Let's get started."
puts "In order to help you I will need to collect some information.\nFirst, is this a mortgage or auto loan?\nFor mortgage type 1\nFor auto type 2"
auto_mortgage = gets.chomp

confirm = false
while confirm == false
  if auto_mortgage == "1"
    puts "You selected mortgage, is that correct?\nFor Yes type 1\nFor No type 2"
    y_or_n = gets.chomp
    if y_or_n == "1"
      confirm = true
    else
      puts "Okay, What woud you like then?\nFor mortgage type 1\nFor auto type 2"
      auto_mortgage = gets.chomp
    end

  elsif auto_mortgage == "2"
    puts "You selected auto, is that correct\nFor Yes type 1\nFor No type 2"
    y_or_n = gets.chomp
    if y_or_n == "1"
      confirm = true
    else
      puts "Okay, What woud you like then?\nFor mortgage type 1\nFor auto type 2"
      auto_mortgage = gets.chomp
    end
  end
end
