require 'rails_helper'

RSpec.describe Booking, type: :model do
  describe 'relationships' do
    it { should belong_to(:space) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:description) }
    it { should validate_presence_of(:starts_at) }
    it { should validate_presence_of(:ends_at) }

    describe 'ends_at_gt_starts_date?' do
      context 'starts_at is less than ends_at' do
        let(:valid_booking) { create(:booking) }

        it 'creates a new booking' do
          expect { valid_booking.save }.to change { Booking.count }.from(0).to(1)
          expect(valid_booking.valid?).to be_truthy
        end
      end

      context 'starts_at is greather than ends_at' do
        let(:invalid_booking) do
          build(
            :booking,
            starts_at: Time.current + 1.hour,
            ends_at: Time.current
          )
        end

        it 'does not create a new the booking' do
          expect(invalid_booking.valid?).to be_falsey
          expect(
            invalid_booking.errors[:ends_at]
          ).to eq(['cannot be before the start time'])
        end
      end
    end
  end

  describe 'scopes' do
    include_context 'spaces and bookings'

    describe 'by_space' do
      let(:by_space) { Booking.by_space([1]) }

      it 'renders only scoped bookings' do
        expect(by_space).to eq([booking_1])
      end
    end
  end
end
