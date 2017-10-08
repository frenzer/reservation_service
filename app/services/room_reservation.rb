module RoomReservation
  module_function

  def reserve_room(room, user)
    return false if room.reserved? || user.admin?
    room.update(reserved: true, user: user)
    room.hotel.update_free_rooms_count
    true
  end

  def cancel_reservation(room)
    return false unless room.reserved?
    room.update(reserved: false, user: nil)
    room.hotel.update_free_rooms_count
    true
  end
end
