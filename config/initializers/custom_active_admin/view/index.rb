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
                    div class: "position-relative loading-page-admin", style: "z-index: 1000;" do
                      div class: "position-fixed", style:"left: 62%; top: 50%;transform: translate(-50%,-50%);" do
                        div class: "spinner-grow text-danger spinner-grow-xl" do
                          span class: "sr-only" do
                            "Loading"
                          end
                        end
                        div class: "spinner-grow text-danger spinner-grow-xl" do
                          span class: "sr-only" do
                            "Loading"
                          end
                        end
                        div class: "spinner-grow text-danger spinner-grow-xl" do
                          span class: "sr-only" do
                            "Loading"
                          end
                        end
                      end
                    end
                    div class: "main-page-view" do
                      h3 class:"text-center" do
                        "Page"
                      end
                      hr
                        
                      div class: "blank_slate_container", id: "dashboard_default_message" do
                        span class: "blank_slate" do
                          span I18n.t("active_admin.dashboard_welcome.welcome")
                          small I18n.t("active_admin.dashboard_welcome.call_to_action")
                        end
                      end 
                    end
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