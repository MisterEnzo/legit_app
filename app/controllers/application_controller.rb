class ApplicationController < ActionController::Base
  include DeviseWhitelist
  include Pundit
  protect_from_forgery
end
