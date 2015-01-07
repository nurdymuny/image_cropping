module Api
  module Vi
    class ImageController < ApplicationController
      protect_from_forgery :except => :crop2
      
      def crop
        image_url = params[:image_url]
        #image = Image.create(:remote_avatar_url => "https://lh3.googleusercontent.com/-sA9Y-Qjts3U/UuATD1RfMyI/AAAAAAADTv8/poL5F-7iR3s/s630-fcrop64=1,005d0000ffa1ffff/google%252B.jpg")
        image = Image.create(:remote_avatar_url => image_url)
        if image and image.update_attributes(image_params)
          image = image.reload
          #debugger
          #send_file image.avatar.file.path, :type => image.avatar.file.content_type, :disposition => :attachment
          render :html => "<img src='#{image.avatar.file.path}'>".html_safe
        else
          render :text => "failed"
        end
      end
      
      private
        def image_params
          params[:image] = params
          params.require(:image).permit(:avatar_crop_x, :avatar_crop_y, :avatar_crop_w, :avatar_crop_h)
        end
    end
  end
end
