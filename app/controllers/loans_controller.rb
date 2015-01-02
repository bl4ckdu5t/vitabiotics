class LoansController < ApplicationController
	before_filter :init
	before_action :require_login
	def index
	end
	def new
		@loan = Loan.new
	end

	def create
		@loan = Loan.new(loan_params)
		if @loan.save
			redirect_to :back, notice: 'Loan record created'
		else
			render "new", notice: 'Failed to create loan record'
		end
	end

	private

	def loan_params
		params.require(:loan).permit!
	end
	def require_login
		unless session[:user_id].present?
	    	redirect_to root_url
		end
	end
	def init
		@preferences = Preference.find(1)
		@fetchStaff = Staff.all
		@staffs = @fetchStaff.all.map { |staff| ["#{staff.surname} #{staff.othernames}", staff.id] }
	end
end
