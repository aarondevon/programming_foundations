def prompt(message)
  Kernel.puts("=> #{message}")
end

def number?(num)
  if num.to_i.to_s == num
    return num.to_i

  elsif num.to_f.to_s == num
    return num.to_f
  end
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

    if number?(number1)
      number1 = number?(number1)
      break()
    else
      prompt("Sorry, that doesn't seem to be a valid number")
    end
  end
  number2 = ''
  loop do
    prompt("What's the second number?")
    number2 = Kernel.gets().chomp()

    if number?(number2)
      number2 = number?(number2)
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
             result = number1 + number2
           when '2'
             result = number1 - number2
           when '3'
             result = number1 * number2
           when '4'
             result = number1 / number2
           end

  prompt("the result is #{result}")

  prompt("Do you want to perform another calculation (Y to calculate again")
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end

prompt("Thanks for using the calculator. Good bye.")
