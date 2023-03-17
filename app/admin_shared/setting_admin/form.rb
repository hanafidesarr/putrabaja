module SettingAdmin
	module Form
		def self.included(base)
			base.instance_eval do
				form do |f|
          div class: "setting-form" do
            tabs do
              tab 'General', style: "list-style-type: none;" do
                panel "Global Setting" do
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
              end

              tab 'Style', style: "list-style-type: none;" do
                yml_setting = HashWithIndifferentAccess.new(YAML.load_file Rails.root.join('config', 'setting.yml'))
                panel "Body" do
                  columns do
                    column span: 2 do
                      yml_setting[:general_style].each do |obj|
                        case obj
                        when "font_combo"
                          f.input obj, label: "", as: :select, collection: Setting::COLLECTION_FONT_COMBO, input_html: {class: "form-control w-100 font-combo-select2", style: "width:100%"}
                        else
                          f.input obj, input_html: {class: "w-100 form-control"}
                        end
                      end
                    end
                  end
                end
              end

              tab 'Media Social', style: "list-style-type: none;" do
                panel "Media social" do
                  columns do
                    yml_setting = HashWithIndifferentAccess.new(YAML.load_file Rails.root.join('config', 'setting.yml'))
                    yml_setting[:url_media_socials].each do |obj|
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
              end

              tab 'Attachment' do
                panel "Image" do
                  f.has_many :images, allow_destroy: true, panel: false, heading: false, new_record: true, class: "col-2 mx-2" do |attach|
                    arbre do
                      attach.input :asset, :as => :file, label: false, :hint => attach.template.image_tag(attach.object.asset_url, class: "w-100"), "data-placement"=>"top"
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

              tab 'Meta SEO', style: "list-style-type: none;" do
                yml_setting = HashWithIndifferentAccess.new(YAML.load_file Rails.root.join('config', 'setting.yml'))
                panel "Meta SEO" do

                  yml_setting[:meta].each do |obj|
                    case obj
                    when "meta_description", "keywords", "meta_title"
                      f.input obj, as: :text, :input_html => { :class => "form-control w-100 mb-3", rows: 5 }
                    else
                      f.input obj, input_html: {class: "form-control w-100 mb-3"}
                    end
                  end
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

