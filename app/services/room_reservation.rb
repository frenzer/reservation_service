module RoomReservation
  module_function

  def reserve_room(room, user)
    return_value = false
    return return_value if room.reserved?
    ApplicationRecord.transaction do
      raise ActiveRecord::Rollback unless room.update(reserved: true, user: user)
      raise ActiveRecord::Rollback unless room.hotel.update_free_rooms_count
      return_value = true
    end
    return_value
  end

  def cancel_reservation(room)
    return_value = false
    return return_value unless room.reserved?
    ApplicationRecord.transaction do
      raise ActiveRecord::Rollback unless room.update(reserved: false, user: nil)
      raise ActiveRecord::Rollback unless room.hotel.update_free_rooms_count
      return_value = true
    end
    return_value
  end
end
