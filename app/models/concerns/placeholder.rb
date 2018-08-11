module Placeholder
 extend ActiveSupport::Concern
  def self.image_generator(heigth, width)
    "http://via.placeholder.com/#{heigth}x#{width}"
  end
end