class WelcomeController < ApplicationController
  def index  
    cookies[:curso] = "Ruby on Rails [COOKIES]"
    session[:curso] = "Ruby on Rails [SESSION]"
    @nome = params[:nome]
    @curso = "Rails"
  end
end
