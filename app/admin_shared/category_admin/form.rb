module CategoryAdmin
	module Form
		def self.included(base)
			base.instance_eval do
				form do |f|
					f.inputs do
						f.input :name
					end
					f.actions
				end
			end
		end
	end
end
									

