require "minitest/autorun"
require_relative "../lib/errors"
require_relative "../lib/compass"
require_relative "../lib/coordinate"

class CoordinateTest < MiniTest::Test
  def test_successful_creating_valid_coordinate
    # prepare
    x = y = rand(100)
    d = Compass::POINTS[rand(3)]

    # action
    coordinate = Coordinate.new(x, y, d)

    # check results
    assert_equal x, coordinate.x
    assert_equal y, coordinate.y
    assert_equal d, coordinate.d
  end

  def test_fail_with_invalid_params
    # prepare
    x = y = rand(100)
    wrong_x = wrong_y = -1
    d = Compass::POINTS[rand(3)]
    wrong_d = 'A'

    # check results
    assert_raises MarsMissionError::NotValidCoordinateError do
      Coordinate.new(wrong_x, y, d)
    end

    assert_raises MarsMissionError::NotValidCoordinateError do
      Coordinate.new(x, wrong_y, d)
    end

    assert_raises MarsMissionError::NotValidCoordinateError do
      Coordinate.new(x, y, wrong_d)
    end
  end
end