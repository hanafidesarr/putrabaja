module ProductAdmin
	module Index
		def self.included(base)
			base.instance_eval do

        index do
          selectable_column
          id_column
          column :attachments do |obj|
            image_tag(obj.attachments.first.asset.url, width: "100", height: "100") if obj.attachments.present?
          end
          column :name
          column :image_type
          column :price
          column :created_at
          actions
        end
			end
		end
	end
end