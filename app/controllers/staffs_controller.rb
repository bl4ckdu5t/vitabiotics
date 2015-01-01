class StaffsController < ApplicationController
	before_filter :init
	def index
		@staffs = Staff.all
	end
	def new
		@staff = Staff.new
	end
	def create
		uploaded_io = params[:staff][:avatar]
		if uploaded_io.present?
        	File.open(Rails.root.join('public','uploads', uploaded_io.original_filename), 'wb') do |file|
          		file.write(uploaded_io.read)
        	end
        	staff_params[:avatar] = uploaded_io.original_filename
		end
		@staff = Staff.new(staff_params)
		if @staff.save
			redirect_to :back, notice: 'Staff has been created'
		else
			redirect_to :back, notice: 'Failed to create staff'
		end
	end
	def show
		@staff = Staff.find(params[:id])
	end
	def edit
		@staff = Staff.find(params[:id])
	end
	def update
		@staff = Staff.find(params[:id])
		uploaded_io = params[:staff][:avatar]
		if uploaded_io.present?
        	File.open(Rails.root.join('public','uploads', uploaded_io.original_filename), 'wb') do |file|
          		file.write(uploaded_io.read)
        	end
        	staff_params[:avatar] = uploaded_io.original_filename
		end
		updated = @staff.update_attributes(staff_params)
		if updated
			redirect_to :back, notice: 'Staff updated'
		else
			render 'edit', notice: "Failed to update"
		end
	end
	def destroy
		@staff = Staff.find(params[:id])
	    if @staff.destroy
	      redirect_to staffs_path
	    end
	end
	private
	def init
		@titles = [['Mr','mr'],['Mrs','mrs'],['Miss','miss'],['Master','master']]
		@genders = [['Male','male'],['Female','female'],['Other','others']]
		@statuses = [['Single','single'],['Married','married'],['Divorced','divorced'],['Separated','separated']]
		@preferences = Preference.find(1)
		@department = Department.all
		@designation = Department.where(parent: '')
		@departments = @department.all.map { |dept| [dept.name, dept.name.downcase] }
		@designations = @designation.all.map { |dept| [dept.name, dept.name.downcase] }
	end
	def staff_params
		params.require(:staff).permit!
	end
	def require_login
		unless session[:user_id].present?
	  		redirect_to root_url
		end
	end
end
