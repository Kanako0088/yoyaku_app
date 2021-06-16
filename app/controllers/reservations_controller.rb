class ReservationsController < ApplicationController

  def index
    @reservations = Reservation.all
  end
  
  def new
    @room = Room.find(params[:id])
    @reservation = Reservation.new
  end
  
  def create
    @reservation = Reservation.new(reserve_params)
    @reservation.user_id = current_user.id
    if @reservation.save
      redirect_to reservation_path(@reservation.id), notice: "予約を登録しました"
    else
      redirect_to @reservation, notice: "予約に失敗しました"
    end
  end
  
  def show
    @reservation = Reservation.find(params[:id])
    @room = Room.find(@reservation.room_id)
    start_date_num = @reservation.start_date.strftime("%Y,%m,%d").to_i
    end_date_num = @reservation.end_date.strftime("%Y,%m,%d").to_i
    @use_days = (Date.new(end_date_num) - Date.new(start_date_num)).denominator + 2

    @total_amount = @room.price * @reservation.num_people * @use_days
  end
  
  private
  
  def reserve_params
      params.require(:reservation)
            .permit(:start_date, :end_date, :num_people, :room_id, :user_id) 
  end
  
end
