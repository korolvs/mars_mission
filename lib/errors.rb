module MarsMissionError
  class Error < StandardError
  end

  class InvalidCoordinateError < Error
  end

  class InvalidDirectionError < Error
  end

  class RoverOutOfPlateauError < Error
  end

  class WrongCommandError < Error
  end
end