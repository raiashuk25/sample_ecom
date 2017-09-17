class ProductsController < ApplicationController
  def index
    @products =Product.all
  end

  def new
    @product =Product.new
  end
  def create

  image_attributes = product_params[:image]
  product_params.delete(:image)
   @product =Product.new(product_params)
   if @product.save
  image_attributes[:photo].each do|image|

    img=Image.new(photo: image, product: @product)
    img.save(validate: false)
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
