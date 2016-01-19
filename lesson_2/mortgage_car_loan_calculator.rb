# The following formula is used to calculate the fixed monthly payment
# (P) required to fully amortize a loan of L dollars over a term of
# n months at a monthly interest rate of c.
# [If the quoted rate is 6%, for example, c is .06/12 or .005]
def fixed_monthly_payment(l, c, n)
  payment = l * (c * (1 + c)**n) / ((1 + c)**n - 1)
  puts c
  payment.round(2)
end

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
puts "Please enter the loan amount #{name}"
loan = gets.chomp.to_i
puts "Great, now I'll need the term of the loan in months"
months = gets.chomp.to_i
puts "And finally I will need the APR"
puts "Example for 5% 5"
interest = gets.chomp.to_f / 100

puts "Your monthly payment will be $#{fixed_monthly_payment(loan, interest, months)}"
