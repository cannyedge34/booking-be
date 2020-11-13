shared_context 'spaces and bookings' do
  let!(:space_1)   { create(:space, rooms_number: 1) }
  let!(:booking_1) { create(:booking, space: space_1) }

  let!(:space_2)   { create(:space, rooms_number: 2) }
  let!(:booking_2) { create(:booking, space: space_2) }
end
