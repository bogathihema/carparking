class BookingslotsController < ApplicationController
  def index
    @bookingslots = Bookingslot.all
  end

  def new
    if params["entrance_no"].present? && params["registration_no"].present?
      if Bookingslot.where(registration_no: params["registration_no"],  entry_at: Date.today).first.present?
        render json: {booked: "Parking slot for your registration car has already booked, You cannot book again!"}
      else
        entry = Entry.where(block: params["entrance_no"].to_i).first
        slot = Slot.where(entry_id: entry.id).first
        empty_slots = (JSON.parse slot.seats) - (Bookingslot.pluck(:slotno))
        @free_slot = empty_slots.first
        if @free_slot.present?
          render json: {free_slot: @free_slot}
        else
          render json: {error: "no vacancies"}
        end
      end
    else
      @booking_slot = Bookingslot.new
    end
  end

  def create
    booking_params = params[:bookingslot]
    slot = Bookingslot.create(entrance_no: booking_params[:entrance_no], registration_no: booking_params[:registration_no], slotno: booking_params[:slotno], entry_at: Date.today)
    slot.save!
    redirect_to bookingslots_path
  end

  def vehicle_history

  end

  def get_vehicle_slots
    if params[:registration_no].present? && params[:entry_date].present?
      @history = Bookingslot.where(registration_no: params[:registration_no], entry_at: params[:entry_date].to_date)
    elsif params[:entry_date].present?
      @history = Bookingslot.where(entry_at: params[:entry_date].to_date)
    elsif params[:registration_no].present?
      @history = Bookingslot.where(registration_no: params[:registration_no])
    else
    end
    render 'vehicle_history'
  end

  def destroy
    slot = Bookingslot.find(params[:id])
    slot.destroy if slot.present?
    redirect_to bookingslots_path
  end
end
