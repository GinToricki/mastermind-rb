require_relative 'player'
require_relative 'computer'

class Game
  def initialize
    @player = Player.new('')
    @computer = Computer.new
    @guesses = []
    @correct_choices = []
    @guessed_colors = {}
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

  def set_hashes
    @computer.computer_choice.each do |value|
      @guessed_colors[value] = if @guessed_colors.has_key?(value)
                                 @guessed_colors[value] + 1
                               else
                                 1
                               end
    end
    puts @guessed_colors
  end

  def play_round
    enter_guess
    set_hashes
    @guesses.each_with_index do |value, index|
      if @guesses[index] == @computer.computer_choice[index]
        @correct_choices.unshift('R')
        @guessed_colors[value] = @guessed_colors[value] - 1
      elsif @computer.computer_choice.include?(@guesses[index]) && @guessed_colors[value] > 0
        @correct_choices << 'W'
        @guessed_colors[value] = @guessed_colors[value] - 1
      end
    end
    puts @correct_choices
  end

  def check_win
    if @correct_choices.count('R') == 4
      puts "You win"
      return false
    end

    true
  end

  def play_game
    count = 0
    while check_win
      @correct_choices = []
      @guessed_colors = {}
      play_round
      count += 1
      break if count == 5
    end
  end
end

g = Game.new
g.generate_computer_choice
g.set_hashes
g.play_game
