module PageAdmin
	module Index
		def self.included(base)
			base.instance_eval do

				index :as => :sortable do
					label :title # item content
					actions defaults: false do |page|
						(link_to "Add Children", add_children_admin_page_path(page)) + " | " +
						(link_to "Edit", edit_admin_page_path(page)) + " - " +
						(link_to "Delete", admin_page_path(page), :method => :delete, :data => {:confirm => "Are you sure?"})
					end
				end
			end
		end
	end
end