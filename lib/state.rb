require_relative 'compass'
require_relative 'coordinate'
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

  def move
    x = @coordinate.x
    y = @coordinate.y
    case @direction
      when 'N'
        y += 1
      when 'E'
        x += 1
      when 'S'
        y -= 1
      else
        x -= 1
    end
    new_coordinate = Coordinate.new(x, y)
    @coordinate = new_coordinate
  end
end