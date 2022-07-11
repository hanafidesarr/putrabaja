module CategoryAdmin
	module Index
		def self.included(base)
			base.instance_eval do
        index do
          selectable_column
          id_column
          column :name
          actions
        end
			end
		end
	end
end