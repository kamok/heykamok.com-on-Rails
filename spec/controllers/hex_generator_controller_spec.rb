require 'rails_helper'

describe HexGeneratorsController do

  describe "GET get_hex" do
    it "renders a hexcode via JSON" do
      get :get_hex, format: :json
      expect(response.status).to eq 200
      expected = response_body["code"]

      expect(expected.length).to eq(7)
      expect(expected[0]).to eq("#")
    end
  end

  def response_body
    JSON.parse(response.body)
  end
end