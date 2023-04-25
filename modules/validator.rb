module Validator
  def validate_empty(option)
    input = gets.chomp
    while input.empty?
      print "Please enter a valid input for #{option}:\n"
      input = gets.chomp
    end
    input
  end
  def validate_date
    date = validate_empty('date [YYYY-MM-DD]')
    until isvalid_date?(date)
      print "Please enter a valid date format [YYYY-MM-DD]\n"
      date = validate_date()
    end
    date
  end

  def isvalid_date?(date)
    if date.match(/\d{4}-\d{2}-\d{2}/)
      arr = date.split('-').map(&:to_i)
      Date.valid_date?(arr[0], arr[1], arr[2])
    else
      false
    end
  end
end
