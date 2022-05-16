class ApplicationController < ActionController::Base
    
    def favourite_text
       return  @favourite_exists ? "Un favourite" : "Favourite"
    end
    helper_method :favourite_text

  include Pundit::Authorization
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_back(fallback_location: root_path)
  end
end
