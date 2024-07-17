# frozen_string_literal: true

require "find"
require "spec_helper"

RSpec.describe Find do
  describe ".find_smallest_spread" do
    context "with 30 temperatures" do
      let(:thirty) { file_fixture("w_data.dat") }
      let(:parser) { DayParser.new(thirty, " ") }

      it "returns day of month 14" do
        parsed_array = parser.parse

        expect(Find.find_smallest_spread(parsed_array)).to eq 14
      end
    end

    context "when 2 temperatures has the same spread" do
      let(:same) { file_fixture("w_data_2_same.dat") }
      let(:parser) { DayParser.new(same, " ") }

      it "returns 1st ocurrence" do
        parsed_array = parser.parse

        expect(Find.find_smallest_spread(parsed_array)).to eq 13
      end
    end

    context "when temperatures is empty" do
      let(:empty) { file_fixture("empty.dat") }
      let(:parser) { DayParser.new(empty, " ") }

      it "returns 0" do
        parsed_array = parser.parse

        expect(Find.find_smallest_spread(parsed_array)).to eq 0
      end
    end
  end

  describe ".find_team_smallest_difference" do
    context "with 20 teams" do
      let(:teams) { file_fixture("soccer.dat") }
      let(:parser) { TeamParser.new(teams, " ") }

      it "returns Aston_Villa" do
        parsed_array = parser.parse

        expect(Find.find_team_smallest_difference(parsed_array)).to eq "Aston_Villa"
      end
    end

    context "when 2 teams have same difference" do
      let(:teams) { file_fixture("soccer_same.dat") }
      let(:parser) { TeamParser.new(teams, " ") }

      it "returns West_Ham" do
        parsed_array = parser.parse

        expect(Find.find_team_smallest_difference(parsed_array)).to eq "West_Ham"
      end
    end

    context "when teams is empty" do
      let(:teams) { file_fixture("empty.dat") }
      let(:parser) { TeamParser.new(teams, " ") }

      it "returns empty" do
        parsed_array = parser.parse

        expect(Find.find_team_smallest_difference(parsed_array)).to eq ""
      end
    end
  end
end
