module SettingAdmin
  module Controller
    def self.included(base)
      base.instance_eval do
        controller do
          def new
            @setting = Setting.new
          end
          def create
            create! { admin_settings_url }
          end 

          def update
            update! { edit_admin_setting_url }
          end 
        end
      end
    end
  end
end
