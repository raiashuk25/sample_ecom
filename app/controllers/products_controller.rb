class ProductsController < ApplicationController
  def index
    @product =Product.all
  end

  def new
    @product =Product.new
  end
  def create
    image_attributes = product_params[:image]
    product_params.delete(:image)
   @product =Product.new(product_params)
   if @product.save
     image_attributes[:photo].each do |image|
       img=Image.create(photo: image, product: @product)
       img.save(validation: false)
     end
     redirect_to products_path
   else
     render :new
   end
  end

  def show
  end

  def edit
  end
  private
  def product_params
    params.require(:product).permit!
  end
end
