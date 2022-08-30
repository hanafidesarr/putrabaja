module CategoryAdmin
	module Form
		def self.included(base)
			base.instance_eval do
				form do |f|
					f.inputs do
						div class: "d-flex justify-content-end px-4" do
							div class: "form-check form-switch" do
								f.input :active, label: "", input_html: {class: "form-check-input", disabled: false, "aria-label"=>"..."}
							end
						end
						f.input :name
					end
					if f.object.id.present?
						f.inputs do
							f.has_many :children, allow_destroy: true, new_record: true, heading: "" do |attach|
								attach.input :name
							end
						end
					end
					f.actions
				end
			end
		end
	end
end
									

