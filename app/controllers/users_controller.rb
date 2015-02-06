class UsersController < ApplicationController
  before_filter :init
  before_action :require_login

  def index
    @users = User.all.where.not(email: current_user.email).order('created_at DESC')
  end
  
  def create
  	@user = User.new(user_params)
  	if @user.save
      @activity = Activity.new({'user_id' => current_user.id, 'activity' => 'Created new user'})
      @activity.save
  		redirect_to :back, notice: "Account Created"
  	else
  		redirect_to :back, notice: "Failed to create account"
  	end
  end

  def update
    @user = User.find(params[:id])
    password_salt = current_user.password_salt
    pwd = user_params[:current].present? ? BCrypt::Engine.hash_secret(user_params[:current], password_salt) : current_user.password_hash
    confirmed = true if pwd == current_user.password_hash
    if user_params[:current].present? && !confirmed
      redirect_to :back, alert: "Current Password is not valid"
    else
      name = "#{user_params[:firstname]} #{user_params[:lastname]}"
      if @user.update(user_params.except(:firstname, :lastname).merge(name: name))
       Activity.new({'user_id' => current_user.id, 'activity' => "Updated a user" }).save
       redirect_to :back, alert: "Account Updated"
      else
       redirect_to :back, alert: @user.errors.full_messages
      end
    end
  end

  def destroy
    user = User.find(params[:id])
    if user.destroy
      Activity.new({'user_id' => current_user.id, 'activity' => "Deleted a user" }).save
      redirect_to :back
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :role, :password, :avatar, :firstname, :lastname, :current)
  end
  def init
    @preferences = Preference.find(1)
  end
  def require_login
    unless session[:user_id].present?
      redirect_to root_url
    end
  end
end
