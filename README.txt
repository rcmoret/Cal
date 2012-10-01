Calendar Project -- by Ryan Moret
created: 10/01/2012
updated: 10/01/2012

1. This bit of code was constructed as an assignment for the Nashville Software School.
The goal of this code was to write code that would produce a month or a year similar to the way in which the "cal" function in Unix will produce a month or a year.
2. The code is set up to take in either 1 argument (a 4 digit year from 1800 to 3000) or 2 arguments - month and year (same range of years). 
3. Limitations - this code only works for years 1800 - 3000, and only works for the Julian calendar. Apologies to all of the Gregorian enthusiasts.
4. To execute these files from the terminal command line, one would need to navigate into the lib folder and then call ruby cal.rb followed by the argument(s). Examples:

ruby cal.rb 1999 # Produces the calendar for the entire year 1999
ruby cal.rb 2 1999 # Produces the calendar for the individual month of Feb. 1999

5. Files defining the classes and methods, etc. are located in the lib folder, and the test files are located in the test folder. The tests should be fairly comprehensive, but I am not making any promises. 
6. The author: Ryan Moret 2012.