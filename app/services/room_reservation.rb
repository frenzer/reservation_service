module RoomReservation
  module_function

  def reserve_room(room)
    return false if room.reserved?
    room.update(reserved: true)
    room.hotel.update_free_rooms_count
    true
  end

  def cancel_reservation(room)
    return false unless room.reserved?
    room.update(reserved: false)
    room.hotel.update_free_rooms_count
    true
  end
end
