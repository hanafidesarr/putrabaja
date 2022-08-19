module Frontendable

	extend ActiveSupport::Concern

	included do
    before_action :set_common_variables
	end

	private

	def set_common_variables
		@setting = Setting.first
		@pages = Page.order(:position).active.root_page
		@categories = Category.active
	end

end