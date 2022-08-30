
module CategoryAdmin
  module Controller
    def self.included(base)
      base.instance_eval do

        controller do
					def index
					  @categories = Category.page(params[:page]).per(1000)
					end
          def new
            @category = Category.new
          end
          def edit
            @category = Category.find(params[:id])
          end
          def create
            create! { admin_categories_url }
          end 

          def update
            update! { edit_admin_category_url }
          end 

					def show
            @category = Category.find(params[:id])
					end
        end
      end
    end
  end
end
