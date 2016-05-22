require "minitest/autorun"
require_relative "../lib/errors"
require_relative "../lib/compass"
require_relative "../lib/plateau"
require_relative "../lib/state"
require_relative "../lib/rover"

class RoverTest < MiniTest::Test
  def setup
    max_x = rand(100)
    max_y = rand(100)
    x = rand(max_x)
    y = rand(max_y)
    @plateau = Plateau.new(max_x, max_y)
    @state = State.new(x, y, Compass::POINTS[rand(3)])
  end

  def test_successful_creating_valid_rover
    # action
    rover = Rover.new(@plateau, @state)

    # check results
    assert_equal @plateau, rover.plateau
    assert_equal @state, rover.state
  end

  def test_fail_create_with_state_not_in_plateau
    # prepare
    wrong_state = State.new(101, 101, 'N')

    # check results
    assert_raises MarsMissionError::RoverOutOfPlateauError do
      Rover.new(@plateau, wrong_state)
    end
  end
end