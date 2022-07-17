class ExceptionsController < ApplicationController
  protect_from_forgery except: :not_found

  def not_found
  end

end
