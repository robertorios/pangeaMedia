# app/controllers/media_controller.rb
class MediaController < ApplicationController
    before_action :set_media, only: [:show, :update, :destroy]
  
    # GET /media
    def index
      type = params[:type]
      media = Media.where(user_id: current_user)
      media = media.where(media_type: type) if type.present?
      render json: media
    end
  
    # GET /media/:id
    def show
      if @media.user_id == current_user
        render json: @media
      else
        render json: { error: 'Forbidden' }, status: :forbidden
      end
    end
  
    # POST /media
    def create
      media = Media.new(media_params.merge(user_id: current_user))
  
      if media.save
        render json: media, status: :created
      else
        render json: media.errors, status: :unprocessable_entity
      end
    end
  
    # PUT/PATCH /media/:id
    def update
      if @media.user_id != current_user
        render json: { error: 'Forbidden' }, status: :forbidden
      elsif @media.update(media_params)
        render json: @media
      else
        render json: @media.errors, status: :unprocessable_entity
      end
    end
  
    # DELETE /media/:id
    def destroy
      if @media.user_id != current_user
        render json: { error: 'Forbidden' }, status: :forbidden
      else
        @media.destroy
        render json: { message: 'Deleted successfully' }
      end
    end
  
    private
  
    def set_media
      @media = Media.find(params[:id])
    end
  
    def media_params
      params.require(:media).permit(:title, :description, :media_type, :media_url, :visibility)
    end
  end
  