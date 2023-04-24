class App
  def initalize; end

  # rubocop:disable Metrics/CyclomaticComplexity
  # rubocop:disable Metrics/MethodLength
  def evaluate_options(option)
    case option
    when 1
      puts 'implement option 1'
    when 2
      puts 'implement option 2'
    when 3
      puts 'implement option 3'
    when 4
      puts 'implement option 4'
    when 5
      puts 'implement option 5'
    when 6
      puts 'implement option 6'
    when 7
      puts 'implement option 7'
    when 8
      puts 'implement option 8'
    when 9
      puts 'implement option 9'
    else
      print "Please enter a valid option:\n"
    end
  end
  # rubocop:enable Metrics/CyclomaticComplexity
  # rubocop:enable Metrics/MethodLength
end
