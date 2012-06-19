class WelcomeController < ApplicationController
  layout 'marketing'

  def index

  end

  def test
    render :layout => "admin"

  end
end
