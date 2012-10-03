WEEK_DAY_ABBREVIATIONS ="Su Mo Tu We Th Fr Sa"
NUMBER_CHARS_IN_LINE = WEEK_DAY_ABBREVIATIONS.length

class IndividualMonth
  
  def initialize(year, month)
    @year = year
    @month = month
  end
  
  def number_of_days_in_given_month
    if [1, 3, 5, 7, 8, 10, 12].include?(@month)
      number_of_days = 31
    elsif[4, 6, 9, 11].include?(@month)
      number_of_days = 30
    else # This else statement will handle the number of days in Feb.      
      # Years that are NOT divisible by 4 and those that are divisible by 100, but not 400 will not be leap years
      if((@year % 4 != 0) || (@year % 100 == 0 && @year % 400 != 0))
        number_of_days = 28
      else
        number_of_days = 29
      end
    end
  end

  def textual_representation_of_the_month
    case @month
    when 1 
      "January"
    when 2
      "February"
    when 3
      "March"
    when 4
      "April"
    when 5
      "May"
    when 6
      "June"
    when 7
      "July"
    when 8
      "August"
    when 9
      "September"
    when 10
      "October"
    when 11
      "November"
    when 12
      "December"
    end 
  end

  # ZELLER'S CONGRUENCE (more info: http://en.wikipedia.org/wiki/Zeller%27s_congruence)
  # This algorithm will return the weekday as a digit for a date (given the month, day & year as variables)
  def weekday_of_1st_of_month
    day_of_month = 1 # This will be 1 representing the 1st of the month
    
    # Adjustments - Zeller's alg. treats Jan & Feb as the 13th & 14th months of prev. year

    # Year
    adjusted_year = @month <= 2 ? @year -1 : @year
    
    # Month
    adjusted_month = @month <= 2 ? @month + 12 : @month
    
    # Algorithm after adjustments.
    march_adjustment = ((adjusted_month + 1) * 2.6).floor
    leap_year_offset += (adjusted_year * 0.25).floor
    leap_year_offset += 6*((adjusted_year * 0.01).floor)
    leap_year_offset += (adjusted_year * 0.0025).floor
    day_of_week = (day_of_month + march_adjustment + adjusted_year + leap_year_offset) % 7
    
    # Zeller's Congruence returns (0=Sat; 1 = Sun;...6=Fri)
    # For my purposes, it will be easier if an adjustment is made so  0 = Sun; 1 = Mon;...6 = Sat.
    day_of_week != 0 ? weekday_of_1st_of_month = day_of_week - 1 : weekday_of_1st_of_month = 6
  end

  def first_line_of_dates
    output = String.new
    
    number_of_days_in_first_week = 7 - weekday_of_1st_of_month
    # This loop will add the day number for each day in the first week
    day_number = 1 
    while day_number <= number_of_days_in_first_week
      output += day_number.to_s.rjust(2)
      output += " " unless day_number == number_of_days_in_first_week
      day_number += 1
    end
    return output.rjust(NUMBER_CHARS_IN_LINE)
  end
  
  def build_array_of_individual_lines
    individual_lines = []
    
    # Days of the Week
    individual_lines << WEEK_DAY_ABBREVIATIONS
    
    #Here I will add the first week line
    individual_lines << self.first_line_of_dates
    
    day_of_the_month = 8 - self.weekday_of_1st_of_month # This will begin w/ the first day of 2nd week of the month
    single_line = String.new
    k = 1 # "k" will be incremented through the loop, & will be used to determine when breaks are needed
    while day_of_the_month <= number_of_days_in_given_month
      single_line += day_of_the_month.to_s.rjust(2)
      single_line += " " if (k % 7 != 0 && day_of_the_month != number_of_days_in_given_month)
      
      if (k % 7 == 0 || day_of_the_month == number_of_days_in_given_month) # End of the week or month. Insert the string into the array and reset the string
        individual_lines << single_line.ljust(NUMBER_CHARS_IN_LINE) # Insert the sting into the array.
        single_line = String.new # Reset the string.
      end
      
      day_of_the_month += 1
      k += 1
    end
    return individual_lines
  end
  
  def finish_array
    almost_finished_array = self.build_array_of_individual_lines
    month_and_year = self.textual_representation_of_the_month + " " + @year.to_s
    finished_array = almost_finished_array.insert(0, month_and_year.center(NUMBER_CHARS_IN_LINE))
    if @year == 1999 # This is an 'easter egg' (see http://en.wikipedia.org/wiki/Easter_egg_(media) for more info)
      finished_array.insert(1, "We're going to party like it's 1999".center(NUMBER_CHARS_IN_LINE))      
    end
    return finished_array
  end
  
end