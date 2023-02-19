module PageAdmin
	module Form
		def self.included(base)
			base.instance_eval do
				form do |f|
					
					f.inputs 'PageADMIN' do
						div class: "container" do
							div class: "row mb-4" do
								div class: "col-6" do
									f.input :title, input_html: {class: "form-control w-100"}
								end
								div class: "col-6" do
									# f.input :layout, as: :select, label: "Jenis Page", collection: Page::PAGE_LAYOUT, input_html: {class: "form-control w-100"}
									f.input :layout, as: :select, label: "Jenis Page", collection: Page::PAGE_LAYOUT, input_html: {class: "form-control w-100", "data-bs-toggle": "tooltip", "data-placement": "top", "data-html": true, title: "Pilih jenis page yang anda inginkan"}
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
									
