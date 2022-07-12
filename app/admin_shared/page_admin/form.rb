module PageAdmin
	module Form
		def self.included(base)
			base.instance_eval do
				form do |f|
					f.inputs 'PageADMIN' do
						div class: "row" do
							div class: "col-4" do
								f.input :title
								f.input :layout
							end
							div class: "col-4" do
								f.has_many :attachments do |attach|
									
									if (url = attach.object.asset.url rescue nil).present?
										li do 
											image_tag(url, width: "200px")
										end
									end
									div class: "x" do
										attach.object.asset.url rescue nil
									end
									attach.input :asset
								end
							end
							div class: "col-4" do
								f.has_many :components, allow_destroy: true do |x|
									x.input :name
									div class: "row" do
										div class: "col-4" do
											x.has_many :attachments do |attach|
												if (url = attach.object.asset.url rescue nil).present?
													li do 
														image_tag(url, width: "200px")
													end
												end
												div class: "x" do
													attach.object.asset.url rescue nil
												end
												attach.input :asset
											end
										end
									end
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
									
