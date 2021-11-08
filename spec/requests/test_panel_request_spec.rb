require 'rails_helper'

describe 'Requesting a test panel', type: :request do
  let(:body) { JSON.parse(response.body) }
  let(:params) { nil }

  before do
    get "/test_panels/#{test_panel_id}", params: params
  end

  context 'with a valid test panel ID' do
    let(:test_panel_id) { 'TP1' }

    it 'should respond with an HTTP 200 status' do
      expect(response.status).to eq(200)
    end

    it 'should return correct id' do
      expect(body['data']['id']).to eq(test_panel_id)
    end

    context 'with a valid included params' do
      let(:params) { { included: 'test' } }

      it 'should respond with an HTTP 200 status' do
        expect(response.status).to eq(200)
      end

      it 'should return included data' do
        expect(body['included']).not_to be_empty
      end
    end

    context 'with an invalid included params' do
      let(:included_param) { 'invalid included' }
      let(:params) { { included: included_param } }

      it 'should respond with an HTTP 422 status' do
        expect(response.status).to eq(422)
      end

      it 'should return correct error' do
        expect(body['error']).to eq("#{included_param} is not valid for the included params")
      end
    end
  end

  context 'with an invalid test panel ID' do
    let(:test_panel_id) { 'INVALIDID' }

    it 'should respond with an HTTP 400 status' do
      expect(response.status).to eq(404)
    end

    it 'should return correct error' do
      expect(body['error']).to eq('Test panel not found')
    end
  end
end
