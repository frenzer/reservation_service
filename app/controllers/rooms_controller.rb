class RoomsController < ApplicationController
  before_action :set_room, only: [:show, :reserve, :cancel_reservation]

  def show
    @room = @room.decorate
    @comments = @room.comments
  end

  def reserve
    if RoomReservation.reserve_room(@room, current_user)
      redirect_to @room
    else
      redirect_back
    end
  end

  def cancel_reservation
    if RoomReservation.cancel_reservation(@room)
      redirect_to @room.hotel
    else
      redirect_back
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
