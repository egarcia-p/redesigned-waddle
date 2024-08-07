# frozen_string_literal: true

require "pathname"

module FileFixtures
  def file_fixture(fixture_name)
    path = Pathname.new(File.join("spec/fixtures/weather", fixture_name))
    path = Pathname.new(File.join("spec/fixtures/soccer", fixture_name)) unless path.exist?
    if path.exist?
      path
    else
      msg = "the directory '%s' does not contain a file named '%s'"
      raise ArgumentError, format(msg, "spec/fixtures", fixture_name)
    end
  end
end
