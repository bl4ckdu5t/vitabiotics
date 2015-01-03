class AttendancesController < ApplicationController
	before_filter :init
	before_action :require_login
	def index
		@attendances = Attendance.all
	end
	def new
		@attendance = Attendance.new
	end
	def create
		@attendance = Attendance.new(attendance_params)
		if @attendance.save
			redirect_to :back, notice: 'Attendance record created'
		else
			render "new"
		end
	end
	def show
		@attendance = Attendance.find(params[:id])
	end
	def edit
		@attendance = Attendance.find(params[:id])
	end
	def update
		@attendance = Attendance.find(params[:id])
		updated = @attendance.update_attributes(attendance_params)
		if updated
			redirect_to :back, notice: 'Record updated'
		else
			render "edit"
		end
	end
	def destroy
		@attendance = Attendance.find(params[:id])
		if @attendance.destroy
			redirect_to attendances_path
		end
	end

	private

	def attendance_params
		params.require(:attendance).permit!
	end

	def init
		@preferences = Preference.find(1)
		@fetchStaff = Staff.all
		@staffs = @fetchStaff.all.map { |staff| ["#{staff.surname} #{staff.othernames}", staff.id] }
	end

	def require_login
		unless session[:user_id].present?
	    	redirect_to root_url
		end
	end
end
