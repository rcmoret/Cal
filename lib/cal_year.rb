require 'calendar'

class EntireYear < IndividualMonth

  def initialize(input_year)
    @year = input_year
  end
  
  def centered_year_string  
    centered_year = @year.to_s.center(64)
  end
  
  def create_master_array
    # The master array will contain an array for the lines for each month
    master_array = []
    
    # The months iteration will be defined 1 thru 12 so that I can loop thru and create nested arrays for each individual month
    months_iterations = (1..12).to_a
    
    single_month_array = []
    # This loop will create a instance of each month and place that month's lines into a master array
    months_iterations.each do |month|
      this_instance = IndividualMonth.new(@year, month)
      
      single_month_array << this_instance.textual_representation_of_the_month.center(NUMBER_CHARS_IN_LINE)
      single_month_array << this_instance.build_array_of_individual_lines
      # This line will insure that all of the months have the same number of lines
      single_month_array << (" " * NUMBER_CHARS_IN_LINE) if single_month_array.size < 8
      
      master_array << single_month_array.flatten 
      single_month_array = [] # Reset this array before running through the loop again.
    end
    return master_array
  end
  
  def whole_year_array
    lines = [] # This array will contain each line which can be output later
    lines << "\n" + @year.to_s.center(64) + "\n"
    if @year == 1999 # This is an 'easter egg' (see http://en.wikipedia.org/wiki/Easter_egg_(media) for more info)
      lines << "We're going to party like it's 1999!\n".center(64)
    end
    
    whole_year_array = self.create_master_array
    
    # Divide the calendar into quarters (3 months each) and group those months (which are arrays) into an array
    quarters = []
    (whole_year_array.size/3).times do |i|
      quarters.push whole_year_array[i*3..(i*3)+2]
    end
    
    # For each quarter (array) loop thru and concatenate the lines from individual months and places those lines into the lines array
    quarters.each do |quarter|
      output = String.new
      line_index = 0 # This will be the outer loop
      month_index = 0 # This will be the inner loop. 
      while quarter[month_index][line_index]
        output += quarter[month_index][line_index] + "  "
        
        if month_index == 2 # Add to the array, increment line_index and reset month_index and string
          lines << output
          output = String.new
          line_index += 1
          month_index = 0
        else # Just increment the month_index
          month_index += 1
        end
        
      end
    end
    lines << "\n"
    return lines
  end

end
