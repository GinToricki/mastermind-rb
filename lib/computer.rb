class Computer
  attr_accessor :computer_choice

  def initialize
    @computer_choice = []
  end

  def generate_random
    rand(8)
  end

  def get_computerchoice
    4.times { @computer_choice.push(generate_random) }

    @computer_choice.each_with_index do |value, index|
      case value
      when 0
        @computer_choice[index] = 'R'
      when 1
        @computer_choice[index] = 'B'
      when 2
        @computer_choice[index] = 'G'
      when 3
        @computer_choice[index] = 'O'
      when 4
        @computer_choice[index] = 'Y'
      when 5
        @computer_choice[index] = 'P'
      when 6
        @computer_choice[index] = 'T'
      when 7
        @computer_choice[index] = 'W'
      else
        'Error'
      end
    end
  end
end
