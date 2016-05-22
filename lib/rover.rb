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
end