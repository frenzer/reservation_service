class RoomsController < ApplicationController
  load_and_authorize_resource
  before_action :set_room, only: [:show, :reserve, :cancel_reservation]

  def show
    @room     = @room.decorate
    @comments = @room.comments.includes(:user).order_created_desc
  end

  def reserve
    authorize! :reserve, @room

    if RoomReservation.reserve_room(@room, current_user)
      redirect_to @room
    else
      redirect_to @room, alert: 'An error occurred during reservation'
    end
  end

  def cancel_reservation
    authorize! :cancel_reservation, @room

    if RoomReservation.cancel_reservation(@room)
      redirect_to @room.hotel
    else
      redirect_to @room, alert: 'An error occurred during canceling reservation'
    end
  end

  private
  def set_room
    @room = Room.find(params[:id])
  end
end
