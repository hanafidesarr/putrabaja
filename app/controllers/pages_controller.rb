class PagesController < ApplicationController
	def show
		@page = Page.find_by(id: params[:id]) || Page.first
	end
end
