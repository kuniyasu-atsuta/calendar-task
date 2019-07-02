class PagesController < ApplicationController

  def landing
  end

  def confirm_mail
  end

  def lock_screen
  end

  def login
  end

  def recoverpw
  end

  def register
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
    else
      render 'register'
    end
  end


  def starter
  end

  def inbox
  end

  def index
  end

  def calendar
    @user = User.find(current_user.id)
  end

  def typography
  end

  def piano
  end

  def help
    @user = User.find(current_user.id)
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password)
    end
end
