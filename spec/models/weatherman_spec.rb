require 'rails_helper'
require 'pry'

describe Weatherman do
  let(:weather) {Weatherman.new}

  describe "#prepare_weather" do
    before(:each) do
      @client_ip = "71.125.43.37"
    end
    it "takes an ip_address and calls prepare_weather with it" do
      expect(weather.prepare_weather(@client_ip)).to be_an(Array)
    end
  end

  describe "#prepare_geo_data" do
    before(:each) do
      @client_ip = "71.125.43.37"
    end
    it "creates lat and long given an ip " do
      expect(weather.lat).to be(nil)
      expect(weather.lng).to be(nil)

      weather.prepare_geo_data(@client_ip)

      expect(weather.lat).to eq(40.7139)
      expect(weather.lng).to eq(-74.0079)
    end

    it "creates city_and_country given an ip" do
      expect(weather.city_and_country).to be(nil)

      weather.prepare_geo_data(@client_ip)

      expect(weather.city_and_country).to eq("New York, United States")
    end
  end

  describe "#get_weather_data" do
    before(:each) do
      weather.prepare_geo_data("71.125.43.37")
      weather.get_weather_data
    end
    it "creates a forecast hash using lat and lng" do
      expect(weather.forecast).to be_a(Hashie::Mash)
    end

    it "forecast hash has a currently key" do
      expect(weather.forecast).to have_key(:currently)
    end

    it "forecast hash has a daily key" do
      expect(weather.forecast).to have_key(:daily)
    end
  end

  # describe "#parse_and_store_weather_data" do
  #   it "returns the correct number of objects" do
  #   end
  # end

  # describe "#get_current_temp" do
  # end

  # describe "#get_current_summary" do
  # end

  # describe "#get_day_today" do
  # end

  # describe "#get_min_temp_for_day(day)" do
  # end

  # describe "#get_max_temp_for_day(day)" do
  # end

  # describe "#get_day_for_day(day)" do
  # end

  # describe "#get_date_for_day(day)" do
  # end

  # describe "#get_icon_for_day(day)" do
  # end

  # describe "#translate_icon_verbage(forecast_icon)" do
  # end

  # describe "#get_summary_for_day(day)" do
  # end
end