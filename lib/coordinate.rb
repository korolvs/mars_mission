require_relative 'errors'

class Coordinate
  attr_reader :x, :y

  def initialize(x, y)
    unless x.is_a?(Integer) && y.is_a?(Integer) && x >= 0 && y >= 0
      raise MarsMissionError::InvalidCoordinateError
    end
    @x, @y = x, y
  end
end