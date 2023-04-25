require_relative './modules/app'
require 'fileutils'

def main
  FileUtils.mkdir_p('data')
  menu =
    "Please select an option:\n" \
    "[1] - All my books          [4] - All genres   [7] - Add a book\n" \
    "[2] - All my music albums   [5] - All labels   [8] - Add a music album\n" \
    "[3] - All my games          [6] - All authors  [9] - Add a game\n" \
    "[10] - Exit\n" \
    "Enter an option:\n"
  app = App.new
  while menu
    print menu
    user_option = gets.chomp.to_i
    if user_option == 10
      app.write_files
      break
    else
      app.evaluate_options(user_option)
    end
  end
end

main
