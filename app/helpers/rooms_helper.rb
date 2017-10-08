module RoomsHelper
  def reservation_link(room)
    if !room.reserved? && !current_user.admin?
      link_to t('rooms.reserve'), reserve_room_path(room)
    elsif room.reserved? && room.user == current_user
      t('rooms.reserved_by_you')
    end
  end
end
