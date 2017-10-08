class RoomsController < ApplicationController
  before_action :set_room, only: [:show, :reserve, :cancel_reservation]

  def show
  end

  def reserve
    if RoomReservation.reserve_room(@room)
      redirect_to @room.hotel
    end
  end

  def cancel_reservation
    if RoomReservation.cancel_reservation(@room)
      redirect_to @room.hotel
    end
  end

  private
    def set_room
      @room = Room.find(params[:id])
    end

    def room_params
      params.require(:room).permit(:hotel_id, :room_number, :reserved)
    end
end
