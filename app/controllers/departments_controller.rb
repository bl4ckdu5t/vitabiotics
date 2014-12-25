class DepartmentsController < ApplicationController
  def index
  end
  def create
  	@department = Department.new(department_params)
  	if @department.save
  		redirect_to :back, notice: 'Department created'
  	else
  		redirect_to dashboard_path
  	end
  end
  def edit
  end
  def update
    @department = Department.new(department_params)
    render text: @department and return
  end
  def destroy
  end

  private

  def department_params
  	params.require(:department).permit(:name, :parent)
  end
end
