require './app'

class Main
  def initialize
    @app = App.new
  end

  def run
    puts '***   Welcome to Catalog of Things App   ****'.black.on_white.bold
    is_working = true
    while is_working == true
      @app.menu
      user_input = gets.chomp.to_i
      if user_input == 10
        @app.save_data
        is_working = false
      end
      @app.choose_options(user_input)
    end
  end
end

main = Main.new
main.run
