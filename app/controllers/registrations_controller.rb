class RegistrationsController < Devise::RegistrationsController
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception

  protected

  def configure_permitted_parameters
    added_attrs = %i[ email password password_confirmation remember_me
                      name phone age ]

    devise_parameter_sanitizer.permit :sign_up, keys: %i[email password password_confirmation terms]
    devise_parameter_sanitizer.permit :sign_in, keys: %i[email password remember_me]
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end

  def after_sign_in_path_for(_resource)
    posts_path
  end
end
