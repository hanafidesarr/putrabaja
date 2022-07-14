module ProductAdmin
	module Form
		def self.included(base)
			base.instance_eval do
				form do |f|
					f.inputs 'PageADMIN' do
						div class: "row" do
							div class: "col-4" do
								f.input :sku
								f.input :name
								f.input :category
								f.input :image_type
								f.input :price
								f.input :discount
								f.input :description
								f.input :short_description
							end
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
					end
					f.actions
				end
			end
		end
	end
end
									
