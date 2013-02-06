class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate_client

  private
    def authenticate_client
      @client = Client.find_by_keyword( 'YAC' )
      render :status => :forbidden, :text => "Forbidden" unless @client
    end
end
