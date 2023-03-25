class UsersController < ApplicationController
  layout 'application'
  def show
    @page = Page.find_by(layout: 'home')
    @user = User.find(params[:id])
  end
end