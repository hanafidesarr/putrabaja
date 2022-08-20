module ActiveAdmin
  module Views
    module Pages
      class Index < Base
				def render_index
          renderer_class = find_index_renderer_class(config[:as])
          paginator        = config.fetch(:paginator, true)
          download_links   = config.fetch(:download_links, active_admin_config.namespace.download_links)
          pagination_total = config.fetch(:pagination_total, true)
          per_page         = config.fetch(:per_page, active_admin_config.per_page)

          paginated_collection(collection, entry_name:       active_admin_config.resource_label,
                                           entries_name:     active_admin_config.plural_resource_label(count: collection_size),
                                           download_links:   download_links,
                                           paginator:        paginator,
                                           per_page:         per_page,
                                           pagination_total: pagination_total) do
            div class: 'index_content' do
              if params[:controller].eql?("admin/pages")
                columns do
                  column do
                    insert_tag(renderer_class, config, collection)
                  end
                  column span: 3 do
                    div class: "main-page-view"
                  end
                end
              else 
                insert_tag(renderer_class, config, collection)
              end
              
            end
          end
        end
			end
		end
	end
end