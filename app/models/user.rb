class User < ApplicationRecord
  # self.primary_key = "name"
  has_many :messages
  has_many :chats, through: :messages
  @time_until_deletion = 0

  def set_time_until_deletion
    @time_until_deletion = 60
    while @time_until_deletion > 0
      @time_until_deletion -= 1
      sleep 60
      if @time_until_deletion == 0
        self.destroy
      end
    end
  end
end
