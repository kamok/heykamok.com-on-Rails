require 'rails_helper'
require 'pry'

describe Weatherman do
  let(:weather) {Weatherman.new}

  describe "#prepare_weather" do
    it "takes an ip_address and calls prepare_weather with it" do
      client_ip = "71.125.43.37"
      expect(weather.prepare_weather(client_ip)).to be_an(Array)
    end
  end

  describe "#parse_and_store_weather_data" do
  end

  describe "#prepare_geocode" do
  end

  describe "#get_weather_data" do
  end

  describe "#get_current_temp" do
  end

  describe "#get_current_summary" do
  end

  describe "#get_day_today" do
  end

  describe "#get_min_temp_for_day(day)" do
  end

  describe "#get_max_temp_for_day(day)" do
  end

  describe "#get_day_for_day(day)" do
  end

  describe "#get_date_for_day(day)" do
  end

  describe "#get_icon_for_day(day)" do
  end

  describe "#translate_icon_verbage(forecast_icon)" do
  end

  describe "#get_summary_for_day(day)" do
  end
end