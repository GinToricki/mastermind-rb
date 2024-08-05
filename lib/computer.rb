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
        @computer_choice[index] = 'red'
      when 1
        @computer_choice[index] = 'blue'
      when 2
        @computer_choice[index] = 'green'
      when 3
        @computer_choice[index] = 'orange'
      when 4
        @computer_choice[index] = 'yellow'
      when 5
        @computer_choice[index] = 'brown'
      when 6
        @computer_choice[index] = 'black'
      when 7
        @computer_choice[index] = 'white'
      else
        'Error'
      end
    end
  end
end

pc = Computer.new
pc.get_computerchoice
puts pc.computer_choice
