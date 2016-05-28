require 'rails_helper'

describe ApplicationController do

  describe "#cache_ip" do
    it "saves a cookie with the client's ip" do
      allow(Rails).to receive(:env).and_return(ActiveSupport::StringInquirer.new("production"))
      expect(subject.cache_ip).to be_truthy  
    end

    it "saves a cookie with a default ip address if not in production" do
      expect(subject.cache_ip).to eq("72.229.28.184")
    end
  end

end
