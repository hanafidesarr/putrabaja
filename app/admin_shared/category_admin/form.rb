module CategoryAdmin
	module Form
		def self.included(base)
			base.instance_eval do
				form do |f|
					f.inputs do
						f.input :active
						br
						f.input :name
					end

					f.inputs do
						f.has_many :children, allow_destroy: true, heading: "" do |attach|
							attach.input :name
						end
					end
					f.actions
				end
			end
		end
	end
end
									

