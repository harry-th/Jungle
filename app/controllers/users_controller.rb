class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_url
    else
      render :new
    end
  end

    def login
      ps = params[:user]
      user = User.authenticate_with_credentials(ps[:email], ps[:password])
    if user
      session[:user_id] = user.id
      redirect_to '/'
    else
      redirect_to '/users/login'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/users/login'
  end

private

  def user_params
    params.require(:user).permit(
      :first_name,
      :last_name,
      :email,
      :password,
      :password_confirmation
    )
  end

end
