class HexGeneratorsController < ApplicationController
  def get_hex
    hex_code = HexGenerator.new_hex 
    render json: { "code": hex_code }
  end
end 