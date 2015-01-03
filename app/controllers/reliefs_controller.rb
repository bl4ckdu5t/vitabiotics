class ReliefsController < ApplicationController
	before_filter :init
	before_action :require_login
	def index
		@reliefs = Relief.all
	end
	def new
		@relief = Relief.new
	end

	def create
		@relief = Relief.new(relief_params)
		if @relief.save
			redirect_to :back, notice: "#{relief_params[:category]} has been recorded"
		else
			render "new"
		end
	end

	def show
		@relief = Relief.find(params[:id])
	end

	def edit
		@relief = Relief.find(params[:id])
	end

	def destroy
		@relief = Relief.find(params[:id])
		if @relief.destroy
			redirect_to reliefs_path
		else
			render "show"
		end
	end

	private

	def require_login
		unless session[:user_id].present?
	    	redirect_to root_url
		end
	end

	def relief_params
		params.require(:relief).permit!
	end

	def init
		@fetchStaff = Staff.all
		@staffs = @fetchStaff.all.map { |staff| ["#{staff.surname} #{staff.othernames}", staff.id] }
		@types = [['Outpass','outpass'],['Query','query'],['Suspension','suspension']]
		@preferences = Preference.find(1)
	end
end
