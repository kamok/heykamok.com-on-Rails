require 'rails_helper'

describe ApplicationController do
  describe "#cache_ip" do
    it "saves a cookie called client_ip with an ip address" do
      expect(subject.cache_ip).to eq("72.229.28.185")
    end
  end
end
