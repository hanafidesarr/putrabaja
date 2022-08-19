module CategoryAdmin
	module Index
		def self.included(base)
			base.instance_eval do
        index do
          selectable_column
          id_column
          column :name
          column :active
          column do |category|
            category.is_root?
          end
      
          actions
        end

        index :as => :sortable do
          label :active # item content
          label :name # item content
          actions
        end
			end
		end
	end
end