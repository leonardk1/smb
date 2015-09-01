class ProductsController < ApplicationController
  def index
    @products = Product.all   
  end

  def new
    @product = Product.new  
  end

  def create
    @product = Product.new(product_params)
    respond_to do |format|
      if @product.save
        flash[:success] = "Product, Successfully Added"
        format.html { redirect_to business_products_path(session[:business_id]) }
      else
        flash[:error] = "Sorry, Unable to add the new product because
          #{@product.errors.full_messages.to_sentence}"
        format.html { render action: "new" }
      end
    end   
  end

  private

  def product_params
    params.require(:product).permit(:name, :unit_price, :description,
      :business_id)
  end
end
