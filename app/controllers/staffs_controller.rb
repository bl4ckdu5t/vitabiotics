class StaffsController < ApplicationController
	before_filter :init
	def index
		@staffs = Staff.all
	end
	def new
		@staff = Staff.new
	end
	def create
		staff_params[:date_of_birth] = "#{params[:birth_day]} #{params[:birth_month]}, #{params[:birth_year]}"
		@staff = Staff.new(staff_params)
		if @staff.save
			Activity.new({'user_id' => current_user.id, 'activity' => "Created a new staff" }).save
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
		staff_params[:date_of_birth] = "#{params[:birth_day]} #{params[:birth_month]}, #{params[:birth_year]}"
		updated = @staff.update_attributes(staff_params)
		if updated
			Activity.new({'user_id' => current_user.id, 'activity' => "Updated a staff data" }).save
			redirect_to :back, notice: 'Staff updated'
		else
			render 'edit', notice: "Failed to update"
		end
	end
	def destroy
		@staff = Staff.find(params[:id])
	    if @staff.destroy
	    	Activity.new({'user_id' => current_user.id, 'activity' => "Deleted a staff" }).save
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
		this_year = Time.now.strftime('%Y').to_i
		oldest_year = this_year - 60 # 60 years ago. Staff should be retired if above 60
		@years = (oldest_year..this_year - 10).map { |y| [y, y] } # 10 yo as youngest staff age
		@months = Date::MONTHNAMES.map { |m| [m, m] }
		@months.delete_at(0)
		@days = (1..31).map { |d| [d, d] }
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
