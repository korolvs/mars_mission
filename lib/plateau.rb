require_relative 'errors'
require_relative 'state'

class Plateau
  attr_reader :max_x, :max_y

  def initialize(max_x, max_y)
    unless max_x.is_a?(Integer) && max_y.is_a?(Integer) && max_x >= 0 && max_y >= 0
      raise MarsMissionError::InvalidCoordinateError
    end
    @max_x, @max_y = max_x, max_y
  end

  def isStateInPlateau(state)
    state.coordinate.x <= @max_x && state.coordinate.y <= @max_y
  end
end