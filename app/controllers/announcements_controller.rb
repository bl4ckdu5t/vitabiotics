class AnnouncementsController < ApplicationController
	before_action :require_login
	before_filter :init
	def index
		@announcements = Announcement.where(receiver: current_user.id).order('created_at DESC')
		@announcements.update_all(read: true)
	end
	def create
		insert = {sender: current_user.id, message: announcement_params[:message]}
		users = User.all.where.not(id: current_user.id).pluck(:id)
		users.each do |user|
			insert[:receiver] = user
			@announcement = Announcement.new(insert)
			@announcement.save
		end
		Activity.new({'user_id' => current_user.id, 'activity' => "Made a general announcement" }).save
		redirect_to :back
	end

	private
	def announcement_params
		params.require(:announcement).permit(:message)
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
