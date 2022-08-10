module SettingAdmin
	module Form
		def self.included(base)
			base.instance_eval do
				form do |f|
          div class: "setting-form" do
            tabs do
              tab 'General', style: "list-style-type: none;" do
                columns do
                  [:name, :email, :phone_1, :phone_2].each do |obj|
                    column do
                      f.input obj, input_html: {class: "w-100 form-control"}
                    end
                  end
                end
                columns do
                  [:address, :location].each do |obj|
                    
                    column do
                      f.input obj, input_html: {class: "w-100 form-control"}
                    end
                  end
                end
                columns do
                  column do
                    f.input :short_description, input_html: {class: "w-100 form-control"}
                  end
                end
                columns do
                  column do
                    f.input :description, input_html: {rows: 5, class: "w-100 form-control"}
                  end
                end
              end
              tab 'Media Social', style: "list-style-type: none;" do
                columns do
                  yaml_url_media_socials = HashWithIndifferentAccess.new(YAML.load_file Rails.root.join('config', 'setting.yml'))
                  yaml_url_media_socials[:url_media_socials].each do |obj|
                    column do
                      f.input obj, input_html: {class: "w-100 form-control"}
                    end
                  end
                end
                columns do
                  [:youtube_url, :map_url].each do |obj|
                    
                    column do
                      f.input obj, input_html: {class: "w-100 form-control"}
                    end
                  end
                end
              end
              tab 'Attachment' do
                f.has_many :attachments, allow_destroy: true, panel: false, heading: false, new_record: true, class: "col-2 mx-2" do |attach|
                  arbre do
                    attach.input :asset, :as => :file, label: false, :hint => attach.template.image_tag(attach.object.asset.url(:thumb), class: "w-100"), "data-placement"=>"top"
                  end
									attach.template.concat(Arbre::Context.new do
                    hr
										div class: "row" do
                      div class: "col-12" do
                        attach.template.render partial: "admin/admin_shared/image_upload", locals: {f: attach}
                      end
                    end
                  end.to_s)
                end
              end
            end
            f.actions
          end
				end
			end
		end
	end
end