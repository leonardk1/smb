class DashboardController < ApplicationController
  before_action :authenticate_contact!
  def index
    session[:business_id] = current_contact.business.id
  end
end
