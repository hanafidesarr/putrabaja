module ProductAdmin
  module Controller
    def self.included(base)
      base.instance_eval do
        controller do
          def new
            @product = Product.new
          end
          def create
            create! { admin_products_url }
          end 

          def update
            update! { edit_admin_product_url }
          end 
        end
      end
    end
  end
end
