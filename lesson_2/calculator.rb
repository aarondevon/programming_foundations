def prompt(message)
  Kernel.puts("=> #{message}")
end

def valid_number?(num)
  num.to_i() != 0
end

def operation_to_message(op)
  case op
  when '1'
    'Adding'
  when '2'
    'Subtracting'
  when '3'
    'Multiplying'
  when '4'
    'Dividing'
  end
end

prompt("Welcome to Calulator! Please enter your name.")

name = ''
loop do
  name = Kernel.gets().chomp()

  if name.empty?()
  prompt("Make sure you enter your name.")
  else
    break
  end
end

prompt("Hi #{name}!")

loop do # main loop
  number1 = ''
  loop do
    prompt("What's the first number?")
    number1 = Kernel.gets().chomp()

    if valid_number?(number1)
      break()
    else
      prompt("Sorry, that doesn't seem to be a valid number")
    end
  end
  number2 = ''
  loop do
    prompt("What's the second number?")
    number2 = Kernel.gets().chomp()

    if valid_number?(number2)
      break()
    else
      prompt("Sorry, that doesn't seem to be a valid number")
    end
  end
    # Doesn't have to be MSG, could be anything. They are delimiters
  operator_prompt = <<-MSG
    What operation would you like to perform?
    1) add
    2) subtract
    3) mulitply
    4) divide
  MSG

  prompt(operator_prompt)

operator = ''
  loop do
    operator = Kernel.gets().chomp()
    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt("Must choose 1, 2, 3, or 4")
    end
  end

  prompt("#{operation_to_message(operator)} the two numbers...")

  result = case operator
           when '1'
            result = number1.to_i() + number2.to_i()
           when '2'
            result = number1.to_i() - number2.to_i()
           when '3'
            result = number1.to_i() * number2.to_i()
           when '4'
            result = number1.to_f() / number2.to_f()
          end

  prompt("the result is #{result}")

  prompt("Do you want to perform another calculation (Y to calculate again")
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end

prompt("Thanks for using the calculator. Good bye.")
