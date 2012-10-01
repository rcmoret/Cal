require 'test/unit'
require 'cal.rb'


class CalTest < Test::Unit::TestCase
  
  # this will test for (non century) years that are divisible by 4
  def test_01a_number_of_days_in_a_normal_leap_year
    cal = Individual_month.new(2012, 2)
    assert_equal(29, cal.number_of_days_in_given_month)
  end
  
  # this will test for (non century) years that are not divisible by 4
  def test_01b_number_of_days_in_a_normal_nonleap_year 
    cal = Individual_month.new(2013, 2)
    assert_equal(28, cal.number_of_days_in_given_month)
  end
  
  # this will test for century years that are divisible by 400 (should be a leap year)
  def test_01c_number_of_days_in_a_weird_leap_year
    cal = Individual_month.new(2000, 2)
    assert_equal(29, cal.number_of_days_in_given_month)
  end
  
  # this will test for century years that are NOT divisible by 400 (should NOT be a leap year)
  def test_01d_number_of_days_in_a_weird_leap_year
     cal = Individual_month.new(2100, 2)
     assert_equal(28, cal.number_of_days_in_given_month)
  end
  
  # this will test to see if a March returns 31 days
  def test_01e_number_of_days_in_some_months_will_be_31
     cal = Individual_month.new(2012, 3)
     assert_equal(31, cal.number_of_days_in_given_month)
  end
  
  # this will test to see if September returns 30 days
  def test_01f_number_of_days_in_some_months_will_be_30
    cal = Individual_month.new(2012, 9)
    assert_equal(30, cal.number_of_days_in_given_month)
  end
  
  # these 2 will test to see if the number of the month returns the textual representation of the month by number
  def test_02a_textual_representation_of_a_month
    cal = Individual_month.new(2012, 9)
    assert_equal("September", cal.textual_representation_of_the_month)
  end
  
  def test_02b_text_representation_of_another_month
    cal = Individual_month.new(2012, 12)
    assert_equal("December", cal.textual_representation_of_the_month)
  end
  
  def test_11a_center_month_year_string_over_days_of_week
    cal = Individual_month.new(2012, 1)
    test_string_spaces = " " + " " + " " + " " 
    test_string = test_string_spaces + "January 2012" + test_string_spaces  
    assert_equal(test_string, cal.month_and_year_concatenation_centered_line)
  end
  
  def test_11b_center_another_month_year_string_over_days_of_week
    cal = Individual_month.new(2012, 7)
    test_string_spaces = " " + " " + " " + " " + " "
    test_string = test_string_spaces +  "July 2012" + test_string_spaces + " "  
    assert_equal(test_string, cal.month_and_year_concatenation_centered_line)
  end
  
  def test_11c_all_month_year_strings_should_equal_20
    cal = Individual_month.new(2012, 1)
    length = cal.month_and_year_concatenation_centered_line.length
    assert_equal(20, length)
  end
  
  def test_11d_all_month_year_strings_should_equal_20
    cal = Individual_month.new(2012, 7)
    length = cal.month_and_year_concatenation_centered_line.length
    assert_equal(20, length)
  end
  
  # test 16a - 16f will test Zeller's Congruence
  # to find out what the first day of the given month is. Typically Zeller's congruence will return 0 for Sat; 1 for Sun;...6 for Fri. 
  # I have adjusted the results so that the week days are returned will be 0 for Sun; 1 for Mon; ...6 for Sat. 
  def test_16a_zellers_congruence
    cal = Individual_month.new(2012, 2)
    assert_equal(3, cal.week_day_of_first_of_month)
  end

  def test_16b_2nd_zellers_congruence
    cal = Individual_month.new(1999, 4)
    assert_equal(4, cal.week_day_of_first_of_month)
  end
  
  def test_16c_3rd_zellers_congruence
    cal = Individual_month.new(2101, 6)
    assert_equal(3, cal.week_day_of_first_of_month)
  end
  
  def test_16d_4th_zellers_congruence
    cal = Individual_month.new(1934, 1)
    assert_equal(1, cal.week_day_of_first_of_month)
  end
  
  def test_16e_5th_zellers_congruence
    cal = Individual_month.new(1803, 4)
    assert_equal(5, cal.week_day_of_first_of_month)
  end
  
  def test_16f_6th_zeller_congruence
    cal = Individual_month.new(2012, 9)
    assert_equal(6, cal.week_day_of_first_of_month)
  end
  
  def test_19a_print_first_line_of_days
    expected = "          1  2  3  4"
    cal = Individual_month.new(2012, 2)
    assert_equal(expected, cal.print_first_line_of_dates)
  end
  
  def test_20a_print_next_lines_of_days
    cal = Individual_month.new(2012, 2)
    expected = " 5  6  7  8  9 10 11"
    actual = cal.build_array_of_individual_lines
    actual_result = actual[2]
    assert_equal(expected, actual_result)
  end
  
  def test_20a_print_next_lines_of_days
    cal = Individual_month.new(2012, 2)
    expected = "26 27 28 29         "
    actual = cal.build_array_of_individual_lines
    actual_result = actual[5]
    assert_equal(expected, actual_result)
  end
  
  def test_20b_print_the_month_without_header
    cal = Individual_month.new(2012, 2)
    expected  = "Su Mo Tu We Th Fr Sa\n"
    expected += "          1  2  3  4\n"
    expected += " 5  6  7  8  9 10 11\n"
    expected += "12 13 14 15 16 17 18\n"
    expected += "19 20 21 22 23 24 25\n"
    expected += "26 27 28 29         "
    actual = cal.build_array_of_individual_lines.join("\n")
    assert_equal(expected, actual)
  end
    
end 