require "minitest/autorun"
require_relative "../lib/errors"
require_relative "../lib/compass"
require_relative "../lib/plateau"
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
    assert_raises MarsMissionError::NotValidCoordinateError do
      Plateau.new(wrong_max_x, max_y)
    end

    assert_raises MarsMissionError::NotValidCoordinateError do
      Plateau.new(max_x, wrong_max_y)
    end
  end
end