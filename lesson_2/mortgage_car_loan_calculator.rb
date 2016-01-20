# The following formula is used to calculate the fixed monthly payment
# (payment) required to fully amortize a loan of "loan" dollars over a term of
# "duration" months at a monthly interest rate of "interest".
# [If the quoted rate is 6%, for example, "interest" is .06/12 or .005]
def fixed_monthly_payment(loan, interest, duration)
  payment = loan * (interest * (1 + interest)**duration) / ((1 + interest)**duration - 1)
  payment.round(2)
end

def number?(number)
  number == number.to_i || number.to_f
  number
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
  auto_mortgage = gets.chomp
  confirm = false
  while confirm == false
    if auto_mortgage == "1"
      prompt("You selected mortgage, is that correct?\n   For Yes type 1\n  For No type 2")
      y_or_n = gets.chomp
      if y_or_n == "1"
        confirm = true
      elsif y_or_n == "2"
        prompt("Okay, What woud you like then?\n   For mortgage type 1\n   For auto type 2")
        auto_mortgage = gets.chomp
      else
        prompt("Sorry, That is not a valid option.")
      end
    elsif auto_mortgage == "2"
      prompt("You selected auto, is that correct\n   For Yes type 1\n   For No type 2")
      y_or_n = gets.chomp
      if y_or_n == "1"
        confirm = true
      elsif y_or_n == "2"
        prompt("Okay, What woud you like then?\n   For mortgage type 1\n   For auto type 2")
        auto_mortgage = gets.chomp
      else
        prompt("Sorry, That is not a valid option.")
      end
    else
      prompt("Sorry, That is not a valid option.\n   For mortgage type 1\n   For auto type 2")
      auto_mortgage = gets.chomp
    end
  end
  loop do
    prompt("Please enter the loan amount #{name}. Example 12345.\n   Please do not include '$' or ','.")
    loan_amount = gets.chomp.to_i
    prompt("Great, now I'll need the term of the loan in months")
    loan_duration_in_months = gets.chomp.to_i
    prompt("And finally I will need the APR")
    prompt("Example for 5% 5")
    interest_amount = gets.chomp.to_f / 100 / 12
    if loan_amount == number?(loan_amount) && interest_amount == number?(interest_amount) && loan_duration_in_months == number?(loan_duration_in_months)
      prompt("Your monthly payment will be $#{fixed_monthly_payment(loan_amount, interest_amount, loan_duration_in_months)}")
      break
    else
      prompt("Sorry, one of your inputs was not a valid number.\n   Please try again.")
    end
  end
  prompt("Would you like to enter another loan?\n   For Yes type 1\n   For No type 2")
  another_loan = gets.chomp
  if another_loan == "1"
    prompt("I am be happy to help you again #{name}!\n   Is this a mortgage or auto loan?\n   For mortgage type 1\n   For auto type 2")
  else
    prompt("Thank you for using the calculator!")
    break
  end
end
