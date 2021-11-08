class TestPanelsController < ApplicationController
  PERMITTED_PARAMS = %i[id included].freeze
  VALID_INCLUDED_VALUES = %w[test].freeze

  rescue_from TestPanel::NotFoundError, with: :rescue_from_not_found

  before_action :validate_included_params

  def show
    data = { data: ::TestPanelSerializer.new(test_panel).as_json }
    data[:included] = tests_data_json if included_params

    render json: data
  end

  private

  def included_params
    @included_params ||= permitted_params[:included]
  end

  def permitted_params
    @permitted_params ||= params.permit(*PERMITTED_PARAMS).to_h
  end

  def rescue_from_not_found
    render_json_error(message: 'Test panel not found', status: :not_found)
  end

  def test_panel
    @test_panel ||= TestPanel.find_by_id(permitted_params[:id])
  end

  def tests_data_json
    test_panel.tests_data.sort_by(&:id).map { |data| ::TestSerializer.new(data).as_json }
  end

  def validate_included_params
    return if included_params.blank? || VALID_INCLUDED_VALUES.include?(included_params)

    render_json_error(message: "#{included_params} is not valid for the included params", status: :unprocessable_entity)
  end
end
