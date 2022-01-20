module PageAdmin
	module Index
		def self.included(base)
			base.instance_eval do

				index :as => :sortable do
					label :title # item content
					actions defaults: false do |page|
						(link_to add_children_admin_page_path(page), style: "margin: 0 0.5rem;" do icon('fas', 'plus') end) +
						(link_to edit_admin_page_path(page), style: "margin: 0 0.5rem;" do icon('fas', 'edit') end) +
						(link_to admin_page_path(page), style: "margin: 0 0.5rem;", :method => :delete, :data => {:confirm => "Are you sure?"} do icon('fas', 'trash') end)
					end
				end
			end
		end
	end
end