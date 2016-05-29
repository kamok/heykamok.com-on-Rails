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
end