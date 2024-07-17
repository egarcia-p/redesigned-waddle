# frozen_string_literal: true

# Day class for parsing objects and mapping to temperatures
class Day
  attr_reader :day, :min, :max

  def initialize(day, max, min)
    @day = Integer(day)
    @min = Integer(min)
    @max = Integer(max)
  end
end

# Abstract Class for Parsing
class Parser
  def parse
    raise "Not Implemented"
  end
end

# Class that is in charge for parsing dat files
class DayParser < Parser
  attr_reader :input_file, :separator

  def initialize(input_file, separator)
    super()
    @input_file = input_file
    @separator = separator
  end

  def parse
    days = []
    input = File.open(@input_file, File::RDONLY, &:read)
    input.lines.each do |line|
      # Split each line if line does not have needed items do not parse
      row_arr = line.split(@separator)
      # if line contains more than 4 items and day is not a not numer string then parse
      begin
        Integer(row_arr[0])

        days.push(day_parsed(row_arr)) if row_arr.size > 4
      rescue StandardError
        # Skip line
      end
    end

    days
  end

  def day_parsed(row_arr)
    max = (row_arr[1].include?("*") ? row_arr[1].chop : row_arr[1])
    min = (row_arr[2].include?("*") ? row_arr[2].chop : row_arr[2])
    Day.new(row_arr[0], max, min)
  end
end
