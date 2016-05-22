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

    assert_raises MarsMissionError::InvalidDirectionError do
      State.new(@coordinate, wrong_direction)
    end
  end
end