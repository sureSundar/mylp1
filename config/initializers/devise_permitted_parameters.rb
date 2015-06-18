module DevisePermittedParameters
  extend ActiveSupport::Concern

  included do
    before_action :configure_permitted_parameters
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :name 
    devise_parameter_sanitizer.for(:sign_up) << :client_id 
    devise_parameter_sanitizer.for(:sign_up) << :client_secret
    devise_parameter_sanitizer.for(:account_update) << :name 
    devise_parameter_sanitizer.for(:account_update) << :client_id 
    devise_parameter_sanitizer.for(:account_update) << :client_secret
  end

end

DeviseController.send :include, DevisePermittedParameters
