module PageAdmin
	module Index
		def self.included(base)
			base.instance_eval do

				index :as => :sortable do
					label :title # item content
					actions defaults: false do |page|
						(link_to "Add Children", root_path(page)) + " | " +
						(link_to "Edit", root_path(page)) + " - " +
						(link_to "Delete", root_path(page))
					end
				end
			end
		end
	end
end