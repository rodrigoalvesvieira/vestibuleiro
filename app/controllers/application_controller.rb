class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :configure_permitted_parameters, if: :devise_controller?

  def check_login
    if user_signed_in?

      last_day_seen = current_user.last_sign_in_at

      if last_day_seen != Date.today
        current_user.sign_in_count += 1
      end

      result_subtract_days = (Date.today - current_user.last_sign_in_at).to_i

      if result_subtract_days == 1
        current_user.sign_in_sequence_count += 1
      else
        current_user.sign_in_sequence_count = 0
      end
      current_user.last_sign_in_at = Date.today
      current_user.save
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :name
  end
end
