class RoomDecorator < Draper::Decorator
  delegate_all

  def name
    "#{I18n.t('rooms.room')} №#{room_number}"
  end

  def reservation_status
    reserved? ? I18n.t('rooms.reserved') : I18n.t('rooms.free')
  end
end
