class ActivitiesController < ApplicationController
	before_action :require_login
	before_filter :init
	def index
		@activities = Activity.where(user_id: current_user.id).order('updated_at DESC')
	end

	def clear
		activity = Activity.all
	    if activity.destroy_all
	      redirect_to :back
	    end
	end

	private
	
	def require_login
		unless session[:user_id].present?
    		redirect_to root_url
    	end
	end
	def init
		@preferences = Preference.find(1)
	end
end
