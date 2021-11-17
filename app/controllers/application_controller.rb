class ApplicationController < ActionController::Base
  rescue_from StandardError, with: :rescue_from_error

  def index; end

  private

  def render_json_error(detail:, status: 500, title: nil, source: nil)
    error = { status: status, source: source,  title: title, detail: detail }.compact
    render json: { errors: [error] }, status: status
  end

  def rescue_from_error(error)
    render_json_error(detail: error.message)
  end
end
