module ProductAdmin
  module Controller
    def self.included(base)
      base.instance_eval do
        controller do
          def new
            @product = Product.new
          end
        end
      end
    end
  end
end
