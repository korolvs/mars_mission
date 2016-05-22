module MarsMissionError
  class Error < StandardError
  end

  class NotValidCoordinateError < Error
  end
end