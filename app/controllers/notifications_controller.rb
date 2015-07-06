class NotificationsController < ApplicationController
  def index
  end

  def clear_notification
    notification = Notification.find params[:id]
    notification.mark_as_seen

    redirect_to question_url(notification.question)
  end
end
