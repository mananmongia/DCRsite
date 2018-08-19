class ApplicationController < ActionController::Base
  include DeviseWhitelist
  include SetSource
  include CurrentUserConcern
  include DefaultPageContent

  before_action :copyright_generator
  def copyright_generator
    BottomCopyright::Renderer.copyright "Manan Mongia", "All Rigths Reserved"
  end
  
end

