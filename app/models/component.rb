class Component < ApplicationRecord

  # scoped area
  default_scope { order(:position) }
  scope :active, -> { where(active: true) }

  # association area
  belongs_to :page
  has_many :images, class_name: "Image", as: "parent", dependent: :destroy

  # nested attribute form
  accepts_nested_attributes_for :images, allow_destroy: true

  # this method for sortable drag position model of component
  acts_as_list scope: :page

  # duplicate record
  amoeba do
    enable
    prepend :name => "Copy of "
  end

  # langs translate 
  
  translates :title, :link, :subtitle, :body, :slug, :fallbacks_for_empty_translations => true
  globalize_accessors :locales => I18n.available_locales, :attributes => [:title, :link, :subtitle, :body, :slug]
  

  collection_data = HashWithIndifferentAccess.new(YAML.load_file Rails.root.join('config', 'collection_data.yml'))

  COMPONENT_LAYOUT = collection_data["component_layout"]
  store :properties, coder: JSON
  after_initialize :add_accessors_for_content_attributes, if: -> { self.layout.present? }
  after_validation :set_slug, only: [:create, :update]

  def add_accessors_for_content_attributes
    component_yml = HashWithIndifferentAccess.new(YAML.load_file Rails.root.join("app","views", "components","#{self.layout}","#{self.layout}.yml"))
    singleton_class.class_eval do
      store_accessor :properties, component_yml[:properties]
      store_accessor :properties, component_yml[:active_fields]
    end
  end

  def to_param
    "#{id}-#{slug}"
  end
  
  private
  def set_slug
    self.slug = self.slug.present? ? self.slug.to_s.parameterize : self.title
  end 

end
