# frozen_string_literal: true

require_relative './errors/invalid_place_error'
require_relative './errors/invalid_direction_error'

class ToyRobot
  attr_accessor :gameboard, :coordinate_x, :coordinate_y, :face

  EMPTY_VALUE = 0
  LIMITS = (0..4).freeze
  FACES = %w[NORTH SOUTH WEST EAST].freeze
  COMMANDS = %w[move place report].freeze

  def command(command)
    moviment = command.downcase.split.first
    coordinate_x, coordinate_y, face = command.split.last.split(',')
    if moviment == 'place'
      public_send(moviment, coordinate_x, coordinate_y, face)
    else
      public_send(moviment)
    end
  end

  def move
    public_send(face.downcase)
  end

  def place(coordinate_x, coordinate_y, face)
    @coordinate_x = coordinate_x.to_i
    @coordinate_y = coordinate_y.to_i
    @face = face

    raise InvalidPlaceError unless LIMITS.cover?(@coordinate_x) &&
                                   LIMITS.cover?(@coordinate_y)
    raise InvalidDirectionError unless FACES.include?(@face)
  end

  def report
    p "#{coordinate_x}, #{coordinate_y}, #{face}"
  end

  def north
    @coordinate_y -= 1
  end

  def south
    @coordinate_y += 1
  end

  def west
    @coordinate_x -= 1
  end

  def east
    @coordinate_x += 1
  end

  def left
    @face = case @face
            when 'NORTH'
              'WEST'
            when 'SOUTH'
              'EAST'
            when 'WEST'
              'SOUTH'
            when 'EAST'
              'NORTH'
            end
  end

  def right
    @face = case @face
            when 'NORTH'
              'EAST'
            when 'SOUTH'
              'WEST'
            when 'WEST'
              'NORTH'
            when 'EAST'
              'SOUTH'
            end
  end
end
