class ExceptionsController < ApplicationController
  protect_from_forgery except: :not_found

  def not_found
    render status: 404
  end

end
