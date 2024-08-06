require_relative 'player'
require_relative 'computer'

class Game
  def initialize
    @player = Player.new('')
    @computer = Computer.new
    @guesses = []
  end

  def enter_player_name
    puts 'Please enter player name'
    @player.name = gets.chomp
  end

  def enter_guess
    puts "Please enter your guesses in the format of 'RRGB' (red, red, green, blue)"
    4.times do |index|
      @guesses[index] = gets.chomp
    end
  end

  def generate_computer_choice
    @computer.get_computerchoice
    p @computer.computer_choice
  end

  def play_round
    enter_guess
    @guesses.each_with_index do |value, index|
      if @guesses[index] == @computer.computer_choice[index] 
        puts "Correct choice for #{value} at index #{index}"
      end
    end
  end
end

g = Game.new
g.generate_computer_choice
g.play_round
