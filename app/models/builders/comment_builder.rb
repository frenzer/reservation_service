module Builders
  class CommentBuilder
    attr_reader :comment

    def initialize(comment)
      @comment = comment
    end

    def valid?
      @comment.validate
      check_room_reserved_by_user
      @comment.errors.size.zero?
    end

    def add_body(val)
      @comment.body = val
    end

    def add_room(val)
      @comment.room = val
    end

    def add_user(val)
      @comment.user = val
    end

    def save
      return false unless valid?
      @comment.save
    end

    private

    def check_room_reserved_by_user
      return true if @comment.room.reserved_by?(@comment.user)
      return true if @comment.user.admin?
      @comment.errors.add(:user, 'Room should be reserved by user')
      false
    end
  end
end
