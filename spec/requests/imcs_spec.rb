require 'rails_helper'

RSpec.describe 'Imc API', type: :request do

  describe 'POST /imc' do
    let(:valid_attributes) { { height: 1.74, weight: 62 } }

    context 'when the request is valid' do
      before { post '/imc', params: valid_attributes }

      it 'return json' do
        expect(json['imc']).to eq(20.47)
        expect(json['classification']).to match("Peso normal ou adequado")
        expect(json['obesity']).to match("0") 
      end
      
      it 'returns status ok' do
        expect(response).to have_http_status(:ok)
      end
    end

    context 'when the request is invalid' do
      before { post '/imc', params: { height: 1.72} }

      it 'returns status bad_request' do
        expect(response).to have_http_status(:bad_request)
      end

      it 'body is empty' do
        expect(response.body).to match("must be greater than 0")
      end
    end
  end
end