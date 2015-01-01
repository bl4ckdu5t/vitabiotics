class DepartmentsController < ApplicationController
  def create
  	@department = Department.new(department_params)
  	if @department.save
  		redirect_to :back, notice: 'Department created'
  	else
  		redirect_to :back, notice: 'Failed to create department'
  	end
  end
  def update
    department = Department.find(params[:id])
    updated = department.update_attributes(department_params.except("id"))
    if updated
      redirect_to :back
    end
  end
  def destroy
    department = Department.find(params[:id])
    if department.destroy
      redirect_to :back
    end
  end

  private

  def department_params
  	params.require(:department).permit(:name, :parent, :id)
  end
end
