class SabbaticalsController < ApplicationController
	before_action :require_login
	before_filter :init
	def index
		@sabbatical = Sabbatical.all
	end
	def new
  		@sabbatical = Sabbatical.new
	end

	def create
		@sabbatical = Sabbatical.new(sabbatical_params)
		if @sabbatical.save
			Activity.new({'user_id' => current_user.id, 'activity' => "Created a sabbatical record" }).save
			redirect_to :back, notice: 'Leave record created'
		else
			render "new"
		end
	end

	def show
		@sabbatical = Sabbatical.find(params[:id])
	end

	def edit
		@sabbatical = Sabbatical.find(params[:id])
	end

	def update
		@sabbatical = Sabbatical.find(params[:id])
		updated = @sabbatical.update_attributes(sabbatical_params)
		if updated
			Activity.new({'user_id' => current_user.id, 'activity' => "Updated a sabbatical record" }).save
			redirect_to :back, notice: 'Record updated'
		else
			render "edit"
		end
	end

	def destroy
		@sabbatical = Sabbatical.find(params[:id])
	    if @sabbatical.destroy
	    	Activity.new({'user_id' => current_user.id, 'activity' => "Deleted a sabbatical record" }).save
	    	redirect_to sabbaticals_path
	    end
	end
private

	def sabbatical_params
		params.require(:sabbatical).permit!
	end
	def require_login
		unless session[:user_id].present?
	    	redirect_to root_url
		end
	end
	def init
		@preferences = Preference.find(1)
		@fetchStaff = Staff.all
		@staffs = @fetchStaff.all.map { |staff| ["#{staff.surname} #{staff.othernames}", staff.id] }
		@types = [['Annual Leave','annual'],['Casual Leave','casual'],['Maternity Leave', 'maternity'],['Sick Leave','sick']]
	end
end
