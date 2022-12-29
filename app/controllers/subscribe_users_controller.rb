class SubscribeUsersController < ApplicationController
  
  def show
  end

  def create
    @subscribe_user = SubscribeUser.new(subscribe_user_params)
    if @subscribe_user.save
      render :js => "Swal.fire('Terima kasih!','Kami akan memberikan penawaran terbaik untuk anda!','success')"
    else
      render :js => 'Swal.fire("Yah!","Pastikan di isi semua yah!","error")'
    end
  end
  
  def subscribe_user_params
    params.permit(:name, :phone, :email)
  end

end
