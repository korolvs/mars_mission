require_relative 'compass'
require_relative 'errors'

class State
  attr_reader :x, :y, :d

  def initialize(x, y, d)
    unless x.is_a?(Integer) && y.is_a?(Integer) && x >= 0 && y >= 0 && Compass::POINTS.include?(d)
      raise MarsMissionError::NotValidCoordinateError
    end
    @x, @y, @d = x, y, d
  end
end