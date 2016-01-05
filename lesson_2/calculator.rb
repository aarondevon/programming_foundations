def prompt(message)
  Kernel.puts("=> #{message}")
end

prompt("Welcome to Calulator!")

prompt("What's the first number?")
number1 = Kernel.gets().chomp()

prompt("What's the second number?")
number2 = Kernel.gets().chomp()

prompt("What operation would you like to perform? 1) add 2) subtract 3) mulitply 4) divide")
operator = Kernel.gets().chomp()

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



Kernel.puts("the result is #{result}")

