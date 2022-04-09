module ProductAdmin
	module Form
		def self.included(base)
			base.instance_eval do
				form do |f|
					f.inputs 'PageADMIN' do
						div class: "row" do
							div class: "col-4" do
								f.input :name
								f.input :category
							end
							div class: "col-4" do
								f.has_many :attachments, allow_destroy: true do |attach|
									if attach.object.asset.url.present?
										li do 
											image_tag(attach.object.asset.url, width: "200px")
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
									
