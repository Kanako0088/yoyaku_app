class ReservationsController < ApplicationController
  # before_action :reserve_params, only: [:confirm]
  
  def index
    # @user = User.find(params[:id])
    @reservations = Reservation.all
  end
  
  def new
    @room = Room.find(params[:id])
    @reservation = Reservation.new
  end

  # def confirm
  #   @reservation = Reservation.new(reserve_params)
  #   @room = @reservation.room
  #   return if @reservation.valid
  #   render :new
  # end

  # def back
  #   render :new
  # end
  
  def create
    @reservation = Reservation.new(reserve_params)
    # if @reservation.user_id = current_user.id
      if @reservation.save
        redirect_to reservation_path(@reservation.id)
      else
        redirect_to @reservation
      end
    # else
    #   redirect_to @reservation
    # end
  end
  
  def show
    @reservation = Reservation.find(params[:id])
    @room = Room.find(@reservation.room_id)
    s = @reservation.start_date.strftime("%Y,%m,%d").to_i
    e = @reservation.end_date.strftime("%Y,%m,%d").to_i
    @use_days = (Date.new(e) - Date.new(s)).denominator + 2

    @total_amount = @room.price * @reservation.num_people * @use_days
  end
  
  private
  
  def reserve_params
      params.require(:reservation)
            .permit(:start_date, :end_date, :num_people, :room_id, :user_id) 
  end
  
end
