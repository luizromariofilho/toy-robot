class InvalidPlaceError < StandardError
  def message
    'Out of gameboard'
  end
end
