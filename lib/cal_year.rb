require 'calendar'

class EntireYear < IndividualMonth

  def initialize year
    @year = year
  end
  
  def create_year_array
    year_array = []
    (1..12).each do |month|
      this_instance = IndividualMonth.new(@year, month)
      single_month_array = [] << this_instance.month_name_text.center(NUM_CHARS_IN_LINE)
      single_month_array << WEEKDAYS_ABBREVIATED
      single_month_array << this_instance.first_line_of_dates
      single_month_array << this_instance.build_array_of_individual_lines 
      single_month_array << ' ' * NUM_CHARS_IN_LINE if single_month_array.size < 8
      year_array << single_month_array.flatten
    end
    year_array
  end
  
  def finish_whole_year
    line_array = [] << "\n" + @year.to_s.center(64) + "\n"
    quarters = []
    (create_year_array.size/3).times{ |i| quarters.push create_year_array[i*3..(i*3)+2] }
    quarters.each { |quarter| line_array << quarter_loop(quarter) }
    line_array << "\n"
    line_array.flatten
  end
  
  def quarter_loop quarter_array
    month_index = 0; line_index = 0
    line_array = []; 
    single_string = ''
    while quarter_array[month_index][line_index]
      single_string += quarter_array[month_index][line_index] + '  '
      if month_index == 2 # Add to the array, increment line_index and reset 
        line_array << single_string
        single_string = ''
        line_index += 1; month_index = 0
      else # Just increment the month_index
        month_index += 1
      end
    end
    line_array
  end

end