module ProductAdmin
	module Index
		def self.included(base)
			base.instance_eval do

        index do
          selectable_column
          id_column
          column :name
          column :short_description
          column :description
          column :price
          column :image_type
          column :created_at
          actions
        end
			end
		end
	end
end