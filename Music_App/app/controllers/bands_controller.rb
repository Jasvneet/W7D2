class BandsController < ApplicationController
    before_action :set_band, only: [:show, :edit, :update, :destroy]

    def index 
        @bands = Band.all 
        render :index 
    end 

    def show 
        @band = Band.find_by(id: params[:id])

        render :show

    end 

    def create
        @band = User.new(band_params)
        if @band.save
            redirect_to band_url(@band.id)
        else 
            flash[:errors] = @goal.errors.full_messages
            redirect_to band_url(@band.id)
        end 

    end 

    def new 
        @band = Band.new
        render :new 
    end 

    def edit 
        @band = Band.find_by(id: params[:id])
        render :edit 
    end 

    def update
        @band = Band.find(params[:id])
        if @band.update(band_params)
            redirect_to band_url(@band)
        else 
            flash[:errors] = @band.errors.full_messages
            redirect_to bands_url
        end 
    end 

    def destroy 
        @band = Band.find(params[:id])
        @band.destroy 
        redirect_to bands_url
    end 

    private 

    def band_params
        params.require(:band).permit(:name)
    end 

    def set_band
        @band = Band.find_by(id: params[:id])
    end 

end
