module SettingAdmin
	module Form
		def self.included(base)
			base.instance_eval do
				form do |f|

					tabs do
						tab 'General' do
							f.inputs 'General' do
                f.input :name
                f.input :email
                f.input :phone_1
                f.input :phone_2
                f.input :address
                f.input :location
                f.input :short_description
                f.input :description
							end
						end
						tab 'Media Social' do
							f.inputs 'Media Social' do
                yaml_url_media_socials = HashWithIndifferentAccess.new(YAML.load_file Rails.root.join('config', 'setting.yml'))
                yaml_url_media_socials[:url_media_socials].each do |x|
                  f.input x
                end
                hr
                f.input :youtube_url
                f.input :map_url
							end
						end
						tab 'Attachment' do
							f.inputs 'Attachment' do
                f.has_many :attachments, allow_destroy: true, new_record: true do |attach|
                  arbre do
									
                    div class: "row" do
  
                      div class: "col-3" do
                        if (url = attach.object.asset.url rescue nil).present?
                          image_tag(url, width: "100%")
                        end
  
                      end
                      div class: "col-3" do
                        attach.inputs do
                          attach.input :asset
                        end
                      end
                    end
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
									
