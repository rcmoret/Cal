
def print_week
  print_week ="Su Mo Tu We Th Fr Sa"
end

def line_length
  line_length = print_week.length
end

class Individual_month
  
  def initialize( year , month )
    @year = year
    @month = month
  end
  
  def number_of_days_in_given_month
    if [1,3,5,7,8,10,12].include?(@month)
      number_of_days = 31
    elsif[4, 6, 9, 11].include?(@month)
      number_of_days = 30
    else 
      
      # this else statement will handle the number of days in Feb.
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
      then month_name_as_text = "January"
    when 2
      then month_name_as_text = "February"
    when 3
      then month_name_as_text = "March"
    when 4
      then month_name_as_text = "April"
    when 5
      then month_name_as_text = "May"
    when 6
      then month_name_as_text = "June"
    when 7
      then month_name_as_text = "July"
    when 8
      then month_name_as_text = "August"
    when 9
      then month_name_as_text = "September"
    when 10
      then month_name_as_text = "October"
    when 11
      then month_name_as_text = "November"
    when 12
      then month_name_as_text = "December"
    end 
  end
  
  def month_and_year_concatenation_centered_line
    # Concatenate the month and year
    month_and_year = self.textual_representation_of_the_month + " " + @year.to_s
    
    # Center month and year on the line.
    buffered_month_and_year = month_and_year.center(line_length)
  end
  
  # For zeller's congruence, it will need a number 3 - 14; 
  # Jan & Feb will be treated as 13 & 14. All other months will be treated normally
  def adjusted_month
    if @month <= 2
      @month + 12
    else
      @month
    end 
  end
  
  # For zeller's congruence, Jan & Feb will be treated as the 13th/14th month of
  # the preceeding year. So, if the month in question is Jan or Feb, the year will
  # need to be adjusted by subtracting 1
  def adjusted_year
    if @month <= 2
      adjusted_year = @year -1
    else
      adjusted_year = @year
    end
  end
  
  # Zeller's Congruence
  # This algorithm will return the weekday (0=Sat; 1 = Sun;...6=Fri) for a date (given the month, day & year as variables)
  def week_day_of_first_of_month
    day_of_month = 1 # This will be 1 representing the 1st of the month
    march_adjustment = ((adjusted_month + 1) * 2.6).floor
    leap_year_offset = (adjusted_year * 0.25).floor
    leap_year_offset += 6*((adjusted_year * 0.01).floor)
    leap_year_offset += (adjusted_year * 0.0025).floor
    day_of_week = (day_of_month + march_adjustment + adjusted_year + leap_year_offset) % 7
    
    # Zeller's Congruence will return (0=Sat; 1 = Sun;...6=Fri)
    # For my purposes, it will be easier I adjust that so that 0 = Sun; 1 = Mon;...6 = Sat.
    day_of_week != 0 ? week_day_of_first_of_month = day_of_week - 1 : week_day_of_first_of_month = 6
  end
  
  def adjust_day_of_month_string( given_integer)
    integer_as_string = ""
    given_integer <= 9 ? integer_as_string = " " + given_integer.to_s : integer_as_string = given_integer.to_s
  end

  def number_of_spaces_to_buffer_first_day
    result = ""
    return result if week_day_of_first_of_month == 0
    result = " " * (3 * week_day_of_first_of_month)
  end
  
  def print_first_line_of_dates
    output = self.number_of_spaces_to_buffer_first_day
    i = 1
    number_of_days_to_print = 7 - self.week_day_of_first_of_month
    while i <= number_of_days_to_print
      output += adjust_day_of_month_string( i ) 
      output += " " if i != number_of_days_to_print
      i += 1
    end
    return output 
  end
  
  def build_array_of_individual_lines
    individual_lines = []
    individual_lines << month_and_year_concatenation_centered_line
    individual_lines << print_week
    individual_lines << self.print_first_line_of_dates
    i = 8 - self.week_day_of_first_of_month
    single_line = ""
    k = 1
    number_days = self.number_of_days_in_given_month
    while i <= number_days
      single_line += adjust_day_of_month_string(i)
      single_line += " " if (k % 7 != 0 && i != number_days)
      if (k % 7 == 0 || i == number_days)
        individual_lines << single_line
        single_line = ""
      end
      i += 1
      k += 1
    end
    return individual_lines
  end
  
  def print_all_month
    array_of_lines = self.build_array_of_individual_lines
    # array_of_lines.each{|line| puts line}
    array_of_lines.join("\n")
  end
  
end





