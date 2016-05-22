module MarsMissionError
  class Error < StandardError
  end

  class NotValidCoordinateError < Error
  end

  class RoverOutOfPlateauError < Error
  end
end