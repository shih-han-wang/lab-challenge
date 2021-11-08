class TestPanelsController < ApplicationController

  def show
    render json: test_panel
  end

  private

  def test_panel
    @test_panel ||= TestPanel.find_by_id(params[:id])
  end
end