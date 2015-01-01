module DashboardHelper
	def instancevars(arg)
		instance_variable_get("@#{arg}Children".gsub(' ','_'))
	end
	def nameslug(arg)
		arg.downcase[0,5]
	end
	def color_label(arg)
		"theme_#{arg.gsub(', ','_')}"
	end
end
