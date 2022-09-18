class ComponentDecorator < Draper::Decorator
  delegate_all

  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       object.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end

  def set_coloumn(obj)
    case obj
    when "coloumn_desktop"
      if self.coloumn_desktop.present?  && (self.coloumn_desktop.to_i&.is_a? Integer)
        12 / self.coloumn_desktop.to_i
      else
        4
      end
    when "coloumn_mobile"
      if self.coloumn_mobile.present?  && (self.coloumn_desktop.to_i&.is_a? Integer)
        12 / self.coloumn_mobile.to_i
      else
        3
      end
    else
      nil
    end
  end
end
