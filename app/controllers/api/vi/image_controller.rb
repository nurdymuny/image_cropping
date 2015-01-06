require 'rubygems'
require 'rmagick'
module api
  module vi
    class ImageController < ApplicationController
      include Magick
      
      def crop
        @image = Image.create(image_params)
        image=Image.read(image_path).first
        face=image.crop!(270,55,194,194)            #img.crop(x, y, width, height)
        face.write("public/uploads/crop.jpg")
        send_data open("public/uploads/crop.jpg", "rb") { |f| f.read }
      end
      
    end
  end
end
