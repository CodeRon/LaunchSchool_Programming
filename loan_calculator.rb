def prompt(msg)
  Kernel.puts("=> #{msg}")
end

def positive_number?(input)
  positive_integer?(input) || positive_float?(input)
end

def positive_integer?(input)
  (input.to_i.to_s == input) && (input.to_i >= 1)
end

def positive_float?(input)
  (input.to_f.to_s == input) && (input.to_i >= 1)
end

prompt("")
prompt("Welcome to the Loan Calculator!")
prompt("")

loop do # main loop
  loan_amount = 0
  loop do
    prompt("Please enter total loan amount: ")
    loan_amount = Kernel.gets().chomp()

    if positive_number?(loan_amount)
      break
    else
      prompt("Number must be greater than 1.")
    end
  end

  apr = 0
  loop do
    prompt("Please enter the APR (e.g., 4 for 4% or 7.2 for 7.2%): ")
    apr = Kernel.gets().chomp()

    if positive_number?(apr)
      break
    else
      prompt("Number must be greater than 1.")
    end
  end

  loan_years = 0
  loop do
    prompt("Please enter the loan duration (in whole years): ")
    loan_years = Kernel.gets().chomp()

    if positive_integer?(loan_years)
      break
    else
      prompt("Number must be greater than 1.")
    end
  end

  # P = L[c(1 + c)**n]/[(1 + c)**n - 1]

  monthly_interest_rate = apr.to_f / 1200
  loan_months = loan_years.to_i * 12

  monthly_payment = loan_amount.to_f *
                    (monthly_interest_rate * (1 + monthly_interest_rate)**loan_months) /
                    ((1 + monthly_interest_rate)**loan_months - 1)
  prompt("")
  prompt("Your monthly payment is: #{format('$%02.2f', monthly_payment)}")
  prompt("")
  prompt("Would you like to calculate another loan?")
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?("y")
end

prompt("Thanks for calculating with us!")
