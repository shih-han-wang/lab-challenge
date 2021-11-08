class ApplicationController < ActionController::Base
  rescue_from StandardError, with: :rescue_from_error

  def index; end

  private

  def render_json_error(message:, code: nil, status: :internal_server_error)
    render json: { code: code, error: message }.compact, status: status
  end

  def rescue_from_error(error)
    render_json_error(message: error.message)
  end
end
