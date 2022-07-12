
module CategoryAdmin
  module Controller
    def self.included(base)
      base.instance_eval do
				member_action :show_product do
				end

        controller do
					def show_product
						@page = Category.find(params[:id])
						@products = @page.products
					end
					def index
					  @categories = Category.root.page(params[:page]).per(1000)
					end
          def new
            @category = Category.new
          end
					def show
            @category = Category.find(params[:id])
					end
        end
      end
    end
  end
end
