ActiveAdmin.register Page do
  include PageAdmin::Controller
	include PageAdmin::Index

  sortable tree: true,
            max_levels: 0,               # infinite indent levels
            protect_root: false,         # allow root items to be dragged
            sorting_attribute: :position,
            parent_method: :parent,
            children_method: :children,
            roots_method: :roots,
            roots_collection: nil,       # proc to specifiy retrieval of roots
            sortable: true,              # Disable sorting (use only 'tree' functionality)
            collapsible: false,          # show +/- buttons to collapse children
            start_collapsed: false      # when collapsible, start with all roots collapsed
  # index :as => :sortable do
  #   label :title # item content
  #   actions
  # end

  # index do
  #   id_column
  #   column :image_title
  #   actions
  # end

end