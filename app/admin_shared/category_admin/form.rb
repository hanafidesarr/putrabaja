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
						f.input :layout, as: :select, collection: ["default", "axeonsoft"], input_html: {class: "form-control select2"}
					end
					if f.object.id.present?
						f.inputs do
							f.has_many :children, allow_destroy: true, new_record: true, heading: "" do |attach|
								attach.input :name
							end
						end
					end
					
					f.has_many :images, allow_destroy: true, heading: false, class: "col-2 mx-2" do |attach|
						arbre do
							attach.input :asset, :as => :file, label: false, :hint => attach.template.image_tag(attach.object.asset.url(:thumb), class: "w-100"), "data-placement"=>"top"
						end
						attach.template.concat(Arbre::Context.new do
							hr
							div class: "row" do
								div class: "col-12" do
									attach.template.render partial: "admin/admin_shared/image_upload", locals: {f: attach}
								end
							end
						end.to_s)
					end
					
					f.actions
				end
			end
		end
	end
end
									

