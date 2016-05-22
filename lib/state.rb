require_relative 'compass'
require_relative 'errors'

class State
  attr_reader :coordinate, :direction

  def initialize(coordinate, direction)
    raise MarsMissionError::InvalidDirectionError unless Compass::POINTS.include?(direction)
    @coordinate = coordinate
    @direction = direction
  end

  def turnRight
    @direction = Compass::POINTS[(Compass::POINTS.index(@direction) + 1) % 4]
  end

  def turnLeft
    @direction = Compass::POINTS[(Compass::POINTS.index(@direction) + 3) % 4]
  end
end