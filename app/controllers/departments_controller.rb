class DepartmentsController < ApplicationController
  before_filter :init
  def create
  	@department = Department.new(department_params)
  	if @department.save
      Activity.new({'user_id' => current_user.id, 'activity' => "Created a department" }).save
  		redirect_to :back, notice: 'Department created'
  	else
  		redirect_to :back, notice: 'Failed to create department'
  	end
  end
  def update
    department = Department.find(params[:id])
    updated = department.update_attributes(department_params.except("id"))
    if updated
      Activity.new({'user_id' => current_user.id, 'activity' => "Updated department" }).save
      redirect_to :back
    end
  end
  def destroy
    department = Department.find(params[:id])
    if department.destroy
      Activity.new({'user_id' => current_user.id, 'activity' => "Deleted a department" }).save
      redirect_to :back
    end
  end
  def categories
    routes = params[:param].split('/')
    if routes.count == 1
      item = routes[0].gsub('-',' ')
      @staffs = Staff.where(Staff.arel_table[:department].eq(item).or(Staff.arel_table[:designation].eq(item)))
    elsif routes.count == 2
      @staffs = Staff.where(designation: routes[0].gsub('-',' '), department: routes[1].gsub('-',' '))
    else
      redirect_to dashboard_path
    end

  end

  private

  def department_params
  	params.require(:department).permit(:name, :parent, :id)
  end
  def init
    @preferences = Preference.find(1)
  end
end
