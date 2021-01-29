# Class to whitelist devise parameters
module SetSource
  extend ActiveSupport::Concern

  included do
    before_action :set_source
  end

  def set_source
    session[:source] = params[:q] if params[:q]
  end
end
