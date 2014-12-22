class DashboardController < ApplicationController
  before_action :require_login
  before_filter :init

  def index
    @departments.each do |department|
      childfetch = Department.where(parent: "#{department.name}").select('name')
      instance_variable_set("@#{department.name}Children".gsub(' ','_'), childfetch.map { |child| "#{child.name}" }.join(',') )
    end
  end
  def office

  end
  def preferences

  end
  def company
  end

  private

  def require_login
    unless session[:user_id].present?
      redirect_to root_url
    end
  end
  def init
    @current_user = session[:user_id]
    @departments = Department.where(parent: '')
  end
end
