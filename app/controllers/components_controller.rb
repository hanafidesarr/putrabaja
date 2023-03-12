class ComponentsController < ApplicationController
  def update_position
    @component = Component.find(params[:id])
    @component.set_list_position(params[:position_update].to_i)

    # Page.all.each do |todo_list|
    #   todo_list.components.order(:updated_at).each.with_index(1) do |todo_item, index|
    #     todo_item.update_column :position, index
    #   end
    # end
  end
end