require "minitest/autorun"
require_relative "../lib/errors"
require_relative "../lib/compass"
require_relative "../lib/plateau"
require_relative "../lib/coordinate"
require_relative "../lib/state"

class PlateauTest < MiniTest::Test
  def test_successful_creating_valid_plateau
    # prepare
    max_x = max_y = rand(100)

    # action
    plateau = Plateau.new(max_x, max_y)

    # check results
    assert_equal max_x, plateau.max_x
    assert_equal max_y, plateau.max_y
  end

  def test_fail_with_invalid_params
    # prepare
    max_x = max_y = rand(100)
    wrong_max_x = wrong_max_y = -1

    # check results
    assert_raises MarsMissionError::InvalidCoordinateError do
      Plateau.new(wrong_max_x, max_y)
    end

    assert_raises MarsMissionError::InvalidCoordinateError do
      Plateau.new(max_x, wrong_max_y)
    end
  end

  def test_is_state_in_plateau_method
    # prepare
    max_x = rand(100)
    max_y = rand(100)
    x = max_x > 1 ? rand(max_x) : 0
    y = max_y > 1 ? rand(max_y) : 0

    plateau = Plateau.new(max_x, max_y)

    # states in plateau
    state = State.new(Coordinate.new(x, y), Compass::POINTS[rand(3)])
    state0 = State.new(Coordinate.new(0, 0), Compass::POINTS[rand(3)])
    state_max = State.new(Coordinate.new(max_x, max_y), Compass::POINTS[rand(3)])

    # states not in plateau
    state_x_err = State.new(Coordinate.new(max_x + 1, max_y), Compass::POINTS[rand(3)])
    state_y_err = State.new(Coordinate.new(max_x, max_y + 1), Compass::POINTS[rand(3)])

    # check results
    assert plateau.isStateInPlateau(state)
    assert plateau.isStateInPlateau(state0)
    assert plateau.isStateInPlateau(state_max)
    assert !plateau.isStateInPlateau(state_x_err)
    assert !plateau.isStateInPlateau(state_y_err)
  end
end