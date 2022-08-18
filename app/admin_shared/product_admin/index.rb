module ProductAdmin
	module Index
		def self.included(base)
			base.instance_eval do

        index do
          selectable_column
          id_column
          column :images do |obj|
            image_tag(obj.images.first.asset.url, width: "100", height: "100") if obj.images.present?
          end
          column :name
          column :image_type
          column :price
          column :created_at
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