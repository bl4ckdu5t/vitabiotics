class SessionsController < ApplicationController
  layout global:
  def new
  end

  def create
  	user = User.authenticate(params[:email], params[:password])
  	if user
      reset_session
  		session[:user_id] = user.id
  		redirect_to dashboard_path
  	else
  		flash.now.alert = "Invalid email or password"
  		render "new"
  	end
  end

  def destroy
  	session[:user_id] = nil
  	redirect_to root_url
  end
end
