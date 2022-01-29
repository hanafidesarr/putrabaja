module PageAdmin
	module Index
		def self.included(base)
			base.instance_eval do

				index :as => :sortable do
					label :title # item content
					actions defaults: false do |page|
						(link_to add_children_admin_page_path(page), class: "mx-2" do icon('fas', 'plus') end) +
						(link_to edit_js_admin_page_path(page), remote: :true, class: "mx-2 text-success" do icon('fas', 'edit') end) +

						# (link_to edit_admin_page_path(page), style: "margin: 0 0.5rem;" do icon('fas', 'edit') end) +
						(link_to admin_page_path(page), class: "mx-2 text-danger", :method => :delete, :data => {:confirm => "Are you sure?"} do icon('fas', 'trash') end)
					end

					render "load_form"

				end
			end
		end
	end
end