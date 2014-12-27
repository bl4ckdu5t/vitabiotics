module DashboardHelper
	def instancevars(arg)
		instance_variable_get("@#{arg}Children".gsub(' ','_'))
	end
	def nameslug(arg)
		arg.downcase[0,5]
	end
	def department_update(arg)
		instance_variable_get("@dept#{arg}")
	end
end
