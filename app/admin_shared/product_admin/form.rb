module ProductAdmin
	module Form
		def self.included(base)
			base.instance_eval do
				form do |f|

					tabs do
						tab 'General' do
							f.inputs 'General' do

								div class: "d-flex justify-content-end px-4" do
									div class: "form-check form-switch" do
										f.input :active, label: "", input_html: {class: "form-check-input", disabled: false, "aria-label"=>"..."}
									end
								end
								f.input :sku
								f.input :name
								f.input :category
								f.input :image_type
								f.input :price
								f.input :discount
								f.input :url
								f.input :short_description
								f.input :description, :input_html => { :rows => 5 }
								# div class: "row" do
		
								# 	div class: "col-4" do
								# 		f.inputs do
								# 			f.input :sku
								# 		end
								# 	end
								# 	div class: "col-4" do
								# 		f.inputs do
								# 			f.input :name
								# 		end
								# 	end
								# 	div class: "col-4" do
								# 		f.inputs do
								# 			f.input :category
								# 		end
								# 	end
								# 	div class: "col-4" do
								# 		f.inputs do
								# 			f.input :image_type
								# 		end
								# 	end
								# 	div class: "col-4" do
								# 		f.inputs do
								# 			f.input :price
								# 		end
								# 	end
								# 	div class: "col-4" do
								# 		f.inputs do
								# 			f.input :discount
								# 		end
								# 	end
								# 	div class: "col-6" do
								# 		f.inputs do
								# 			f.input :short_description
								# 		end
								# 	end
								# 	div class: "col-6" do
								# 		f.inputs do
								# 			f.input :description
								# 		end
								# 	end
								# end
							end
						end

						tab 'Images' do
							
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
						end

						tab 'Tech Specification' do
							f.inputs do
								f.input :battery_life
								f.input :model
								f.input :processor
								f.input :memory
								f.input :hard_drive
								f.input :vga
								f.input :os
								f.input :optical_drive
								f.input :warranty
								f.input :wireless
								f.input :bluetooth
								f.input :other
							end
						end
					end

					f.actions
				end
			end
		end
	end
end
									
