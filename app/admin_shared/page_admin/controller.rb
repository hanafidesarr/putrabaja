module PageAdmin
	module Controller
		def self.included(base)
			base.instance_eval do

				member_action :add_children do
					@page = Page.find(params[:id])
					@page.children.create(title: "Page")
					# render  "pages/add_children"
					respond_to do | format |
						# format.html  { redirect_to admin_pages_path, notice: "Success created" }
						format.html { redirect_to "/admin/pages?page_id=#{Page.last.id}" }
					end
				end

				member_action :edit_js do
					@page = Page.find(params[:id])
					respond_to do | format |
						format.js
					end
				end

				controller do
					# def index
					#   @pages = collection.page(params[:page]).per(1)
					# end
					

					## ... 
					def update
						update! do |format|
							format.html { redirect_to "/admin/pages?page_id=#{resource.id}" }
						end
					end
					private
					## Strong Parameters 
					def page_params
					  params.require(:page).permit(:title, :description, :position)
					end
				  end
			end
		end
	end
end
