class DashboardController < ApplicationController
  before_action :require_login
  before_filter :init

  def index
    @departments.each do |department|
      childfetch = Department.where(parent: "#{department.name}").select('name')
      instance_variable_set("@#{department.name}Children".gsub(' ','_'), childfetch.map { |child| "#{child.name}" }.join(',') )
    end
    @activities = Activity.where(user_id: current_user.id).order("updated_at DESC").take(5)
  end
  def records
    @loans = Loan.take(5)
    @sabbaticals = Sabbatical.take(5)
    @reliefs = Relief.take(5)
    @attendances = Attendance.take(5)
  end
  def preferences
    @preference = Preference.find(1)
    # Colors in RGB
    @colors = ['221, 17, 66','170, 85, 204','32, 144, 172','238, 102, 17','192, 195, 204']
  end
  def company
    @department = Department.new
    @allDepartments = Department.all.order('created_at ASC')
    @department_array = @departments.all.map { |dept| [dept.name, dept.name] }
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
    @preferences = Preference.find(1)
  end
end
