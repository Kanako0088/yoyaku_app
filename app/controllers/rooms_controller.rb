class RoomsController < ApplicationController

  def index
    @q = Room.ransack(params[:q])
    @rooms = @q.result
  end
  
  def list
    @rooms = Room.all
  end
  
  def search
    @rooms = @q.result
    @sum = @rooms.count
  end
  
  def new
    @room = Room.new
  end
 
  def create
    @room = Room.new(room_params)
    @room.user_id = current_user.id
    if @room.save
      flash[:notice] = "部屋を登録しました"
      redirect_to :root
    else
      render "new"
    end
  end
  
  def show
    @room = Room.find(params[:id])
    @reservation = Reservation.new
  end
  
private
  def fileupload_param
    params.require(:room).permit(:icon)
  end

  def room_params
    params.require(:room).permit(:name, :content, :price, :address, :icon, :user_id) 
  end
  
  def set_post
    @room = Room.find(params[:id])
  end
  
end
