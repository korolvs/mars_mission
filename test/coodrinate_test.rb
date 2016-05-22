require "minitest/autorun"
require_relative "../lib/errors"
require_relative "../lib/compass"
require_relative "../lib/state"
require_relative "../lib/coordinate"

class StateTest < MiniTest::Test
  def test_successful_creating_valid_coordinate
    # prepare
    x = y = rand(100)

    # action
    coordinate = Coordinate.new(x, y)

    # check results
    assert_equal x, coordinate.x
    assert_equal y, coordinate.y
  end

  def test_fail_with_invalid_params
    # prepare
    x = y = rand(100)
    wrong_x = wrong_y = -1

    # check results
    assert_raises MarsMissionError::InvalidCoordinateError do
      Coordinate.new(wrong_x, y)
    end

    assert_raises MarsMissionError::InvalidCoordinateError do
      Coordinate.new(x, wrong_y)
    end
  end
end