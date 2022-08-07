class ComponentsController < ApplicationController
  def update_position
    @component = Component.find(params[:id])
    @component.set_list_position(params[:position_update].to_i)
  end
end