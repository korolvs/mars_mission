require "minitest/autorun"
require_relative "../lib/errors"
require_relative "../lib/compass"
require_relative "../lib/state"

class StateTest < MiniTest::Test
  def test_successful_creating_valid_state
    # prepare
    x = y = rand(100)
    d = Compass::POINTS[rand(3)]

    # action
    state = State.new(x, y, d)

    # check results
    assert_equal x, state.x
    assert_equal y, state.y
    assert_equal d, state.d
  end

  def test_fail_with_invalid_params
    # prepare
    x = y = rand(100)
    wrong_x = wrong_y = -1
    d = Compass::POINTS[rand(3)]
    wrong_d = 'A'

    # check results
    assert_raises MarsMissionError::NotValidCoordinateError do
      State.new(wrong_x, y, d)
    end

    assert_raises MarsMissionError::NotValidCoordinateError do
      State.new(x, wrong_y, d)
    end

    assert_raises MarsMissionError::NotValidCoordinateError do
      State.new(x, y, wrong_d)
    end
  end
end