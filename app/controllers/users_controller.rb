class UsersController < ApplicationController
  before_action :set_user, only: [:show]


  def show
    @story = current_user.stories.build
    
  end

  def new
    @user = User.new
  end

  
  def create
    @user = User.new(user_params)

      if @user.save
        session[:user_id]
        redirect_to root_path
       else
        render :new 
      
    end
  end


 

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
