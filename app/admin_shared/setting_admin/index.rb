module SettingAdmin
	module Index
		def self.included(base)
			base.instance_eval do
        index do
          selectable_column
          id_column
          column :image do |setting|
            if (url = setting.images.active.last.asset.url rescue nil).present?
              image_tag url, style: "width:50px;"
            end
          end
          column :name
          column :email
          column :phone_1
          column :address
          actions
        end
			end
		end
	end
end