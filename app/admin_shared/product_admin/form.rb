module ProductAdmin
	module Form
		def self.included(base)
			base.instance_eval do
				form do |f|

					tabs do
						tab 'General' do
							f.inputs 'General' do
								f.input :sku
								f.input :name
								f.input :category
								f.input :image_type
								f.input :price
								f.input :discount
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

						tab 'Attachment' do
							
							f.has_many :attachments, allow_destroy: true, heading: false do |attach|
								arbre do
									
									div class: "row" do

										div class: "col-3" do
											if (url = attach.object.asset.url rescue nil).present?
												image_tag(url, width: "100%")
											end

										end
										div class: "col-3" do
											attach.inputs do
												attach.input :asset
											end
										end
									end
								end
								# f.inputs '' do
									
								# 	columns do
								# 		column span: 2 do
											# if (url = attach.object.asset.url rescue nil).present?
											# 	li do 
											# 		image_tag(url, width: "200px")
											# 	end
											# end
								# 		end
								# 		column do
								# 			attach.input :asset
								# 		end
								# 	end
								# 	# div class: "col-6" do
								# 	# 	# attach.input :asset
								# 	# end
								# end
							end
						end
					end

					f.actions
				end
			end
		end
	end
end
									
