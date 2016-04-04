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

  def edit
    @product = Product.find(params[:id])  
  end

  def update
    @product = Product.find(params[:id])

    respond_to do |format|
      if @product.update_attributes(product_params)
        flash[:success] = "Product, Successfully updated"
        format.html { redirect_to business_products_path(session[:business_id]) }
      else
        flash[:error] = "Sorry, Unable to add the new product because
          #{@product.errors.full_messages.to_sentence}"
        format.html { render action: "edit" }
      end
    end   
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    flash[:success] = "Product(#{@product.name}), Successfully deleted"
    redirect_to business_products_path(session[:business_id])
  end


  private

  def product_params
    params.require(:product).permit(:name, :unit_price, :description,
      :business_id)
  end
end
