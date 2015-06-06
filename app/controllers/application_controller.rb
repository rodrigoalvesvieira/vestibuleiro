class ApplicationController < ActionController::Base
  before_filter :check_login
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private
  def check_login
    if user_signed_in?

      current_user.sign_in_count += 1

      if (Date.today - current_user.last_sign_in_at) == 1
        current_user.sign_in_sequence_count += 1
      else
        current_user.sign_in_sequence_count = 0
      end

      current_user.save
    end
  end
end
