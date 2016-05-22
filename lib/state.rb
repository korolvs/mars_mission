require_relative 'compass'
require_relative 'errors'

class State
  attr_reader :coordinate, :direction

  def initialize(coordinate, direction)
    raise MarsMissionError::InvalidDirectionError unless Compass::POINTS.include?(direction)
    @coordinate = coordinate
    @direction = direction
  end
end