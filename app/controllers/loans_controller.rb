class LoansController < ApplicationController
	before_filter :init
	before_action :require_login
	def index
		@loans = Loan.all
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

	def show
		@loan = Loan.find(params[:id])
		loanList = Loan.where(staff_id: @loan.staff_id, paid: false).pluck(:amount)
		loanSum = 0
		addition = loanList.each { |amount| loanSum += amount.gsub(/\D/,'').to_i }
		@outstanding = loanSum - @loan.amount.gsub(/\D/,'').to_i
	end

	def edit
		@loan = Loan.find(params[:id])
	end

	def update
		@loan = Loan.find(params[:id])
		updated = @loan.update_attributes(loan_params)
		if updated
			redirect_to :back, notice: 'Record updated'
		else
			render "edit"
		end
	end

	def destroy
		@loan = Loan.find(params[:id])
	    if @loan.destroy
	      redirect_to loans_path
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
