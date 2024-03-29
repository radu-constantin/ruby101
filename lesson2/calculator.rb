# ask the user for two numbers
# ask the user for an operation to perform
# perform the operation on the two numbers
# output the result
def prompt(message) #method for general messages
  Kernel.puts("=>#{message}")
end

def valid_number?(input)
  input.to_i.to_s == input
end

def operation_to_message(op) #method to add the string that describes what operation is happening after user input
  case op
  when '1'
    'Adding'
  when '2'
    'Substracting'
  when '3'
    'Multiplying'
  when '4'
    'Dividing'
  end
end

prompt('Welcome to the Calculator! Enter your name:')

name = ''
loop do
  name = Kernel.gets().chomp()
  if name.empty?()
    prompt("Make sure to use a valid name.")
  else
    break
  end
end

prompt("Hi #{name}!")

loop do #main loop
  number1 = ''
  loop do
    prompt("What's the first number?")
    number1 = Kernel.gets().chomp
    if valid_number?(number1)
      break
    else
  prompt("Hmm.. that doesn't look like a valid number.")
    end
  end

  number2 = ''
  loop do
    prompt("What's the second number?")
    number2 = Kernel.gets().chomp
    if valid_number?(number2)
      break
    else
  prompt("Hmm.. that doesn't look like a valid number.")
    end
  end

  operator_prompt = <<-MSG
    What operation would you like to perform?
    1) add
    2) substract
    3) multiply
    4) divide
    MSG

    prompt(operator_prompt)

operator = ''
loop do
  operator = Kernel.gets().chomp()

  if %w(1 2 3 4).include?(operator)
    break
  else
    prompt("Must choose 1, 2, 3 or 4")
  end
end

prompt("#{operation_to_message(operator)} the two numbers...")

  result = case operator
    when '1'
     number1.to_i + number2.to_i
    when '2'
     number1.to_i - number2.to_i
    when '3'
     number1.to_i * number2.to_i
    when '4'
     number1.to_f / number2.to_f
  end

  prompt("The resut is #{result}.")

  prompt("Do you want to perform another calculation?(Y to calculate again)")
  answer = Kernel.gets().chomp()
  break unless answer.downcase.start_with?('y')
end

prompt("Thank you for using the calculator. Goodbye!")
