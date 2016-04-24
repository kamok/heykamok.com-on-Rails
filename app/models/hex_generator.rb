class HexGenerator < ActiveRecord::Base

  def self.new_hex

    "#".tap { |hex| 6.times { hex << %w(a b c d e f 1 2 3 4 5 6 7 8 9).sample } } 
    
  end
end 

