module ProductAdmin
	module Index
		def self.included(base)
			base.instance_eval do

        index do
          selectable_column
          id_column
          column :images do |obj|
            if obj.images.present?
              manipulate_image_tag(obj.images.first, options: {image_quality: obj.images.first.image_quality}, html: {class: "text-center img-fluid", style: "width: 100px; height:100px;"})

              # image_tag(obj.images.first.asset.url, width: "100", height: "100") if obj.images.present?
            end
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