class TestPanelsController < ApplicationController
  rescue_from TestPanel::NotFoundError, with: :rescue_from_not_found

  def show
    render json: { data: ::TestPanelSerializer.new(test_panel).as_json }
  end

  private

  def rescue_from_not_found
    render_json_error(message: 'Test panel not found', status: :not_found)
  end

  def test_panel
    @test_panel ||= TestPanel.find_by_id(params[:id])
  end
end
