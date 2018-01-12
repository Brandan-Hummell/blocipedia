class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception
  respond_to :html, :json
end
