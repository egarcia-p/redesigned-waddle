# frozen_string_literal: true

require "team"
require "spec_helper"

RSpec.describe Team do
  context "with dat file complete" do
    let(:teams) { file_fixture("soccer.dat") }
    it "parses 20 teams" do
      parser = TeamParser.new(teams, " ")
      parsed_array = parser.parse

      expect(parsed_array.size).to eq 20
    end
  end
  context "with dat file empty" do
    let(:empty) { file_fixture("empty.dat") }
    it "parses 0 teams" do
      parser = TeamParser.new(empty, " ")
      parsed_array = parser.parse

      expect(parsed_array.size).to eq 0
    end
  end

  context "with dat file not existing" do
    let(:not_exists) { file_fixture("not_exists.dat") }

    it "raises the corresponding error message" do
      expect do
        TeamParser.new(not_exists, " ")
      end.to raise_error(ArgumentError)
    end
  end
end
