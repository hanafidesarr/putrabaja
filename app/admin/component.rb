ActiveAdmin.register Component do
    permit_params :email, :password, :password_confirmation
  
    controller do
			# def new
			# 	@component = Component.new
			# end

      def create
        binding.pry
        @component = Component.new(permitted_params[:component])
        super
      end
      
      def build_new_resource
        binding.pry
        r = super
        r.assign_attributes(name: "new name")
        r
      end
    end

  
  end
  