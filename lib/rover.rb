require_relative 'compass'
require_relative 'state'
require_relative 'plateau'
require_relative 'errors'

class Rover
  attr_reader :plateau, :state

  def initialize(plateau, state)
    raise MarsMissionError::RoverOutOfPlateauError unless plateau.isStateInPlateau(state)
    @plateau, @state = plateau, state
  end

  def command(letter)
    raise MarsMissionError::WrongCommandError unless %w(L R M).include? letter
    case letter
      when 'L'
        @state.turnLeft
      when 'R'
        @state.turnRight
      else
        @state.move && (raise MarsMissionError::RoverOutOfPlateauError unless @plateau.isStateInPlateau(@state))
    end
  end
end