require_relative 'lib/compass'
require_relative 'lib/plateau'
require_relative 'lib/state'
require_relative 'lib/coordinate'
require_relative 'lib/rover'

max_x, max_y = gets.strip.split(' ').map {|i| i.to_i}

result = []
line = gets.strip
while line != ''
  x, y, direction = line.strip.split(' ')
  x, y = x.to_i, y.to_i

  plateau = Plateau.new(max_x, max_y)
  state = State.new(Coordinate.new(x, y), direction)
  rover = Rover.new(plateau, state)

  commands = gets.strip.split('')
  commands.each do |command|
    rover.command(command)
  end
  result.push(rover)
  line = gets.strip
end

result.each do |rover|
  puts "#{rover.state.coordinate.x} #{rover.state.coordinate.y} #{rover.state.direction}"
end