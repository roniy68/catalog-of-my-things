require_relative './modules/app'

def main
  menu = " Please select an option:\n[1] - All my books\n[2] - All my music albums\n[3] - All my games\n[4] - All genres\n[5] - All labels\n[6] - All authors\n[7] - Add a book\n[8] - Add a music album\n[9] - Add a game\n[10] - Exit"
  app = App.new
  while menu
    print menu
    print "Enter an option:\n"
    user_option = gets.chomp.to_i
    break if user_option == 10

    app.evaluate_options(user_option)

  end
end

main
