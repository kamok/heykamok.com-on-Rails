require 'rails_helper'
require 'pry'
require 'helpers/custom_matchers'

describe Weatherman do
  let(:weather) {Weatherman.new}

  describe "#prepare_weather" do
    it "takes an ip_address and returns an array " do
      expect(weather.prepare_weather("71.125.43.37")).to be_an(Array)
    end
  end

  describe "#prepare_geo_data" do
    before(:each) do
      @client_ip = "71.125.43.37"
    end
    it "creates lat and long given an ip " do
      expect(weather.lat).to be(nil)
      expect(weather.lng).to be(nil)

      lat_lng = double(lat: 40.7139, lng: -74.0079)
      expect(weather).to receive(:prepare_geo_data).with(@client_ip).and_return(lat_lng)
      
      weather.prepare_geo_data(@client_ip)

    end

    it "creates city_and_country given an ip" do
      expect(weather.city_and_country).to be(nil)

      weather.prepare_geo_data(@client_ip)

      expect(weather.city_and_country).to eq("New York, United States")
    end
  end

  describe "#get_weather_data" do
    before(:all) do
      @weathers = Weatherman.new
      @weathers.prepare_geo_data("71.125.43.37")
      @weathers.get_weather_data
    end
    it "creates a forecast hash using lat and lng" do
      expect(@weathers.forecast).to be_a(Hashie::Mash)
    end

    it "forecast hash has a currently key" do
      expect(@weathers.forecast).to have_key(:currently)
    end

    it "forecast hash has a daily key" do
      expect(@weathers.forecast).to have_key(:daily)
    end
  end

  describe "#parse_and_store_weather_data" do
    before(:each) do
      weather.prepare_geo_data("71.125.43.37")
      weather.get_weather_data
    end
    it "returns the correct number of objects" do
      total_variables = Weatherman::NON_REPEATING_WEATHER_PARAMETERS.count +
                        Weatherman::REPEATING_WEATHER_PARAMETERS.count
      expect(weather.parse_and_store_weather_data.count).to eq(total_variables)
    end
  end

  describe "weather data fetch methods" do
    before(:context) do
      @weathers = Weatherman.new
      @weathers.prepare_geo_data("71.125.43.37")
      @weathers.get_weather_data
    end

    describe "#get_current_temp" do
      it "returns a reasonable temperature range in NYC" do
        expect(@weathers.get_current_temp).to be_between(-5, 103) #historic lows and high
      end
    end

    describe "#get_current_summary" do
      it "returns a string no longer than 4 words" do
        expect(@weathers.get_current_summary).to be_a(String)
        expect(@weathers.get_current_summary).to have_max_word_of(4)
        expect(@weathers.get_current_summary).to have_min_word_of(1)
      end
    end

  end

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