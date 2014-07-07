class GalleriesController < ApplicationController
  before_action :require_login
  def index
    @user = current_user
  end

  def new
    @gallery = Gallery.new
  end

  def create
    params_with_user_id = gallery_params.merge(user_id: current_user.id)
    @gallery = Gallery.create(params_with_user_id)
    redirect_to current_user
  end

  def show
    @gallery =Gallery.find(params[:id])
  end

  def edit
    @gallery = Gallery.find(params[:id])
  end

  def update
    gallery = Gallery.find(params[:id])
    gallery.update(gallery_params)
    redirect_to "/galleries/#{gallery.id}"
  end

  def destroy
    @gallery = Gallery.find(params[:id])
    @gallery.destroy
    redirect_to "/galleries"
  end



  private

  def gallery_params
    params.
      require(:gallery).
      permit(:name, :description)
  end
end
