class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception

  rescue_from Pundit::NotAuthorizedError do |ex|
    flash[:error] = ex.message
    redirect_back(fallback_location: authenticated_root_path)
  end

  def render_404(error = "Routing Error", status = :not_found, exception = nil)
    render "static_pages/not_found"
  end
end
