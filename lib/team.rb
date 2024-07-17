# frozen_string_literal: true

# Team class for parsing objects and mapping to teams
class Team
  attr_reader :name, :favor, :against

  def initialize(name, favor, against)
    @name = name
    @favor = Integer(favor)
    @against = Integer(against)
  end
end

# Abstract Class for Parsing
class Parser
  def parse
    raise "Not Implemented"
  end
end

# Class that is in charge for parsing dat files
class TeamParser < Parser
  attr_reader :input_file, :separator

  def initialize(input_file, separator)
    super()
    @input_file = input_file
    @separator = separator
  end

  def parse
    teams = []
    input = File.open(@input_file, File::RDONLY, &:read)
    input.lines.each do |line|
      # Split each line if line does not have needed items do not parse
      row_arr = line.split(@separator)
      # if line contains 10 items
      teams.push(team_parsed(row_arr)) if row_arr.size == 10
    end

    teams
  end

  def team_parsed(row_arr)
    favor = row_arr[6]
    against = row_arr[8]
    Team.new(row_arr[1], favor, against)
  end
end
