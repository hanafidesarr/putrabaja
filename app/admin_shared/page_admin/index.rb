module PageAdmin
	module Index
		def self.included(base)
			base.instance_eval do
				
				index :as => :sortable do
					label :title # item content
					h3 "Page list"
					hr
					actions defaults: false do |page|
						(link_to add_children_admin_page_path(page), class: "mx-2", "data-bs-toggle": "tooltip", "data-placement": "top", "data-html": true, title: "icon untuk menambah page di bawah <b>#{page.title}</b>" do icon('fas', 'plus') end) +
						(link_to edit_js_admin_page_path(page), remote: :true, class: "mx-2 text-success", "data-bs-toggle": "tooltip", "data-placement": "top", "data-html": true, title: "icon untuk meng-edit page <b>#{page.title}</b>" do icon('fas', 'edit') end) +

						# (link_to edit_admin_page_path(page), style: "margin: 0 0.5rem;" do icon('fas', 'edit') end) +
						(link_to admin_page_path(page), class: "mx-2 text-danger", :method => :delete, :data => {:confirm => "Apakah anda yakin untuk mengahapus page ini?"}, "data-bs-toggle": "tooltip", "data-placement": "top", "data-html": true, title: "icon untuk mengahapus page <b>#{page.title}</b>" do icon('fas', 'trash') end)
					end

					render "load_form"

				end
			end
		end
	end
end