class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def render_404(error = "Routing Error", status = :not_found, exception = nil)
    render "static_pages/not_found"
  end
end
