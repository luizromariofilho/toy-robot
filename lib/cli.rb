# frozen_string_literal: true

require_relative './toy_robot'

class Cli
  def self.game
    toy_robot = ToyRobot.new
    loop do
      command = gets.chomp
      toy_robot.command(command)
      break if command =~ /exit/i
    end
  end

  game
end
