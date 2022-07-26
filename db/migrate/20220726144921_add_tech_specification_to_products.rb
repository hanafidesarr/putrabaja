class AddTechSpecificationToProducts < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :tech_specification, :text
  end
end
