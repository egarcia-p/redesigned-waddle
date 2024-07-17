# frozen_string_literal: true

require "day"
require "spec_helper"

RSpec.describe Day do
  context "with dat file complete" do
    let(:thirty) { file_fixture("w_data.dat") }
    it "parses 30 days" do
      parser = DayParser.new(thirty, " ")
      parsed_array = parser.parse

      expect(parsed_array.size).to eq 30
    end
  end
  context "with dat file empty" do
    let(:empty) { file_fixture("empty.dat") }
    it "parses 0 days" do
      parser = DayParser.new(empty, " ")
      parsed_array = parser.parse

      expect(parsed_array.size).to eq 0
    end
  end

  context "with dat file not existing" do
    let(:not_exists) { file_fixture("not_exists.dat") }

    it "raises the corresponding error message" do
      expect do
        DayParser.new(not_exists, " ")
      end.to raise_error(ArgumentError)
    end
  end
end
