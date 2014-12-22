module DashboardHelper
	def instancevars(arg)
		instance_variable_get("@#{arg}Children".gsub(' ','_'))
	end
	def nameslug(arg)
		arg.downcase[0,5]
	end
end
