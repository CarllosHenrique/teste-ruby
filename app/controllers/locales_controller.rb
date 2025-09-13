class LocalesController < ApplicationController
  def update
    session[:locale] = params[:lang]
    redirect_back fallback_location: root_path
  end
end
