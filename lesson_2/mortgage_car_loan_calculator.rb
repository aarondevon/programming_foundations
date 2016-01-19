# The following formula is used to calculate the fixed monthly payment
# (payment) required to fully amortize a loan of "loan" dollars over a term of
# "duration" months at a monthly interest rate of "interest".
# [If the quoted rate is 6%, for example, "interest" is .06/12 or .005]
def fixed_monthly_payment(loan, interest, duration)
  payment = loan * (interest * (1 + interest)**duration) / ((1 + interest)**duration - 1)
  payment.round(2)
end

puts "Hi! Welcome to the Mortgage and Auto Loan Calculator."
puts "Please enter your first name."
name = gets.chomp

loop do
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
      elsif y_or_n == "2"
        puts "Okay, What woud you like then?\nFor mortgage type 1\nFor auto type 2"
        auto_mortgage = gets.chomp
      else
        puts "Sorry, That is not a valid option."
      end
    elsif auto_mortgage == "2"
      puts "You selected auto, is that correct\nFor Yes type 1\nFor No type 2"
      y_or_n = gets.chomp
      if y_or_n == "1"
        confirm = true
      elsif y_or_n == "2"
        puts "Okay, What woud you like then?\nFor mortgage type 1\nFor auto type 2"
        auto_mortgage = gets.chomp
      else
        puts "Sorry, That is not a valid option."
      end
    else
      puts "Sorry, That is not a valid option.\nauto loan?\nFor mortgage type 1\nFor auto type 2"
      auto_mortgage = gets.chomp
    end
  end
  puts "Please enter the loan amount #{name}"
  loan_amount = gets.chomp.to_i
  puts "Great, now I'll need the term of the loan in months"
  loan_duration_in_months = gets.chomp.to_i
  puts "And finally I will need the APR"
  puts "Example for 5% 5"
  interest_amount = gets.chomp.to_f / 100 / 12
  puts "Your monthly payment will be $#{fixed_monthly_payment(loan_amount, interest_amount, loan_duration_in_months)}"
  puts "Would you like to enter another loan?\nFor Yes type 1\nFor No type 2"
  another_loan = gets.chomp
  if another_loan == "2"
    break
  end
end
