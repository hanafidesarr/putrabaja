class PagesController < ApplicationController
	def show
		@page = Page.find_by(id: params[:id]) || Page.first
		
    @components = @page&.components.active if @page&.components.present?
	end
end
