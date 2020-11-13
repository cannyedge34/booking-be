require 'rails_helper'

RSpec.describe BookingsController, type: :controller do
  describe 'GET /bookings' do
    include_context 'spaces and bookings'

    context 'with rooms_number param' do
      let(:send_index_action) { get :index, params: { rooms_number: [2] } }

      it 'renders only the scoped bookings' do
        send_index_action

        expect(response).to have_http_status(:ok)
        expect(parsed_response).to eq([booking_2.as_json])
      end
    end

    context 'with no params' do
      let(:send_index_action) { get :index, params: {} }

      it 'renders only the scoped bookings' do
        send_index_action

        expect(response).to have_http_status(:ok)
        expect(parsed_response).to eq([booking_1.as_json, booking_2.as_json])
      end
    end
  end
end
