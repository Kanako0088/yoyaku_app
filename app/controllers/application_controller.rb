class ApplicationController < ActionController::Base
  before_action :user_image
  before_action :set_q
  
  def user_image
    @user = User.find(current_user.id) if user_signed_in?
  end
  
  def set_q
    @q = Room.ransack(params[:q])
    @rooms = @q.result
  end
  
end
