class HotelsController < ApplicationController
  before_action :set_hotel, only: [:show, :destroy]

  def index
    @hotels = Hotel.all
  end

  def show
    @rooms = @hotel.rooms.decorate
  end

  def new
    @hotel = Hotel.new
  end

  def create
    @hotel = Hotel.new(hotel_params)

    respond_to do |format|
      if HotelBuilder.new(@hotel).save
        format.html { redirect_to @hotel, notice: 'Hotel was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def destroy
    @hotel.destroy
    respond_to do |format|
      format.html { redirect_to hotels_url, notice: 'Hotel was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_hotel
      @hotel = Hotel.find(params[:id])
    end

    def hotel_params
      params.require(:hotel).permit(:name, :room_count)
    end
end
