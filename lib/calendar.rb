require 'cal'
month = ARGV[0].to_i
year = ARGV[1].to_i
msg = ""
  if (month > 12 || month < 1)
    month_error = true
    msg += "You did not enter a valid number for the month. Please enter an integer between 1 and 12\n"
  else
    month_error = false
  end
  
  if (year > 3000 || year < 1800)
    year_error = true
    msg += "You did not enter a valid number for the the year. Please enter the four digit year between 1800 and 3000\n"
  else
    year_error = false
  end
  

  if !month_error && !year_error
    cal = Individual_month.new(year, month)
    cal.print_all_month
  else
    puts msg
  end