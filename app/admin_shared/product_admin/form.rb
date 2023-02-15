module ProductAdmin
	module Form
		def self.included(base)
			base.instance_eval do
				form do |f|

					tabs do
						tab 'General' do
							f.inputs do

								div class: "d-flex justify-content-end px-4" do
									div class: "form-check form-switch" do
										f.input :active, label: "Active / No Active", input_html: {class: "form-check-input", disabled: false, "aria-label"=>"..."}
									end
								end
								br
								
								div class: "container" do
									div class: "row" do
										div class: "col-3" do
											f.input :sku, input_html: {class: "form-control w-100"}
										end
										div class: "col-3" do
											f.input :name, input_html: {class: "form-control w-100"}
										end
										div class: "col-3" do
											f.input :image_type, input_html: {class: "form-control w-100"}
										end
										div class: "col-3" do
											f.input :category, input_html: {class: "form-control w-100"}
										end
										div class: "col-3" do
											f.input :price, input_html: {class: "form-control w-100"}
										end
										div class: "col-3" do
											f.input :discount, input_html: {class: "form-control w-100"}
										end
										div class: "col-6" do
											f.input :url, input_html: {class: "form-control w-100"}
										end
										div class: "col-12" do
											f.input :short_description, as: :text, input_html: {:rows => 3, class: "form-control w-100"}
										end
										div class: "col-12" do
											f.input :description, :input_html => { :rows => 8, class: "form-control w-100" }
										end
									end
								end
							end
						end

						tab 'Properties' do
							f.inputs do
								f.input :video_url
							end
						end

						tab 'Images' do
							
							f.has_many :images, allow_destroy: true, heading: false, class: "col-2 mx-2" do |attach|
								# arbre do
								# 	raw image_tag(attach.object.asset.url(:thumb), class: "w-100")
								# end
								attach.template.concat(Arbre::Context.new do
									div class: "row" do
										div class: "col-12" do
											attach.template.image_tag(attach.object.url_image&.strip.presence || attach.object.asset_url, class: "w-100")
										end
									end
								end.to_s)
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

						tab 'SEO' do
							f.inputs do
								div class: "row mx-2" do

									f.input :slug, input_html: {class: "form-control w-100"}
									Product.stored_attributes[:seo_product_properties].each do | obj |
										div class: "col-lg-12 col-12 mb-2" do
											case obj
											when :keywords, :meta_description
												f.input obj, as: :text, input_html: {class: "form-control w-100", rows: 5}
											else
												f.input obj, input_html: {class: "form-control w-100"}
											end
										end
									end
								end
							end
						end

					end
					
					div class: "float-end" do
						f.actions do 
							f.cancel_link({action: "index"})
							f.action :submit, :label => "SIMPAN", :input_html => { class: "btn btn-primary w-100" }
						end
					end
					
				end
			end
		end
	end
end
									
