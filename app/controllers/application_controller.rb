class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate if Rails.env.development?

  protected

  def authenticate
    #if !user_signed_in?
     # redirect_to new_user_session_path
    #end
    
    authenticate_or_request_with_http_basic do |client_id, client_secret|
          client_id == "62me9qmy5vy1je70onkq1qe8q4oxhu7y" && client_secret == "sRgV8ECR9ygoA67VSVQimt52sYn5deZ3"
    end
    warden.custom_failure! if performed?
  end
end
