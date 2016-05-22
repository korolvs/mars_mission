require_relative 'errors'
require_relative 'coordinate'

class Plateau
  attr_reader :max_x, :max_y

  def initialize(max_x, max_y)
    unless max_x.is_a?(Integer) && max_y.is_a?(Integer) && max_x >= 0 && max_y >= 0
      raise MarsMissionError::NotValidCoordinateError
    end
    @max_x, @max_y = max_x, max_y
  end
end