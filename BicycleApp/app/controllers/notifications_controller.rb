class NotificationsController < ApplicationController
  def index
    # 通知を取得
    @notifications = current_user.notifications
    # 一度indexページを開いたら、notificationをfalseに
    current_user.update_attribute(:notification, false)
  end
end
