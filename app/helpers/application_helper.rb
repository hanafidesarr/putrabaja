module ApplicationHelper
  def device
    agent = request.user_agent
    return "tablet" if agent =~ /(tablet|ipad)|(android(?!.*mobile))/i
    return "mobile" if agent =~ /Mobile/
    return "desktop"
  end
  def arbre(&block)
    Arbre::Context.new({}, self, &block).to_s.html_safe
  end
end
