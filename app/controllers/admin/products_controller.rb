module Admin
  class ProductsController < ApplicationController
    before_action :authenticate_user!

    def index
      products = Product.all

      render json: {
        products: products
      }
    end

    private

    def serialize_product(product)
      {
        id: product.id,
        title: product.title,
        slug: product.slug,
        description: product.desciption,
        price: product.price,
        old_price: product.old_price,
        created_at: product.created_at,
        updated_at: product.updated_at
      }
    end
  end
end