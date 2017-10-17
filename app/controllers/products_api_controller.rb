class ProductsApiController < BaseApiController
  def index
    render json: Product.all
  end
end
