ActiveAdmin.register Component do
    permit_params :email, :password, :password_confirmation
  
    controller do
			def new
				@component = Component.new
			end
    end
  
  end
  