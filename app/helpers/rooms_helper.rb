module RoomsHelper
  def reserve_link(room)
    if room.reserved?
      link_to t('rooms.cancel_reservation'), cancel_reservation_room_path(room)
    else
      link_to t('rooms.reserve'), reserve_room_path(room)
    end
  end
end
