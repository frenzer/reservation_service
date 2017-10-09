module RoomsHelper
  def reservation_link(room)
    if !room.reserved? && !is_admin?
      link_to t('rooms.reserve'), reserve_room_path(room)
    elsif room.reserved? && room.reserved_by?(current_user)
      t('rooms.reserved_by_you')
    end
  end
end
