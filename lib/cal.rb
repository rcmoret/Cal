require 'calendar'
require 'cal_year'

if ARGV[0].length == 4
  individual_year = ARGV[0].to_i
end

if individual_year
  if (individual_year > 3000 || individual_year < 1800)
    year_error = true
    msg += "You did not enter a valid number for the the year. Please enter the four digit year between 1800 and 3000\n"
  else
    year_error = false
  end

  unless year_error
    new_year = EntireYear.new(individual_year)
    print new_year.organize_whole_year.join("\n")
  else
    print msg
  end
  
else

  month = ARGV[0].to_i
  year = ARGV[1].to_i
  msg = String.new
  
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
  
    if !(month_error || year_error)
      print "\n"
      cal = IndividualMonth.new(year, month)
      print cal.finish_array.join("\n") + "\n\n"
    else
      puts msg
    end
  
end