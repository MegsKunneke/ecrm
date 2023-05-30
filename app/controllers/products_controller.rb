class ProductsController < ApplicationController
  before_action :set_product, only: [:edit, :update, :destroy]

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

def create
  @product = Product.new(product_params)
  if @product.save
    flash[:success] = "Product created successfully."
    redirect_to products_path
  else
    flash[:error] = "Failed to create product."
    puts @product.errors.full_messages # Add this line to print the validation errors to the console
    render :new
  end
end


  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to products_path, notice: "Product updated successfully."
    else
      flash.now[:alert] = "Failed to update product."
      render :edit
    end
  end

  def destroy
    @product.destroy
    redirect_to products_path, notice: "Product deleted successfully."
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :sku, :cost_price, :retail_price, :supplier, :inventory)
  end
end
