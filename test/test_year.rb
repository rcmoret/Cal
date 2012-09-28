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
    actual = year_array[1]
    assert_equal(expected, actual)
  end
  
  def test_104_what_does_an_individual_month_in_year_look_like
    party_like_its_1999 = Entire_year.new(1999)
    expected = 
    """
                                 1999                               \n\n
          January               February               March        \n
    Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa\n
                    1  2      1  2  3  4  5  6      1  2  3  4  5  6\n
     3  4  5  6  7  8  9   7  8  9 10 11 12 13   7  8  9 10 11 12 13\n
    10 11 12 13 14 15 16  14 15 16 17 18 19 20  14 15 16 17 18 19 20\n
    17 18 19 20 21 22 23  21 22 23 24 25 26 27  21 22 23 24 25 26 27\n
    24 25 26 27 28 29 30  28                    28 29 30 31         \n 
    31                                                              \n
           April                  May                   June        \n 
    Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa\n
                 1  2  3                     1         1  2  3  4  5\n
     4  5  6  7  8  9 10   2  3  4  5  6  7  8   6  7  8  9 10 11 12\n
    11 12 13 14 15 16 17   9 10 11 12 13 14 15  13 14 15 16 17 18 19\n
    18 19 20 21 22 23 24  16 17 18 19 20 21 22  20 21 22 23 24 25 26\n
    25 26 27 28 29 30     23 24 25 26 27 28 29  27 28 29 30         \n
                          30 31                                     \n
            July                 August              September      \n
    Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa\n
                 1  2  3   1  2  3  4  5  6  7            1  2  3  4\n
     4  5  6  7  8  9 10   8  9 10 11 12 13 14   5  6  7  8  9 10 11\n
    11 12 13 14 15 16 17  15 16 17 18 19 20 21  12 13 14 15 16 17 18\n
    18 19 20 21 22 23 24  22 23 24 25 26 27 28  19 20 21 22 23 24 25\n
    25 26 27 28 29 30 31  29 30 31              26 27 28 29 30      \n
                                                                    \n
          October               November              December      \n
    Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa\n
                    1  2      1  2  3  4  5  6            1  2  3  4\n
     3  4  5  6  7  8  9   7  8  9 10 11 12 13   5  6  7  8  9 10 11\n
    10 11 12 13 14 15 16  14 15 16 17 18 19 20  12 13 14 15 16 17 18\n
    17 18 19 20 21 22 23  21 22 23 24 25 26 27  19 20 21 22 23 24 25\n
    24 25 26 27 28 29 30  28 29 30              26 27 28 29 30 31   \n
    31                                                              """
    actual = party_like_its_1999.output_whole_year
    assert_equal(expected, actual)
  end
  
end