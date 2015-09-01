class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :authenticate_user!
  
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end
  layout 'admin'






  # Metodo para devise
  before_filter :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(
      :nombre1, :nombre2, :apellido1, :apellido2, :cedula, :avatar, 
      :telefono, :email, :password, :password_confirmation) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(
      :nombre1, :nombre2, :apellido1, :apellido2, :cedula, :profesion, 
      :tarjeta_profesional, :estado_civil, :direccion, :fecha_nacimiento,
      :celular, :telefono, :perfil, :email, :password, :password_confirmation,
      :current_password, :avatar, :genero, :programa_id) }
  end

end
