class NotificationMailer < ApplicationMailer
  default from: "from@example.com"
  layout 'notification_mailer'

  def notify_answer(notification)
    @notification = notification
    @user = notification.question.user
    @url  = 'http://example.com/login'

    mail(to: @user.email, subject: 'Samuel respondeu a sua pergunta no Vestibuleiro')
  end
end
