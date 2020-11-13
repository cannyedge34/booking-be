class Booking < ApplicationRecord
  belongs_to :space

  validates_presence_of :starts_at, :ends_at, :description
  validate :ends_at_gt_starts_at?

  scope :by_space, lambda { |rooms_number|
    joins(:space).where('spaces.rooms_number IN (?)', rooms_number)
  }

  private

  def ends_at_gt_starts_at?
    return if starts_at.blank? || ends_at.blank?
    return if starts_at < ends_at

    errors.add(:ends_at, 'cannot be before the start time')
  end
end
