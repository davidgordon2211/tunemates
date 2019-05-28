class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  include Pundit

  # after_action :verify_authorized, except: [ :index, :home ], unless: :skip_pundit?
  # after_action :verify_policy_scoped, only: [ :index, :home ] ,  unless: :skip_pundit?

  def after_sign_in_path_for(resource)
    stored_location_for(resource) || dashboard_path
  end
  private

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end

end
