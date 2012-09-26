require 'test/unit'
require 'cal.rb'


class CalTest < Test::Unit::TestCase
  # this will test for (non century) years that are divisible by 4
  def test_01_number_of_days_in_a_normal_leap_year
    cal = Individual_month.new(2012, 2)
    assert_equal(29, cal.number_of_days_in_given_month)
  end
  
  # this will test for (non century) years that are not divisible by 4
  def test_02_number_of_days_in_a_normal_nonleap_year 
    cal = Individual_month.new(2013, 2)
    assert_equal(28, cal.number_of_days_in_given_month)
  end
  
  # this will test for century years that are divisible by 400 (should be a leap year)
  def test_03_number_of_days_in_a_weird_leap_year
    cal = Individual_month.new(2000, 2)
    assert_equal(29, cal.number_of_days_in_given_month)
  end
  
  # this will test for century years that are NOT divisible by 400 (should NOT be a leap year)
  def test_04_number_of_days_in_a_weird_leap_year
     cal = Individual_month.new(2100, 2)
     assert_equal(28, cal.number_of_days_in_given_month)
  end
  
  # this will test to see if a March returns 31 days
  def test_05_number_of_days_in_some_months_will_be_31
     cal = Individual_month.new(2012, 3)
     assert_equal(31, cal.number_of_days_in_given_month)
  end
  
  # this will test to see if September returns 30 days
  def test_06_number_of_days_in_some_months_will_be_30
    cal = Individual_month.new(2012, 9)
    assert_equal(30, cal.number_of_days_in_given_month)
  end
  
  # these 2 will test to see if the number of the month returns the textual representation of the month by number
  def test_07_textual_representation_of_a_month
    cal = Individual_month.new(2012, 9)
    assert_equal("September", cal.textual_representation_of_the_month)
  end
  
  def test_08_text_representation_of_another_month
    cal = Individual_month.new(2012, 12)
    assert_equal("December", cal.textual_representation_of_the_month)
  end
  
  def test_09_print_week_prints_abbreviated_days_of_the_week
    assert_equal("Su Mo Tu We Th Fr Sa", print_week)
  end
  
  def test_10_concatenation_the_month_name_and_year
    cal = Individual_month.new(2012, 1)
    assert_equal("January 2012", cal.month_and_year_concatenation)
  end
  
  def test_11a_center_month_year_string_over_days_of_week
    cal = Individual_month.new(2012, 1)
    test_string_spaces = " " + " " + " " + " " 
    test_string = test_string_spaces + "January 2012" + test_string_spaces  
    assert_equal(test_string, cal.center_the_month_year_string)
  end
  
  def test_11b_center_another_month_year_string_over_days_of_week
    cal = Individual_month.new(2012, 7)
    test_string_spaces = " " + " " + " " + " " + " "
    test_string = test_string_spaces +  "July 2012" + test_string_spaces + " "  
    assert_equal(test_string, cal.center_the_month_year_string)
  end
  
  def test_11c_all_month_year_strings_should_equal_20
    cal = Individual_month.new(2012, 1)
    length = cal.center_the_month_year_string.length
    assert_equal(20, length)
  end
  
  def test_11d_all_month_year_strings_should_equal_20
    cal = Individual_month.new(2012, 7)
    length = cal.center_the_month_year_string.length
    assert_equal(20, length)
  end
  
  def test_12a_call_a_day_of_the_week_by_key
    assert_equal("Mon", days_of_the_week[2] )
  end
  
  def test_12b_call_another_day_of_the_week_by_key
    assert_equal("Sat", days_of_the_week[0] )
  end
  
  def test_13a_adjusted_month_add_twelve_for_jan
      cal = Individual_month.new(2012, 1)
      assert_equal(13, cal.adjusted_month)
  end
  
  def test_13b_adjust_month_usually_return_unadjusted_month
    cal = Individual_month.new(2012, 5)
    assert_equal(5, cal.adjusted_month)
  end
  
  def test_14a_adjusted_year_subtracts_one_for_jan
      cal = Individual_month.new(2012, 1)
      assert_equal(2011, cal.adjusted_year)
  end
  
  def test_13b_adjust_year_usually_return_unadjusted_year
    cal = Individual_month.new(2012, 5)
    assert_equal(2012, cal.adjusted_year)
  end
  
  def test_14a_march_adjustment
    cal = Individual_month.new(2012, 5)  
    assert_equal(15, cal.march_adjustment)
  end
  
  def test_14b_another_march_adjustment
    cal = Individual_month.new(2012, 10)  
    assert_equal(28, cal.march_adjustment)
  end
  
  def test_15a_leap_year_offset
    cal = Individual_month.new(2012, 5)
    assert_equal(628, cal.leap_year_offset)
  end
  
  def test_15b_leap_year_offset_changes_if_jan_or_feb
    cal = Individual_month.new(2012, 2)
    assert_equal(627, cal.leap_year_offset)
  end
  
  def test_15c_a_3rd_leap_year_offset_test
    cal = Individual_month.new(2005, 10)
    assert_equal(626, cal.leap_year_offset)    
  end
  
  def test_15d_a_4th_leap_year_offset_test
    cal = Individual_month.new(2005, 1)
    assert_equal(626, cal.leap_year_offset)
  end
  
  def test_16a_zellers_congruence
    cal = Individual_month.new(2012, 2)
    assert_equal(4, cal.zellers_congruence)
  end

  def test_16b_2nd_zellers_congruence
    cal = Individual_month.new(1999, 4)
    assert_equal(5, cal.zellers_congruence)
  end
  
  def test_16c_3rd_zellers_congruence
    cal = Individual_month.new(2101, 6)
    assert_equal(4, cal.zellers_congruence)
  end
  
  def test_16d_4th_zellers_congruence
    cal = Individual_month.new(1934, 1)
    assert_equal(2, cal.zellers_congruence)
  end
  
  def test_16e_5th_zellers_congruence
    cal = Individual_month.new(1803, 4)
    assert_equal(6, cal.zellers_congruence)
  end
  
  def test_16f_6th_zeller_congruence
    cal = Individual_month.new(2012, 9)
    assert_equal(0, cal.zellers_congruence)
  end
  
  def test_17a_number_of_spaces_to_buffer
    cal = Individual_month.new(2012, 2)
    assert_equal("         ", cal.number_of_spaces_to_buffer_first_day)
  end
  
  def test_17b_number_of_spaces_to_buffer
    cal = Individual_month.new(2012, 1)
    assert_equal("", cal.number_of_spaces_to_buffer_first_day)
  end
  
  def test_17c_number_of_spaces_to_buffer
    cal = Individual_month.new(2012, 10)
    assert_equal("   ", cal.number_of_spaces_to_buffer_first_day)
  end
  
  def test_17d_number_of_spaces_to_buffer
    cal = Individual_month.new(2012, 9)
    expected = "                  "
    assert_equal(expected, cal.number_of_spaces_to_buffer_first_day)
  end
  
  def test_18a_single_digit_integer_should_be_prepended_w_a_space
    cal = Individual_month.new(2012, 2)
    result = cal.adjust_day_of_month_string(1)
    assert_equal(" 1", result)
  end
  
  def test_18b_single_digit_integer_should_be_prepended_w_a_space
    cal = Individual_month.new(2012, 2)
    result = cal.adjust_day_of_month_string(10)
    assert_equal("10", result)
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
    expected = "26 27 28 29"
    actual = cal.build_array_of_individual_lines
    actual_result = actual[6]
    assert_equal(expected, actual_result)
  end
  
  def test_21a_print_a_whole_month
    cal = Individual_month.new(2012, 2)
    expected =  "   February 2012    \n"
    expected += "Su Mo Tu We Th Fr Sa\n"
    expected += "          1  2  3  4\n"
    expected += " 5  6  7  8  9 10 11\n"
    expected += "12 13 14 15 16 17 18\n"
    expected += "19 20 21 22 23 24 25\n"
    expected += "26 27 28 29"
    assert_equal(expected, cal.print_all_month)
  end
end 