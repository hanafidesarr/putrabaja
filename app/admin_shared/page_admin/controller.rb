module PageAdmin
	module Controller
		def self.included(base)
			base.instance_eval do
				controller do
					def index
					  @pages = collection.page(params[:page]).per(10)
					end
					
					def new
					  @page = Page.new
					end
				
					def create
					  @user = Page.new(page_params) ## Invoke user_params method
					  if @user.save
						redirect_to @user, notice: 'User was successfully created.' 
					  else
						render action: 'new'
					  end       
					end
					## ... 
				  
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
