module ProductAdmin
	module Form
		def self.included(base)
			base.instance_eval do
				form do |f|
					f.inputs 'PageADMIN' do
						div class: "row" do

							div class: "col-4" do
								f.inputs do
									f.input :sku
								end
							end
							div class: "col-4" do
								f.inputs do
									f.input :name
								end
							end
							div class: "col-4" do
								f.inputs do
									f.input :category
								end
							end
							div class: "col-4" do
								f.inputs do
									f.input :image_type
								end
							end
							div class: "col-4" do
								f.inputs do
									f.input :price
								end
							end
							div class: "col-4" do
								f.inputs do
									f.input :discount
								end
							end
							div class: "col-4" do
								f.inputs do
									f.input :short_description
								end
							end
							div class: "col-4" do
								f.inputs do
									f.input :description
								end
							end
						end
						div class: "row" do

							div class: "col-4" do
								f.has_many :attachments, allow_destroy: true do |attach|
									if (url = attach.object.asset.url rescue nil).present?
										li do 
											image_tag(url, width: "200px")
										end
									end
									attach.input :asset
								end
							end
						end
						# div class: "row" do
						# 	div class: "col-12" do
						# 		f.has_many :media_socials, allow_destroy: true do |media_social|
						# 			media_social.input :product_message
						# 		end
						# 	end
						# end
					end
					f.actions
				end
			end
		end
	end
end
									
