require "minitest/autorun"
require_relative "../lib/errors"
require_relative "../lib/compass"
require_relative "../lib/coordinate"
require_relative "../lib/state"

class StateTest < MiniTest::Test
  def setup
    x = y = rand(100)
    @coordinate = Coordinate.new(x, y)
  end

  def test_successful_creating_valid_state
    # prepare
    direction = Compass::POINTS[rand(3)]

    # action
    state = State.new(@coordinate, direction)

    # check results
    assert_equal @coordinate, state.coordinate
    assert_equal direction, state.direction
  end

  def test_fail_with_invalid_params
    # prepare
    wrong_direction = 'A'

    # check results
    assert_raises MarsMissionError::InvalidDirectionError do
      State.new(@coordinate, wrong_direction)
    end
  end

  def test_successful_turn_right
    #prepare
    direction_index = rand(3)
    @state1 = State.new(@coordinate, Compass::POINTS[direction_index])
    @state2 = State.new(@coordinate, 'W')

    #action
    @state1.turnRight
    @state2.turnRight

    # check results
    assert_equal Compass::POINTS[(direction_index + 1) % 4], @state1.direction
    assert_equal 'N', @state2.direction
  end

  def test_successful_turn_left
    #prepare
    direction_index = rand(3)
    @state1 = State.new(@coordinate, Compass::POINTS[direction_index])
    @state2 = State.new(@coordinate, 'N')

    #action
    @state1.turnLeft
    @state2.turnLeft

    # check results
    assert_equal Compass::POINTS[(direction_index + 3) % 4], @state1.direction
    assert_equal 'W', @state2.direction
  end
end