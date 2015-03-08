class Admin::ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :null_session
  before_action :authenticate_user!
  skip_before_filter :verify_authenticity_token
  layout 'admin_application'

  protected

  def check_permission
    unless current_user.role == 'Administrador'
      respond_to do |format|
        format.html { redirect_to root_url, notice: "Você não tem permissão de acesso a essa página" }
      end
    end
  end
end
