# frozen_string_literal: true

# Find Module for searching items in collections
class Find
  # Find smallest spread given an array of Day objects
  def self.find_smallest_spread(day_temperatures)
    return 0 if day_temperatures.empty?

    min_spread = 1000 # Assumes there is no larger spread than 1000
    result = 0
    # Check each object and update min_spread
    day_temperatures.each do |day|
      if (day.max - day.min) < min_spread
        min_spread = day.max - day.min
        result = day.day
      end
    end

    result
  end
end
