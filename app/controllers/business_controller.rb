class BusinessController < ApplicationController
  before_action :authenticate_contact!
  layout 'login_registration', only: [:new, :create]

  def new
    @business = Business.new
  end

  def create
    @business = Business.new(business_params)
    respond_to do |format|
      if @business.save
        flash[:success] = "Business, Successfully Added"
        session[:business_id] = @business.id
        format.html { redirect_to business_path(session[:business_id]) }
      else
        flash[:error] = "Sorry, Unable to Register the Business
          because #{@business.errors.full_messages.to_sentence}"
        format.html { render action: "new" }
      end
    end
  end

  def show
    @business = Business.find(params[:id])
  end

  private

  def business_params
    params.require(:business).permit(:name, :address, :voice,
      :location, :vrn, :fax, :tin)
  end
end
