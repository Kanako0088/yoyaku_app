class UsersController < ApplicationController
  before_action :set_user, only: [:show,:profile,:profile_create]
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :user_image
  
  def index
    @users = Users.all
  end
  
  def edit
    @user = User.find(current_user.id)
  end
  
  def update
    @user = User.find(current_user.id)
    @user = User.update(params.require(:user).permit(:image, :name, :introduction))
  	redirect_to :root
  end

  protected
    def configure_account_update_params
     devise_parameter_sanitizer.permit(:account_update, keys: [:image, :name, :introduction])
    end

  private
    def fileupload_param
      params.require(:user).permit(:image)
    end
    
    def set_user
      @user = User.find([current_user.id])
    end  
    
    def user_image
      @user = User.find(current_user.id)
    end
end
