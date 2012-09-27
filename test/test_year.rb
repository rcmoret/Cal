require 'test/unit'
require 'cal_year.rb'

class YearCalTest < Test::Unit::TestCase
  
  def test_101_centered_year
    new_year = Entire_year.new(2003)
    expected = "2003".center(62)
    assert_equal(expected, new_year.centered_year_string)
  end
  
  def test_102_check_the_size_of_master_array
    party_like_its_1999 = Entire_year.new(1999)
    actual = party_like_its_1999.create_master_array
    assert_equal(12, actual.size)
  end
  
  def test_103_check_an_item_in_the_master_array
    party_like_its_1999 = Entire_year.new(2012)
    year_array = party_like_its_1999.create_master_array
    expected = []
    expected << "February".center(20)
    expected << "Su Mo Tu We Th Fr Sa"
    expected << "          1  2  3  4"
    expected << " 5  6  7  8  9 10 11"
    expected << "12 13 14 15 16 17 18"
    expected << "19 20 21 22 23 24 25"
    expected << "26 27 28 29         "
    expected << " " * 20
    actual = year_array[9]
    assert_equal(expected, actual)
    
  end
  
end