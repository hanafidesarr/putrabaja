ActiveAdmin.register Component do
    menu false
    permit_params :email, :password, :password_confirmation,
    attachments_attributes: [:id, :asset, :content_type, :note, :title, :layout, :description, :_destroy]
  
    controller do
			# def new
			# 	@component = Component.new
			# end

      def create
        @component = Component.new(permitted_params[:component])
        super
      end
      
      def build_new_resource
        r = super
        r.assign_attributes(name: "new name")
        r
      end
    end

  
  end
  