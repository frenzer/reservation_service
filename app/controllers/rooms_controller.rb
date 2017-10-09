class RoomsController < ApplicationController
  before_action :check_access!, only: [:cancel_reservation]
  before_action :set_room, only: [:show, :reserve, :cancel_reservation]
  before_action :check_access!, only: :cancel_reservation

  def show
    @room     = @room.decorate
    @comments = @room.comments.includes(:user).order_created_desc
  end

  def reserve
    return redirect_back(fallback_location: room_path(@room)) if is_admin?

    if RoomReservation.reserve_room(@room, current_user)
      redirect_to @room
    else
      redirect_back fallback_location: room_path(@room)
    end
  end

  def cancel_reservation
    if RoomReservation.cancel_reservation(@room)
      redirect_to @room.hotel
    else
      redirect_back fallback_location: room_path(@room)
    end
  end

  private
  def set_room
    @room = Room.find(params[:id])
  end
end
