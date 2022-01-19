module PageAdmin
	module Controller
		def self.included(base)
			base.instance_eval do

				member_action :add_children do
					@page = Page.find(params[:id])
					@page.children.create(title: "Children from #{@page.title}")
					# render  "pages/add_children"
					respond_to do | format |
						format.html  { redirect_to admin_pages_path, notice: "Success created" }
					end
					
				end

				controller do
					# def index
					#   @pages = collection.page(params[:page]).per(1)
					# end
					

					## ... 
					def update
						update! do |format|
							format.html { redirect_to edit_admin_page_path }
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
