module ComponentAdmin
	module Controller
		def self.included(base)
			base.instance_eval do
				member_action :duplicate_record do
          @component = Component.find(params[:id])
          @component.dup.save
					respond_to do | format |
						format.html { redirect_to "/admin/pages?page_id=#{Page.last.id}" }
					end
				end

        controller do
          def create
            @component = Component.new(permitted_params[:component])
            super
          end
      
          def destroy
            destroy! { admin_pages_url }
          end 
      
          def build_new_resource
            r = super
            r.assign_attributes(name: "new name")
            r
          end
        end
			end
		end
	end
end
