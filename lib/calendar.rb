WEEKDAYS_ABBREVIATED ="Su Mo Tu We Th Fr Sa"

NUM_CHARS_IN_LINE = WEEKDAYS_ABBREVIATED.length

class IndividualMonth
  
  def initialize year, month
    @year = year
    @month = month
  end
    
  def number_days_in_a_month
    if [1, 3, 5, 7, 8, 10, 12].include?(@month)
      number_of_days = 31
    elsif[4, 6, 9, 11].include?(@month)
      number_of_days = 30
    else # this else statement will handle the number of days in Feb.      
      if((@year % 4 != 0) || (@year % 100 == 0 && @year % 400 != 0))
        number_of_days = 28
      else
        number_of_days = 29
      end
    end
  end

  def month_name_text
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

  # Zeller's Conrgruence (info: http://en.wikipedia.org/wiki/Zeller%27s_congruence)
  def number_days_in_1st_week
    day_of_month = 1 # This will be 1 representing the 1st of the month
    
    # Adjustments: Zeller's treats Jan & Feb as the 13th & 14th months of prev. year
    adjusted_year = @month <= 2 ? @year -1 : @year
    adjusted_month = @month <= 2 ? @month + 12 : @month

    march_adjustment = ((adjusted_month + 1) * 2.6).floor
    leap_year_offset = adjusted_year/4 + (6 * (adjusted_year/100)) + adjusted_year/400
    
    day_of_week = (day_of_month + adjusted_year + march_adjustment + leap_year_offset) % 7
    
    number_days_in_1st_week = day_of_week != 0 ?  8 - day_of_week : 1
  end

  def first_line_of_dates
    output = ''
    (1..number_days_in_1st_week).each do |day|
      output += (day).to_s.rjust(2)
      output += ' ' unless (day) == (number_days_in_1st_week)
    end
    output.rjust(NUM_CHARS_IN_LINE)
  end
  
  def build_array_of_individual_lines
    individual_lines = [] 
    single_line = ''
    (number_days_in_1st_week + 1..number_days_in_a_month).each do |day_of_the_month|
      single_line += day_of_the_month.to_s.rjust(2)
      end_of_week = (day_of_the_month - number_days_in_1st_week) % 7 != 0 ? false : true
      if !(end_of_week || day_of_the_month == number_days_in_a_month)
        single_line += ' '
      else
        individual_lines << single_line.ljust(NUM_CHARS_IN_LINE)
        single_line = ''        
      end
   end
   individual_lines
  end
  
  def finish_array
    month_and_year = (month_name_text + " " + @year.to_s).center(NUM_CHARS_IN_LINE)
    finished_array = [] << month_and_year
    finished_array << WEEKDAYS_ABBREVIATED
    finished_array << first_line_of_dates
    finished_array += build_array_of_individual_lines
  end
  
end