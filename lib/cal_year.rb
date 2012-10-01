require 'calendar'

class Entire_year < Individual_month

  def initialize(input_year)
    @year = input_year
  end
  
  def centered_year_string
    centered_year = @year.to_s.center(62)
#    return centered_year.center(62) # The year calendar is 62 characters wide
  end
  
  def create_master_array
    # The master array will contain an array for the lines for each month
    master_array = []
    
    # The months iteration will be defined 1 thru 12 so that I can
    # loop thru and create nested arrays for each individual month
    months_iterations = (1..12).to_a
    
    single_month_array = []
    months_iterations.each do |month|
      this_instance = Individual_month.new(@year, month)
      
      single_month_array << this_instance.textual_representation_of_the_month.center(line_length)
      single_month_array << this_instance.build_array_of_individual_lines
      single_month_array << (" " * 20) if single_month_array.size < 8
      
      master_array << single_month_array.flatten
      single_month_array = []
    end
    return master_array
  end
  
  def output_whole_year
    lines = []
    lines << "\n" + @year.to_s.center(64) + "\n"
    if @year == 1999
      lines << "We're going to party like it's 1999!\n".center(62)
    end
    
    whole_year_array = self.create_master_array
    
    quarters = []
    (whole_year_array.size/3).times do |i|
      quarters.push whole_year_array[i*3..(i*3)+2]
    end
    
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
