class User < ApplicationRecord
  has_many :messages
  has_many :chats, through: :messages
  @time_until_deletion = 0

  def set_time_until_deletion
    @time_until_deletion = 30
    while @time_until_deletion > 0
      @time_until_deletion -= 1
      sleep 1
      if @time_until_deletion == 0
        self.destroy
      end
    end
  end
end
