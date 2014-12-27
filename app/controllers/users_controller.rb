class UsersController < ApplicationController
  def index
    @users = User.all.order('created_at DESC')
  end
  
  def create
  	@user = User.new(user_params)
  	if @user.save
  		redirect_to :back, notice: "Account Created"
  	else
  		redirect_to :back, notice: "Failed to create account"
  	end
  end

  def update
    @user = User.find(current_user.id)
    uploaded_io = params[:user][:avatar]
    password_salt = current_user.password_salt
    pwd = user_params[:current].present? ? BCrypt::Engine.hash_secret(user_params[:current], password_salt) : current_user.password_hash
    confirmed = true if pwd == current_user.password_hash
    if user_params[:current].present? && !confirmed
      redirect_to :back, alert: "Current Password is not valid"
    else
      if uploaded_io.present?
        File.open(Rails.root.join('public','uploads', uploaded_io.original_filename), 'wb') do |file|
          file.write(uploaded_io.read)
        end
      end
      @user.name = "#{user_params[:firstname]} #{user_params[:lastname]}"
      @user.email = user_params[:email]
      @user.avatar = uploaded_io.original_filename if uploaded_io.present?
      @user.password = user_params[:password] if user_params[:password] != ""
      if @user.save
        redirect_to :back, alert: "Account Updated"
      else
        redirect_to :back, alert: "Account Update Failed"
      end
    end
  end

  def destroy
  end

  private
  def user_params
    params.require(:user).permit(:email, :role, :password, :avatar, :firstname, :lastname, :current)
  end
end
