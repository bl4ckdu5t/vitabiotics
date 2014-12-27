class DashboardController < ApplicationController
  before_action :require_login
  before_filter :init

  def index
    @departments.each do |department|
      childfetch = Department.where(parent: "#{department.name}").select('name')
      instance_variable_set("@#{department.name}Children".gsub(' ','_'), childfetch.map { |child| "#{child.name}" }.join(',') )
    end
  end
  def attendance

  end
  def preferences

  end
  def company
    @department = Department.new
    @allDepartments = Department.all.order('created_at ASC')
    @allDepartments.all.map do |dept|
      instance_variable_set("@dept#{dept.id}", Department.find(dept.id))
    end
  end
  def user
    @user = User.new
    @user_update = User.find(current_user.id)
  end

  private

  def require_login
    unless session[:user_id].present?
      redirect_to root_url
    end
  end
  def init
    @departments = Department.where(parent: '').order('created_at ASC')
  end
end
