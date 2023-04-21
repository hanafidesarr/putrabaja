module ComponentAdmin
	module Controller
		def self.included(base)
			base.instance_eval do
				member_action :duplicate_record do
          @component = Component.find(params[:id])
          @component.amoeba_dup.save
					respond_to do | format |
						format.html { redirect_to "/admin/pages?page_id=#{params[:page_id]}" }
					end
				end

        controller do
          def create
            @component = Component.new(permitted_params[:component])
            super
          end
      
          def destroy
						destroy! do |format|
							format.html { redirect_to "/admin/pages?page_id=#{resource.page.id}" }
						end
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
