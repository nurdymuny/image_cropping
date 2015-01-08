module Api
  module Vi
    class ImageController < ApplicationController
      protect_from_forgery :except => :crop2
      
      def crop
        image = Image.create(:remote_avatar_url => params[:image_url])
        check_params
        if image and image.update_attributes(image_params)
          image = image.reload
          #send_file image.avatar.file.path, :type => image.avatar.file.content_type, :disposition => :attachment
          render :html => "<img src='#{root_url}#{image.avatar.url}'>".html_safe
        else
          
          render :text => "failed"
        end
      end
      
      private
        def check_params
          params[:avatar_crop_x] ||= 0
          params[:avatar_crop_y] ||= 0
          params[:avatar_crop_w] ||= 80
          params[:avatar_crop_h] ||= 80
          params[:image] = params
        end
        
        def image_params
          params.require(:image).permit(:avatar_crop_x, :avatar_crop_y, :avatar_crop_w, :avatar_crop_h)
        end
    end
  end
end
