class InvalidCommandError < StandardError
  def message
    'Command invalid.'
  end
end
