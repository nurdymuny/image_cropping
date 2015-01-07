class ImagesController < ApplicationController
  def index
    @images = Image.all
  end
  
  def new
    @image = Image.new
  end
  
  def create
    @image = Image.create(image_params)
    if @image.persisted?
      if params[:image][:avatar].present?
        redirect_to edit_image_path(@image)
      else
        redirect_to images_path, notice: 'Image was saved successfully'
      end
    else
      render :new
    end
  end
  
  def edit
    @image = Image.find_by_id(params[:id])
  end
  
  def update
    @image = Image.find_by_id(params[:id])
    if @image
      @image.update_attributes(image_params)
    end
    redirect_to images_path
  end
  
  def image_params
    params.require(:image).permit(:avatar, :avatar_crop_x, :avatar_crop_y, :avatar_crop_w, :avatar_crop_h)
  end
end
