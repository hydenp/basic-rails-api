class ProductController < ApplicationController
    # before_action :set_product, only: [:show, :update, :destroy]

    # get route for all products
    def index
      @product = Product.all

      render json: @product
    end




end