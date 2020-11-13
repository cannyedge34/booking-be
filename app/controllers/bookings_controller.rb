class BookingsController < ApplicationController
  def index
    render json: index_scope
  end

  def index_scope
    params[:rooms_number] ? Booking.by_space(params[:rooms_number]) : Booking.all
  end
end
