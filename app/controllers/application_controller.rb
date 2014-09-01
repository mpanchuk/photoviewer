class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception
  before_action :authenticate_user!
  skip_before_filter :verify_authenticity_token, if: Proc.new { |c| c.request.format == 'application/json' }

end
