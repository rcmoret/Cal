require 'test/unit'
require 'cal_year.rb'

class YearCalTest < Test::Unit::TestCase
  
  def test_101_centered_year
    new_year = Entire_year.new(2003)
    expected = "2003".center(62)
    assert_equal(expected, new_year.centered_year_string)
  end
  
  def test_102_create_months_is_a_hash
    party_like_1999 = Entire_year.new(1999)
    actual = party_like_1999.create_month_instances
    assert_equal(true, actual.is_a?(Hash))
  end
  
  def test_103_print_the_hash
    party_like_1999 = Entire_year.new(1999)
    expected_array = []
    actual_array = []
    expected_array << "\nthis is January and its value is an individual month object"
    expected_array << "\nthis is February and its value is an individual month object"
    expected_array << "\nthis is March and its value is an individual month object"
    actual = party_like_1999.create_month_instances
    actual.each do |key, value|
      result = value.is_a?(Individual_month) ? "an individual month object" : "not the right kind of object"
      test_string = "\nthis is #{key} and its value is " + result
      actual_array << test_string
    end
    assert_equal(expected_array.sort, actual_array.sort)
  end
  
end