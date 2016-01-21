# The following formula is used to calculate the fixed monthly payment
# (payment) required to fully amortize a loan of "loan" dollars over a term of
# "duration" months at a monthly interest rate of "interest".
# [If the quoted rate is 6%, for example, "interest" is .06/12 or .005]
def loan_type_checker?(type)
  if type == "1" || type == "2"
    type
  end
end

def fixed_monthly_payment(loan, interest, duration)
  payment = loan * (interest * (1 + interest)**duration) / ((1 + interest)**duration - 1)
  payment.round(2)
end

def number?(number)
  /^\d+$/.match(number) || /\d/.match(number) && /^\d*\.?\d*$/.match(number)
end

def prompt(str)
  puts "=> #{str}"
end

prompt("Hi! Welcome to the Mortgage and Auto Loan Calculator.")
prompt("Please enter your first name.")
name = gets.chomp

prompt("Great #{name}! Let's get started.")
prompt("In order to help you I will need to collect some information.\n   First, is this a mortgage or auto loan?\n   For mortgage type 1\n   For auto type 2")

loop do
  loan_type = ""
  loop do
    loan_type = gets.chomp

    if loan_type == loan_type_checker?(loan_type)
      break
    else
      prompt("Sorry, That is not a valid option.\n   For mortgage type 1\n   For auto type 2")
    end
  end

  while loan_type == "1"
    prompt("You selected mortgage, is that correct?\n   For Yes type 1\n   For No type 2")
    loan_type_confirmation = gets.chomp

    if loan_type_confirmation == "1"
      break
    elsif loan_type_confirmation == "2"
      prompt("Okay, What woud you like then?\n   For mortgage type 1\n   For auto type 2")
      loan_type = gets.chomp
    else
      prompt("Sorry, That is not a valid option.")
    end
  end

  while loan_type == "2"
      prompt("You selected auto, is that correct\n   For Yes type 1\n   For No type 2")
      loan_type_confirmation = gets.chomp

      if loan_type_confirmation == "1"
        break
      elsif loan_type_confirmation == "2"
        prompt("Okay, What woud you like then?\n   For mortgage type 1\n   For auto type 2")
        loan_type = gets.chomp
      else
        prompt("Sorry, That is not a valid option.")
      end
  end

  prompt("Please enter the loan amount #{name}. Example 12345.\n   Please do not include '$' or ','.")

  loop do
    loan_amount = gets.chomp

    if number?(loan_amount)
      break
    else
      prompt("Sorry that is not a number.\n   Please input a valid number.")
      prompt("Example 12345.\n   Please do not include '$' or ','.")
    end
  end

  prompt("Great, now I'll need the term of the loan in months")

  loop do
    months = gets.chomp

    if number?(months)
      break
    else
      prompt("Sorry that is not a number.\n   Please input the length of the loan in the number of months.")
    end
  end

    prompt("And finally I will need the APR")
    prompt("Example for 5% type 5 or for 3.5% type 3.5")

  loop do
    yearly_interest_rate = gets.chomp.to_f / 100
    monthly_interest_rate = yearly_interest_rate / 12

    if number?(monthly_interest_rate)
      yearly_interest_rate.to_f / 100
      monthly_interest_rate = yearly_interest_rate / 12
      break
    else
      prompt("Sorry that is not a number.\n   Please input a valid interest rate.")
      prompt("Example for 5% type 5 or for 3.5% type 3.5")
    end
  end

    if loan_type == "1"
      loan_type = "Mortgage"
    else
      loan_type = "Auto"
    end

    if loan_amount == number?(loan_amount) && monthly_interest_rate == number?(monthly_interest_rate) && months == number?(months)
      prompt("Your monthly #{loan_type} payment will be $#{fixed_monthly_payment(loan_amount, monthly_interest_rate, months)}")
      break
    else
      prompt("Sorry, one of your inputs was not a valid number.\n   Please try again.")
    end
  end

  prompt("Would you like to enter another loan?\n   For Yes type 1\n   For No type 2")
  calculate_new_loan = gets.chomp

  if calculate_new_loan == "1"
    prompt("I am be happy to help you again #{name}!\n   Is this a mortgage or auto loan?\n   For mortgage type 1\n   For auto type 2")
  else
    prompt("Thank you for using the calculator!")
    break
  end
end
