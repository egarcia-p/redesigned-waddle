# frozen_string_literal: true

require "thor"
require_relative "day"
require_relative "team"
require_relative "find"

PARSERS = {
  "dat" => DayParser,
  "team" => TeamParser
}.freeze

# Main class for CMD application
class Main < Thor
  package_name "Main"
  map "-L" => :list

  desc "find_smallest_spread INPUT_FILE SEPARATOR(Optional)",
       "execute and calculate smallest spread."
  def find_smallest_spread(input_file, separator = " ")
    parser = PARSERS["dat"].new(input_file, separator)
    objects = parser.parse

    # Calculate smallest spread
    smallest_spread = Find.find_smallest_spread(objects)

    # Print output to stdout
    puts "Day: #{smallest_spread}"
  end

  desc "find_team_smallest_difference INPUT_FILE SEPARATOR(Optional)",
       "execute and calculate smallest spread."
  def find_team_smallest_difference(input_file, separator = " ")
    parser = PARSERS["team"].new(input_file, separator)
    objects = parser.parse

    # Calculate smallest diff
    smallest_diff = Find.find_team_smallest_difference(objects)

    # Print output to stdout
    puts "Team: #{smallest_diff}"
  end
end

Main.start(ARGV)
