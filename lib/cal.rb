def days_of_the_week
  {
    0 => "Sat",
    1 => "Sun",
    2 => "Mon",
    3 => "Tue",
    4 => "Wed", 
    5 => "Thu",
    6 => "Fri"
   }
end

def print_week
  print_week ="Su Mo Tu We Th Fr Sa"
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
      if((@year % 4 != 0) || (@year % 25 == 0 && @year % 16 != 0))
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
  
  def month_and_year_concatenation
    this_string = self.textual_representation_of_the_month + " " + @year.to_s
  end
  
  def center_the_month_year_string
    buffer = ""
    difference_in_string_lenghts = print_week.length - self.month_and_year_concatenation.length
    half_of_the_difference = difference_in_string_lenghts/2
    i = 0
    while i < half_of_the_difference
      buffer += " "
      i += 1
    end
    output = buffer + self.month_and_year_concatenation + buffer
    if (difference_in_string_lenghts % 2 != 0)
      output += " "
    end
    return output    
  end
  
  # I will be trying to determine the day of the week for the first day of the month. So, when putting days into Zeller's congruence day will equal 1
  def day_of_month
    day_of_month = 1
  end
  
  def adjusted_month
    if @month <= 2
      @month + 12
    else
      @month
    end 
  end
  
  def adjusted_year
    if @month <= 2
      adjusted_year = @year -1
    else
      adjusted_year = @year
    end
  end
  
  def march_adjustment
    march_adjustment = (adjusted_month + 1) * 2.6
    return march_adjustment.floor
  end
  
  def leap_year_offset
    leap_year_offset = (adjusted_year * 0.25).floor
    leap_year_offset += 6*((adjusted_year * 0.01).floor)
    leap_year_offset += (adjusted_year * 0.0025).floor
  end
  
  def zellers_congruence
    zellers = (day_of_month + march_adjustment + adjusted_year + leap_year_offset) % 7
  end
  
  def adjust_day_of_month_string( given_integer)
    if given_integer <= 9
      integer_as_string = " " + given_integer.to_s
    else 
      integer_as_string = given_integer.to_s
    end
  end
  
  def adjusted_first_day_of_month
    if zellers_congruence != 0
      adjusted_first_day_of_month = zellers_congruence - 1
    else
      adjusted_first_day_of_month = 6
    end
  end
  
  def number_of_spaces_to_buffer_first_day
    result = ""
    return result if adjusted_first_day_of_month == 0
    number_of_spaces_to_buffer = 3 * (adjusted_first_day_of_month) 
    i = 1
    result = ""
    while i <= number_of_spaces_to_buffer
      result += " "
      i += 1
    end
    return result
  end
  
  def print_first_line_of_dates
    output = self.number_of_spaces_to_buffer_first_day
    i = 1
    number_of_days_to_print = 7 - self.adjusted_first_day_of_month
    while i <= number_of_days_to_print
      output += adjust_day_of_month_string( i ) 
      output += " " if i != number_of_days_to_print
      i += 1
    end
    return output 
  end
  
  def build_array_of_individual_lines
    individual_lines = []
    individual_lines << self.center_the_month_year_string
    individual_lines << print_week
    individual_lines << self.print_first_line_of_dates
    i = 8 - self.adjusted_first_day_of_month
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
    array_of_lines.each{|line| puts line}
  end
  
end





