class SessionsController < ApplicationController
  layout 'global'
  def new
    if current_user.present?
      redirect_to dashboard_path
    end
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

  def forgot
    if params[:email].present?
      exists = User.where(email: params[:email]).first
      if exists
        redirect_to :back, notice: 'A link has been sent to your email. Follow the link'
      else
        redirect_to :back, notice: 'The email is not registered. Contact your administrator'
      end
    end
  end

  def destroy
  	session[:user_id] = nil
  	redirect_to root_url
  end
end
