module Frontendable
	extend ActiveSupport::Concern

	included do
    before_action :set_common_variables
	end

	private

		def set_common_variables
			@pages = Page.active.root_page
			@categories = Category.all
		end
end